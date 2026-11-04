// GLB 以外の形式（OBJ・STL）での書き出しと、出典の文章と一緒に1つにまとめる zip。
// OBJ・STL はファイルの中に出典を書ききれない（STL はほぼ書けない）ので、必ずクレジットの文章ファイルと一緒に zip で出す。
import { GROUPS, MATERIALS, srgbToLinear } from './glb.js';
import type { MeshPart, ModelPiece, PartName } from './scene.js';

/** OBJ の材質名（.mtl の中の名前。どのソフトでも読めるよう英字にする） */
const MTL_IDS: Record<PartName, string> = {
  wall: 'wall',
  roof: 'roof',
  detail: 'detail',
  window: 'window',
  door: 'door',
  road: 'road',
  ground: 'ground',
};

function comment(text: string): string {
  return text
    .trimEnd()
    .split('\n')
    .map((l) => `# ${l}`.trimEnd())
    .join('\n');
}

/** 小数を短く書く（小数第6位まで。メートルなら 0.001 mm、ミリメートルなら 0.000001 mm） */
function num(v: number): string {
  const r = Math.round(v * 1e6) / 1e6;
  return Object.is(r, -0) ? '0' : String(r);
}

/** 部品ごとに、使う種類と三角形の集まりを並べる（GLB と同じ順） */
function* piecePartsOf(pieces: ModelPiece[]): Generator<{ piece: ModelPiece; partName: PartName; part: MeshPart }> {
  for (const group of GROUPS) {
    for (const piece of pieces) {
      if (piece.group !== group.name) continue;
      for (const partName of group.parts) {
        const part = piece.parts[partName];
        if (part.triangleCount > 0) yield { piece, partName, part };
      }
    }
  }
}

/** OBJ の o の名前（空白を含むと読めないソフトがあるので _ にする） */
function objName(name: string): string {
  return name.replace(/\s+/g, '_') || 'object';
}

/**
 * OBJ（文字のファイル）にする。単位・向きは GLB と同じ（メートル、+Y が上、-Z が北）。
 * 部品は GLB と同じ名前（Buildings・Roads・Ground、建物を1棟ずつ分けたときは建物の ID）の `o` に分け、
 * 材質は .mtl で色を付ける。同じ位置の頂点は1つにまとめる（Blender などで形がつながって見えるように）。
 */
export function toObj(
  pieces: ModelPiece[],
  credit: string,
  mtlFileName: string,
  unitNote = '単位：メートル。+Y が上、-Z が北。範囲の中心が原点、地面が高さ 0',
): string {
  const out: string[] = [];
  out.push(comment(credit));
  out.push(`# ${unitNote}`);
  out.push(`mtllib ${mtlFileName}`);
  const ids = new Map<string, number>();
  const vertexLines: string[] = [];
  const faceLines: string[] = [];
  let current: ModelPiece | null = null;
  for (const { piece, partName, part } of piecePartsOf(pieces)) {
    if (piece !== current) {
      faceLines.push(`o ${objName(piece.name)}`);
      current = piece;
    }
    faceLines.push(`usemtl ${MTL_IDS[partName]}`);
    const local: number[] = new Array(part.vertexCount);
    const p = part.positions;
    for (let i = 0; i < part.vertexCount; i++) {
      const key = `${num(p[i * 3]!)} ${num(p[i * 3 + 1]!)} ${num(p[i * 3 + 2]!)}`;
      let id = ids.get(key);
      if (id === undefined) {
        id = ids.size + 1;
        ids.set(key, id);
        vertexLines.push(`v ${key}`);
      }
      local[i] = id;
    }
    const idx = part.indices;
    for (let t = 0; t < idx.length; t += 3) {
      // 丸めで頂点が重なった（面積ほぼ 0 の）三角形も、三角形の数を GLB・STL とそろえるため残す
      faceLines.push(`f ${local[idx[t]!]!} ${local[idx[t + 1]!]!} ${local[idx[t + 2]!]!}`);
    }
  }
  // 大きな範囲では行数が数十万になり、push(...) の引数の数の上限を超えるので、つなげてから文字列にする
  return out.concat(vertexLines, faceLines).join('\n') + '\n';
}

/** OBJ の色の設定（.mtl） */
export function toMtl(pieces: ModelPiece[], credit: string): string {
  const out: string[] = [comment(credit)];
  const used = new Set<PartName>();
  for (const { partName } of piecePartsOf(pieces)) used.add(partName);
  for (const group of GROUPS) {
    for (const partName of group.parts) {
      if (!used.has(partName)) continue;
      const m = MATERIALS[partName];
      out.push('', `# ${m.name}`, `newmtl ${MTL_IDS[partName]}`);
      // GLB の色と同じ見え方にするため、glTF と同じく直線の色の値（linear）で書く
      out.push(`Kd ${m.color.map((c) => srgbToLinear(c).toFixed(4)).join(' ')}`);
      out.push('Ka 0 0 0', 'Ks 0 0 0', 'd 1', 'illum 1');
    }
  }
  return out.join('\n') + '\n';
}

/**
 * バイナリ形式の STL にする。単位・向きは GLB と同じ（メートル、+Y が上）。
 * zUp のときは、3Dプリンタ用の印刷ソフトの標準に合わせて +Z を上（+Y が北）にする（回転なので形・表裏は変わらない）。
 * STL には色がないので、すべての部品を1つの形にまとめる。
 * 先頭の 80 バイト（英数字のみ）に、出典が別のファイルにあることを書く。
 */
export function toStl(pieces: ModelPiece[], header: string, zUp = false): Uint8Array {
  let count = 0;
  for (const { part } of piecePartsOf(pieces)) count += part.triangleCount;
  const buf = new ArrayBuffer(84 + count * 50);
  const bytes = new Uint8Array(buf);
  const view = new DataView(buf);
  const ascii = header.replace(/[^\x20-\x7e]/g, '?').slice(0, 80);
  for (let i = 0; i < ascii.length; i++) bytes[i] = ascii.charCodeAt(i);
  view.setUint32(80, count, true);
  let o = 84;
  for (const { part } of piecePartsOf(pieces)) {
    const p = part.positions;
    const idx = part.indices;
    for (let t = 0; t < idx.length; t += 3) {
      const a = idx[t]! * 3, b = idx[t + 1]! * 3, c = idx[t + 2]! * 3;
      // 法線は三角形の頂点の並びから計算する
      const e1 = [p[b]! - p[a]!, p[b + 1]! - p[a + 1]!, p[b + 2]! - p[a + 2]!];
      const e2 = [p[c]! - p[a]!, p[c + 1]! - p[a + 1]!, p[c + 2]! - p[a + 2]!];
      let nx = e1[1]! * e2[2]! - e1[2]! * e2[1]!;
      let ny = e1[2]! * e2[0]! - e1[0]! * e2[2]!;
      let nz = e1[0]! * e2[1]! - e1[1]! * e2[0]!;
      const len = Math.hypot(nx, ny, nz) || 1;
      nx /= len; ny /= len; nz /= len;
      // +Y が上 → +Z が上：(x, y, z) → (x, -z, y)
      const put = (x: number, y: number, z: number) => {
        view.setFloat32(o, x, true);
        view.setFloat32(o + 4, zUp ? -z : y, true);
        view.setFloat32(o + 8, zUp ? y : z, true);
        o += 12;
      };
      put(nx, ny, nz);
      for (const v of [a, b, c]) put(p[v]!, p[v + 1]!, p[v + 2]!);
      view.setUint16(o, 0, true);
      o += 2;
    }
  }
  return bytes;
}

export type ModelFormat = 'glb' | 'obj' | 'stl';
export const MODEL_FORMATS: ModelFormat[] = ['glb', 'obj', 'stl'];

/** 「glb,obj」のような書き方を形式の一覧にする（空・重複は除く。知らない形式はエラー） */
export function parseFormats(text: string): ModelFormat[] {
  const out: ModelFormat[] = [];
  for (const raw of text.split(',')) {
    const f = raw.trim().toLowerCase();
    if (f === '') continue;
    if (!MODEL_FORMATS.includes(f as ModelFormat)) throw new Error(`形式 ${f} には対応していません（${MODEL_FORMATS.join(', ')}）`);
    if (!out.includes(f as ModelFormat)) out.push(f as ModelFormat);
  }
  if (out.length === 0) throw new Error(`形式を1つ以上指定してください（${MODEL_FORMATS.join(', ')}）`);
  return out;
}

/** STL の先頭（80バイト・英数字のみ）に書く文。出典の全文は、一緒に出すクレジットの文章ファイルにある */
export function stlHeader(creditFileName: string): string {
  const base = 'PLATEAU (MLIT Japan), modified. Credit: ';
  return /^[\x20-\x7e]*$/.test(creditFileName) && base.length + creditFileName.length <= 80
    ? base + creditFileName
    : base + '*_credit.txt';
}

// ---- zip（圧縮なしでまとめるだけ。依存を増やさないため自前で書く） ----

const CRC_TABLE = (() => {
  const t = new Uint32Array(256);
  for (let n = 0; n < 256; n++) {
    let c = n;
    for (let k = 0; k < 8; k++) c = c & 1 ? 0xedb88320 ^ (c >>> 1) : c >>> 1;
    t[n] = c >>> 0;
  }
  return t;
})();

export function crc32(data: Uint8Array): number {
  let c = 0xffffffff;
  for (let i = 0; i < data.length; i++) c = CRC_TABLE[(c ^ data[i]!) & 0xff]! ^ (c >>> 8);
  return (c ^ 0xffffffff) >>> 0;
}

export interface ZipEntry {
  name: string;
  data: Uint8Array | string;
}

/** 複数のファイルを1つの zip にする（圧縮なし。ファイル名は UTF-8） */
export function makeZip(entries: ZipEntry[], date = new Date()): Uint8Array {
  const enc = new TextEncoder();
  const dosTime = (date.getHours() << 11) | (date.getMinutes() << 5) | Math.floor(date.getSeconds() / 2);
  const dosDate = ((Math.max(1980, date.getFullYear()) - 1980) << 9) | ((date.getMonth() + 1) << 5) | date.getDate();
  const files = entries.map((e) => {
    const data = typeof e.data === 'string' ? enc.encode(e.data) : e.data;
    return { name: enc.encode(e.name), data, crc: crc32(data) };
  });
  let size = 22;
  for (const f of files) size += 30 + f.name.length + f.data.length + 46 + f.name.length;
  const out = new Uint8Array(size);
  const view = new DataView(out.buffer);
  let o = 0;
  const offsets: number[] = [];
  const header = (sig: number, central: boolean, f: (typeof files)[number], offset: number) => {
    view.setUint32(o, sig, true);
    o += 4;
    if (central) {
      view.setUint16(o, 20, true); // 作成したバージョン
      o += 2;
    }
    view.setUint16(o, 20, true); // 展開に必要なバージョン
    view.setUint16(o + 2, 0x0800, true); // ファイル名は UTF-8
    view.setUint16(o + 4, 0, true); // 圧縮なし
    view.setUint16(o + 6, dosTime, true);
    view.setUint16(o + 8, dosDate, true);
    view.setUint32(o + 10, f.crc, true);
    view.setUint32(o + 14, f.data.length, true);
    view.setUint32(o + 18, f.data.length, true);
    view.setUint16(o + 22, f.name.length, true);
    view.setUint16(o + 24, 0, true);
    o += 26;
    if (central) {
      view.setUint16(o, 0, true); // コメントの長さ
      view.setUint16(o + 2, 0, true); // ディスク番号
      view.setUint16(o + 4, 0, true); // 内部属性
      view.setUint32(o + 6, 0, true); // 外部属性
      view.setUint32(o + 10, offset, true);
      o += 14;
    }
    out.set(f.name, o);
    o += f.name.length;
  };
  for (const f of files) {
    offsets.push(o);
    header(0x04034b50, false, f, 0);
    out.set(f.data, o);
    o += f.data.length;
  }
  const centralStart = o;
  files.forEach((f, i) => header(0x02014b50, true, f, offsets[i]!));
  const centralSize = o - centralStart;
  view.setUint32(o, 0x06054b50, true);
  view.setUint16(o + 4, 0, true);
  view.setUint16(o + 6, 0, true);
  view.setUint16(o + 8, files.length, true);
  view.setUint16(o + 10, files.length, true);
  view.setUint32(o + 12, centralSize, true);
  view.setUint32(o + 16, centralStart, true);
  view.setUint16(o + 20, 0, true);
  return out;
}
