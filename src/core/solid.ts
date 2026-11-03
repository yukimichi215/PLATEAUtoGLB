// 3Dプリンタ向けの「閉じた形」（穴やすき間のない立体）を作る計算。
// 建物の屋根の面（箱型なら上の面）を真下へ押し出して、上・下・側面のそろった柱にする。
// 柱どうしは重なってもよい（印刷ソフトが1つの立体にまとめる）。1本1本の柱は必ず閉じた形にする。
import earcut from 'earcut';

/** 閉じた形（三角形の頂点番号は positions の中の番号。表は外向き） */
export interface Solid {
  /** x, y, z の並び */
  positions: number[];
  indices: number[];
}

/** 近すぎる点（同じ点の繰り返し）を除く。最後の点と最初の点が同じときも除く */
function cleanRing(ring: number[], eps = 1e-3): number[] {
  const out: number[] = [];
  const n = ring.length / 3;
  for (let i = 0; i < n; i++) {
    const x = ring[i * 3]!, y = ring[i * 3 + 1]!, z = ring[i * 3 + 2]!;
    const m = out.length;
    if (m >= 3 && Math.hypot(x - out[m - 3]!, z - out[m - 1]!) < eps) continue;
    out.push(x, y, z);
  }
  while (out.length >= 6 && Math.hypot(out[0]! - out[out.length - 3]!, out[2]! - out[out.length - 1]!) < eps) {
    out.splice(out.length - 3, 3);
  }
  return out.length >= 9 ? out : [];
}

/** 上（+Y）から見たときの向き。正なら、三角形を +Y 向きに並べたときの外周と同じ向き */
function ringNy(ring: number[]): number {
  let ny = 0;
  const n = ring.length / 3;
  for (let i = 0; i < n; i++) {
    const j = (i + 1) % n;
    ny += (ring[i * 3 + 2]! - ring[j * 3 + 2]!) * (ring[i * 3]! + ring[j * 3]!);
  }
  return ny;
}

/** 上から見た面積（m²）。近すぎる点は除いて数える */
export function footprintArea(ring: number[]): number {
  const r = cleanRing(ring);
  return r.length === 0 ? 0 : Math.abs(ringNy(r)) / 2;
}

/** これより上から見た面積が小さい面（10 cm 角ほど。壁のような面や、ごく小さな飾り）は柱にしない */
export const MIN_FOOTPRINT_M2 = 0.01;

function reverseRing(ring: number[]): number[] {
  const out: number[] = [];
  for (let i = ring.length - 3; i >= 0; i -= 3) out.push(ring[i]!, ring[i + 1]!, ring[i + 2]!);
  return out;
}

/**
 * 多角形（穴あり。x, 高さ, z の並び）を、高さ bottomY まで真下へ押し出した柱にする。
 * 上の面は元の多角形の高さのまま（傾いた屋根もそのまま）、下の面は平ら。
 * 上から見て面積がほとんどない面（壁のような面）や、閉じた形にできないものは null。
 */
export function extrudeDown(exterior: number[], interiors: number[][], bottomY: number): Solid | null {
  let ext = cleanRing(exterior);
  if (ext.length === 0) return null;
  const nyExt = ringNy(ext);
  if (Math.abs(nyExt) / 2 < MIN_FOOTPRINT_M2) return null;
  if (nyExt < 0) ext = reverseRing(ext);
  const rings: number[][] = [ext];
  for (const h of interiors) {
    let hole = cleanRing(h);
    if (hole.length === 0 || Math.abs(ringNy(hole)) / 2 < MIN_FOOTPRINT_M2) continue;
    if (ringNy(hole) > 0) hole = reverseRing(hole); // 穴は外周と逆向き
    rings.push(hole);
  }

  const top: number[] = [];
  const holeStarts: number[] = [];
  for (const [k, r] of rings.entries()) {
    if (k > 0) holeStarts.push(top.length / 3);
    for (const c of r) top.push(c);
  }
  const n = top.length / 3;
  const flat: number[] = [];
  for (let i = 0; i < n; i++) flat.push(top[i * 3]!, top[i * 3 + 2]!);
  const tri = earcut(flat, holeStarts.length > 0 ? holeStarts : undefined, 2);
  if (tri.length === 0) return null;

  const positions = [...top];
  for (let i = 0; i < n; i++) positions.push(top[i * 3]!, bottomY, top[i * 3 + 2]!);
  const indices: number[] = [];
  for (let t = 0; t < tri.length; t += 3) {
    let a = tri[t]!, b = tri[t + 1]!, c = tri[t + 2]!;
    // 上から見た向きで +Y を向くようにそろえる
    const cy = (flat[b * 2 + 1]! - flat[a * 2 + 1]!) * (flat[c * 2]! - flat[a * 2]!) -
      (flat[b * 2]! - flat[a * 2]!) * (flat[c * 2 + 1]! - flat[a * 2 + 1]!);
    if (cy < 0) [b, c] = [c, b];
    indices.push(a, b, c); // 上の面
    indices.push(a + n, c + n, b + n); // 下の面（裏向き＝下向き）
  }
  // 側面：外周は上から見て上の面と同じ向き、穴は逆向きに並べてあるので、どの辺も同じ式でよい
  let start = 0;
  for (const r of rings) {
    const m = r.length / 3;
    for (let i = 0; i < m; i++) {
      const ti = start + i;
      const tj = start + ((i + 1) % m);
      indices.push(tj, ti, ti + n);
      indices.push(tj, ti + n, tj + n);
    }
    start += m;
  }
  const solid = { positions, indices };
  return isClosed(solid.positions, solid.indices) ? solid : null;
}

/** 箱（閉じた形・外向き） */
export function box(minX: number, maxX: number, minY: number, maxY: number, minZ: number, maxZ: number): Solid {
  const ring = [minX, maxY, minZ, minX, maxY, maxZ, maxX, maxY, maxZ, maxX, maxY, minZ];
  return extrudeDown(ring, [], minY)!;
}

function key(positions: number[], i: number): string {
  return `${positions[i * 3]},${positions[i * 3 + 1]},${positions[i * 3 + 2]}`;
}

/**
 * 閉じた形か（穴やすき間がなく、面の表裏がそろっているか）を調べる。
 * 同じ位置の頂点は1つとみなし、どの辺も「行き」と「帰り」の三角形が同じ数だけあれば閉じている。
 * 開いている辺の数を返す（0 なら閉じている）。
 */
export function countOpenEdges(positions: number[] | Float32Array, indices: number[] | Uint32Array): number {
  const pos = Array.from(positions);
  const ids = new Map<string, number>();
  const id = (i: number) => {
    const k = key(pos, i);
    let v = ids.get(k);
    if (v === undefined) {
      v = ids.size;
      ids.set(k, v);
    }
    return v;
  };
  const balance = new Map<string, number>();
  for (let t = 0; t < indices.length; t += 3) {
    const v = [id(indices[t]!), id(indices[t + 1]!), id(indices[t + 2]!)];
    for (let e = 0; e < 3; e++) {
      const a = v[e]!, b = v[(e + 1) % 3]!;
      if (a === b) continue;
      const k = a < b ? `${a}_${b}` : `${b}_${a}`;
      balance.set(k, (balance.get(k) ?? 0) + (a < b ? 1 : -1));
    }
  }
  let open = 0;
  for (const v of balance.values()) if (v !== 0) open++;
  return open;
}

/**
 * 3つ以上の面が共有する辺の数（同じ位置の頂点は1つとみなす）。
 * 0 なら、どの辺もちょうど2つ（以下）の面が共有する。閉じた形の部品どうしが辺や点だけで接していると数える。
 */
export function countNonManifoldEdges(positions: ArrayLike<number>, indices: ArrayLike<number>): number {
  const ids = new Map<string, number>();
  const id = (i: number) => {
    const k = `${positions[i * 3]},${positions[i * 3 + 1]},${positions[i * 3 + 2]}`;
    let v = ids.get(k);
    if (v === undefined) ids.set(k, (v = ids.size));
    return v;
  };
  const uses = new Map<string, number>();
  for (let t = 0; t < indices.length; t += 3) {
    const v = [id(indices[t]!), id(indices[t + 1]!), id(indices[t + 2]!)];
    for (let e = 0; e < 3; e++) {
      const a = v[e]!, b = v[(e + 1) % 3]!;
      if (a === b) continue;
      const k = a < b ? `${a}_${b}` : `${b}_${a}`;
      uses.set(k, (uses.get(k) ?? 0) + 1);
    }
  }
  let n = 0;
  for (const u of uses.values()) if (u > 2) n++;
  return n;
}

export function isClosed(positions: number[], indices: number[]): boolean {
  return countOpenEdges(positions, indices) === 0;
}
