// 「場所と広さ → 必要なファイルを調べる → 読む → GLB にする」の流れ。
// 画面（ブラウザ）からもコマンド（Node.js）からも同じものを使う。
import { findSourceFiles, type FeatureType, type FetchJson, type SourceFile } from './catalog.js';
import { readCityGml } from './citygml.js';
import { buildCredit, LICENSE_TEXT, type UsedFile } from './credit.js';
import { LocalProjector, meshCodesForBox, type LatLon } from './geo.js';
import { buildGlb } from './glb.js';
import { SceneBuilder, type BuildingInfo } from './scene.js';

export const MIN_SIZE = 50;
export const MAX_SIZE = 1000;
const UNKNOWN_SIZE_GUESS = 20e6;

export interface AreaRequest {
  center: LatLon;
  /** 切り出す正方形の一辺（m） */
  size: number;
  lod: 1 | 2;
  includeRoads: boolean;
  includeGround: boolean;
  /** 場所の名前（表示・記録用） */
  placeName?: string;
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
}

export interface GenerateResult {
  glb: Uint8Array;
  credit: string;
  copyright: string;
  stats: GenerateStats;
  buildings: BuildingInfo[];
  fileName: string;
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
  const scene = new SceneBuilder({ projector, half: req.size / 2, lod: req.lod });
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
  if (req.includeGround) scene.addGround();

  onProgress({ ratio: 1, message: 'GLB を作成中…' });
  const createdAt = today();
  const place = req.placeName?.trim() || `${req.center.lat.toFixed(5)},${req.center.lon.toFixed(5)}`;
  const description = `「${place}」を中心に一辺 ${req.size} m の範囲を切り出し（中心 緯度 ${req.center.lat.toFixed(6)}・経度 ${req.center.lon.toFixed(6)}）、${req.lod === 1 ? '箱型（LOD1）' : '屋根の形あり（LOD2）'}の建物にする`;
  const credit = buildCredit(used, { description, createdAt });

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
        origin: '範囲の中心・地面の高さ0。単位はメートル、+Y が上、-Z が北',
      },
      createdAt,
    },
  };

  const glb = await buildGlb({ parts: scene.parts, copyright: credit.short, extras, name: `PLATEAU_${safeFileName(place)}` });

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
    credit: credit.text,
    copyright: credit.short,
    buildings: scene.buildings,
    fileName: `plateau_${safeFileName(place)}_${req.size}m_lod${req.lod}`,
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
    },
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
