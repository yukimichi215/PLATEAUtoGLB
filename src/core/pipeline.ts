// 「場所と広さ → 必要なファイルを調べる → 読む → GLB にする」の流れ。
// 画面（ブラウザ）からもコマンド（Node.js）からも同じものを使う。
import { findSourceFiles, type FeatureType, type FetchJson, type SourceFile } from './catalog.js';
import { readCityGml } from './citygml.js';
import { buildCredit, LICENSE_TEXT, type UsedFile } from './credit.js';
import { LocalProjector, meshCodesForBox, type LatLon } from './geo.js';
import { makeZip, stlHeader, toMtl, toObj, toStl } from './export.js';
import { buildGlb } from './glb.js';
import { finishForPrint, ROAD_PRINT_MM, scaleParts, validatePrint, type PrintInfo, type PrintOptions } from './print.js';
import { SceneBuilder, type BuildingInfo } from './scene.js';

export const MIN_SIZE = 50;
export const MAX_SIZE = 1000;
export const MIN_HEIGHT_SCALE = 1;
export const MAX_HEIGHT_SCALE = 3;
const UNKNOWN_SIZE_GUESS = 20e6;

export interface AreaRequest {
  center: LatLon;
  /** 切り出す正方形の一辺（m） */
  size: number;
  /** 1 = 箱型、2 = 屋根の形あり、3 = 窓・扉まで（試作。LOD3 のない建物は LOD2 → LOD1 で代用） */
  lod: 1 | 2 | 3;
  /** ベランダ・ひさし・屋上の設備などの付属物を入れる（LOD2・LOD3 のとき） */
  installations?: boolean;
  includeRoads: boolean;
  includeGround: boolean;
  /** 場所の名前（表示・記録用） */
  placeName?: string;
  /**
   * 3Dプリンタ用にする（縮尺・台座・閉じた形）。指定しないときは実物の大きさ（メートル）のまま。
   * 3Dプリンタ用のときは付属物・窓・扉・地面の板は入れない（台座が地面の代わり）。
   */
  print?: PrintOptions;
  /** 建物の高さだけを何倍にするか（高さの強調。1〜3。指定しないときは 1）。幅・奥行き・道路・台座の厚さは変えない */
  heightScale?: number;
}

export interface AreaPlan {
  request: AreaRequest;
  meshes: string[];
  files: SourceFile[];
  /** 読む必要のあるデータの合計（展開後のバイト数。大きさが分からないファイルは含まない） */
  totalBytes: number;
  /** 大きさが分からないファイルの数（データカタログに大きさが載っていないことがある） */
  unknownSizeFiles: number;
}

export function validateRequest(req: AreaRequest): void {
  const { lat, lon } = req.center;
  if (!(lat >= 20 && lat <= 46 && lon >= 122 && lon <= 154)) {
    throw new Error('場所が日本の範囲の外です。緯度・経度を確かめてください。');
  }
  if (!(req.size >= MIN_SIZE && req.size <= MAX_SIZE)) {
    throw new Error(`広さは ${MIN_SIZE}〜${MAX_SIZE} m の範囲で指定してください。`);
  }
  if (req.print) validatePrint(req.print);
  const k = req.heightScale ?? 1;
  if (!(k >= MIN_HEIGHT_SCALE && k <= MAX_HEIGHT_SCALE)) {
    throw new Error(`高さの強調は ${MIN_HEIGHT_SCALE}〜${MAX_HEIGHT_SCALE} 倍の範囲で指定してください。`);
  }
}

export async function planArea(req: AreaRequest, fetchJson: FetchJson): Promise<AreaPlan> {
  validateRequest(req);
  const projector = new LocalProjector(req.center);
  const meshes = meshCodesForBox(projector.boxAround(req.size / 2));
  const types: FeatureType[] = req.includeRoads ? ['bldg', 'tran'] : ['bldg'];
  const files = await findSourceFiles(meshes, types, fetchJson);
  const totalBytes = files.reduce((s, f) => s + f.fileSize, 0);
  const unknownSizeFiles = files.filter((f) => !(f.fileSize > 0)).length;
  return { request: req, meshes, files, totalBytes, unknownSizeFiles };
}

/** ファイルの中身を文字列の流れとして開く。読んだバイト数を onBytes で知らせる */
export type OpenText = (file: SourceFile, onBytes: (bytes: number) => void) => Promise<AsyncIterable<string>>;

export interface Progress {
  /** 0〜1 */
  ratio: number;
  message: string;
}

export interface GenerateStats {
  buildings: number;
  roads: number;
  triangles: number;
  vertices: number;
  glbBytes: number;
  /** モデルの外形（m） */
  width: number;
  depth: number;
  height: number;
  skippedBuildings: number;
  /** 付属物（ベランダなど）を入れた建物の数 */
  buildingsWithInstallations: number;
  /** 窓・扉まである形（LOD3）で入れた建物の数 */
  lod3Buildings: number;
  /** 3Dプリンタ用のとき：縮尺・印刷したときの大きさ（mm） */
  print?: PrintInfo;
}

export interface GenerateResult {
  glb: Uint8Array;
  /** OBJ（文字）。色は mtl。どちらも先頭に出典を書いてある */
  obj: string;
  mtl: string;
  /** バイナリ形式の STL */
  stl: Uint8Array;
  credit: string;
  copyright: string;
  stats: GenerateStats;
  buildings: BuildingInfo[];
  fileName: string;
}

/** 建物の細かさの名前（記録・出典の説明用） */
export function detailLabel(req: AreaRequest): string {
  if (req.print) {
    return req.lod === 1 ? '箱型（LOD1）' : `屋根の形あり（LOD${req.lod === 3 ? '3 の屋根' : '2'}）`;
  }
  if (req.lod === 1) return '箱型（LOD1）';
  if (req.lod === 3) {
    return `窓・扉まである形（LOD3。LOD3 のない建物は屋根の形〔LOD2〕で代用${req.installations ? '、付属物あり' : ''}）`;
  }
  return req.installations ? '屋根の形とベランダなどの付属物あり（LOD2）' : '屋根の形あり（LOD2）';
}

/** ファイル名に付ける細かさの印 */
function detailCode(req: AreaRequest): string {
  if (req.print) return `lod${req.lod}_print`;
  if (req.lod === 3) return req.installations ? 'lod3plus' : 'lod3';
  return req.lod === 1 ? 'lod1' : req.installations ? 'lod2plus' : 'lod2';
}

function today(): string {
  return new Date().toISOString().slice(0, 10);
}

/** ファイル名に使えない文字を除く */
export function safeFileName(s: string): string {
  return s.replace(/[\\/:*?"<>|\s]+/g, '_').replace(/^_+|_+$/g, '').slice(0, 40) || 'area';
}

export async function generateFromPlan(
  plan: AreaPlan,
  openText: OpenText,
  onProgress: (p: Progress) => void = () => {},
): Promise<GenerateResult> {
  const req = plan.request;
  const bldgFiles = plan.files.filter((f) => f.type === 'bldg');
  if (bldgFiles.length === 0) {
    throw new Error('この場所には PLATEAU の建物データがありません（まだ整備されていない地域の可能性があります）。');
  }
  const projector = new LocalProjector(req.center);
  const scene = new SceneBuilder({
    projector,
    half: req.size / 2,
    lod: req.lod,
    installations: !req.print && req.lod >= 2 && req.installations === true,
    solid: req.print !== undefined,
    heightScale: req.heightScale ?? 1,
  });
  const used: UsedFile[] = [];

  // 進み具合の重み。大きさが分からないファイルは仮に 20MB とみなす
  const weightOf = (f: SourceFile) => (f.fileSize > 0 ? f.fileSize : UNKNOWN_SIZE_GUESS);
  const total = Math.max(1, plan.files.reduce((s, f) => s + weightOf(f), 0));
  let doneBytes = 0;
  for (const [i, file] of plan.files.entries()) {
    const label = `${i + 1}/${plan.files.length} ${file.type === 'bldg' ? '建物' : '道路'}データ（メッシュ ${file.mesh}）`;
    onProgress({ ratio: doneBytes / total, message: `${label} を読み込み中…` });
    const cityCodes = new Set<string>();
    let count = 0;
    let fileBytes = 0;
    const chunks = await openText(file, (n) => {
      fileBytes += n;
      onProgress({
        ratio: Math.min(1, (doneBytes + Math.min(fileBytes, weightOf(file))) / total),
        message: `${label} を読み込み中… ${(fileBytes / 1e6).toFixed(0)} / ${file.fileSize > 0 ? (file.fileSize / 1e6).toFixed(0) : '?'} MB`,
      });
    });
    await readCityGml(chunks, {
      onBuilding: (b) => {
        if (scene.addBuilding(b)) {
          count++;
          if (b.attrs.city) cityCodes.add(b.attrs.city);
        }
      },
      onRoad: (r) => {
        if (scene.addRoad(r)) count++;
      },
    });
    doneBytes += weightOf(file);
    if (count > 0) used.push({ file, cityCodes });
  }

  if (scene.buildings.length === 0) {
    throw new Error('指定した範囲に建物が見つかりませんでした。場所か広さを変えてみてください。');
  }
  const print = req.print ? await finishForPrint(scene, req.size / 2, req.print) : undefined;
  if (!req.print && req.includeGround) scene.addGround();

  onProgress({ ratio: 1, message: '3D モデルを作成中…' });
  const createdAt = today();
  const place = req.placeName?.trim() || `${req.center.lat.toFixed(5)},${req.center.lon.toFixed(5)}`;
  const detail = detailLabel(req);
  const description = `「${place}」を中心に一辺 ${req.size} m の範囲を切り出し（中心 緯度 ${req.center.lat.toFixed(6)}・経度 ${req.center.lon.toFixed(6)}）、${detail}の建物にする`;
  const processing = print
    ? [
        `3Dプリンタ用に、縮尺 ${print.scaleLabel}（印刷したときの大きさ 幅 ${print.widthMm} × 奥行き ${print.depthMm} × 高さ ${print.heightMm} mm）にする`,
        '建物は屋根の面を真下へ押し出した閉じた形に作り直す（壁の細かな形・付属物・窓・扉は省く）',
        `道路は厚さ ${ROAD_PRINT_MM} mm の板にする`,
        ...(print.baseMm > 0 ? [`厚さ ${print.baseMm} mm の台座を加え、建物・道路の下端を台座に食い込ませる`] : []),
        ...(print.droppedFaces > 0 ? [`元データの形がくずれていて閉じた形にできない面 ${print.droppedFaces} 枚を省く`] : []),
      ]
    : [];
  const heightScale = req.heightScale ?? 1;
  if (heightScale !== 1) processing.unshift(`建物の高さだけを ${heightScale} 倍に強調する（幅・奥行きは元のまま）`);
  const credit = buildCredit(used, { description, createdAt, processing });

  const extras = {
    plateau: {
      attribution: credit.short,
      license: LICENSE_TEXT,
      modified: true,
      notice: '国土交通省・各自治体が作成したものではありません。PLATEAUtoGLB で加工して作成。',
      sources: credit.sources.map((s) => ({
        city: s.cityName,
        cityCode: s.cityCode,
        year: s.year,
        datasets: s.datasets,
        urls: s.urls,
      })),
      area: {
        place,
        centerLat: req.center.lat,
        centerLon: req.center.lon,
        sizeMeters: req.size,
        lod: req.lod,
        installations: !req.print && req.lod >= 2 && req.installations === true,
        heightScale,
        origin: print
          ? '範囲の中心・台座の上面が高さ0。単位はメートル（縮尺をかけた大きさ）、+Y が上、-Z が北'
          : '範囲の中心・地面の高さ0。単位はメートル、+Y が上、-Z が北',
        ...(print
          ? { print: { scale: print.scaleLabel, mmPerMeter: print.mmPerMeter, baseMm: print.baseMm, sizeMm: [print.widthMm, print.depthMm, print.heightMm] } }
          : {}),
      },
      createdAt,
    },
  };

  // 3Dプリンタ用：GLB はメートル（glTF の決まり）で縮尺をかけた大きさ、OBJ・STL はミリメートル（印刷ソフトの標準）
  const glbParts = print ? scaleParts(scene.parts, print.mmPerMeter / 1000) : scene.parts;
  const meshParts = print ? scaleParts(scene.parts, print.mmPerMeter) : scene.parts;
  const glb = await buildGlb({ parts: glbParts, copyright: credit.short, extras, name: `PLATEAU_${safeFileName(place)}` });
  const fileName = `plateau_${safeFileName(place)}_${req.size}m_${detailCode(req)}${heightScale !== 1 ? `_h${heightScale}x` : ''}`;
  const obj = toObj(
    meshParts,
    credit.text,
    `${fileName}.mtl`,
    print ? `単位：ミリメートル（縮尺 ${print.scaleLabel}）。+Y が上、-Z が北。範囲の中心が原点、台座の上面が高さ 0` : undefined,
  );
  const mtl = toMtl(meshParts, credit.text);
  const stl = toStl(meshParts, stlHeader(`${fileName}_credit.txt`), print !== undefined);

  // 外形
  let minX = Infinity, maxX = -Infinity, minY = Infinity, maxY = -Infinity, minZ = Infinity, maxZ = -Infinity;
  let triangles = 0;
  let vertices = 0;
  for (const part of Object.values(scene.parts)) {
    triangles += part.triangleCount;
    vertices += part.vertexCount;
    const p = part.positions;
    for (let i = 0; i < p.length; i += 3) {
      minX = Math.min(minX, p[i]!); maxX = Math.max(maxX, p[i]!);
      minY = Math.min(minY, p[i + 1]!); maxY = Math.max(maxY, p[i + 1]!);
      minZ = Math.min(minZ, p[i + 2]!); maxZ = Math.max(maxZ, p[i + 2]!);
    }
  }
  const r1 = (v: number) => Math.round(v * 10) / 10;
  return {
    glb,
    obj,
    mtl,
    stl,
    credit: credit.text,
    copyright: credit.short,
    buildings: scene.buildings,
    fileName,
    stats: {
      buildings: scene.buildings.length,
      roads: scene.roadCount,
      triangles,
      vertices,
      glbBytes: glb.byteLength,
      width: r1(maxX - minX),
      depth: r1(maxZ - minZ),
      height: r1(maxY - minY),
      skippedBuildings: scene.skippedBuildings,
      buildingsWithInstallations: scene.buildingsWithInstallations,
      lod3Buildings: scene.lod3Buildings,
      print,
    },
  };
}

export type DownloadKind = 'glb' | 'obj' | 'stl' | 'all' | 'credit';

export interface DownloadFile {
  name: string;
  data: Uint8Array;
  mime: string;
}

/**
 * 保存するファイル。OBJ・STL はファイルの中に出典を書ききれないので、
 * クレジットの文章ファイルと一緒に zip にする（出典がファイルから離れないように）。
 * GLB は中に出典を書いてあるので、そのまま（クレジットの文章は別に保存できる）。
 */
export function downloadFiles(result: GenerateResult): Record<DownloadKind, DownloadFile> {
  const base = result.fileName;
  const credit = { name: `${base}_credit.txt`, data: new TextEncoder().encode(result.credit) };
  const glb = { name: `${base}.glb`, data: result.glb };
  const obj = [
    { name: `${base}.obj`, data: result.obj },
    { name: `${base}.mtl`, data: result.mtl },
  ];
  const stl = { name: `${base}.stl`, data: result.stl };
  const zip = 'application/zip';
  return {
    glb: { ...glb, mime: 'model/gltf-binary' },
    obj: { name: `${base}_obj.zip`, data: makeZip([...obj, credit]), mime: zip },
    stl: { name: `${base}_stl.zip`, data: makeZip([stl, credit]), mime: zip },
    all: { name: `${base}_all.zip`, data: makeZip([glb, ...obj, stl, credit]), mime: zip },
    credit: { ...credit, mime: 'text/plain;charset=utf-8' },
  };
}

/** 標準の fetch を使って JSON を取る */
export const defaultFetchJson: FetchJson = async (url) => {
  const res = await fetch(url);
  if (!res.ok) throw new Error(`PLATEAU データカタログへの問い合わせに失敗しました（${res.status}）`);
  return res.json();
};

/** Response の本文を、文字列の流れにする（読んだバイト数を知らせる） */
export async function* responseText(res: Response, onBytes: (n: number) => void): AsyncIterable<string> {
  if (!res.body) throw new Error('データの本文がありません');
  const reader = res.body.getReader();
  const decoder = new TextDecoder('utf-8');
  for (;;) {
    const { done, value } = await reader.read();
    if (done) break;
    onBytes(value.byteLength);
    yield decoder.decode(value, { stream: true });
  }
  const rest = decoder.decode();
  if (rest) yield rest;
}
