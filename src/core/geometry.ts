// 多角形を三角形に分ける、範囲で切り取るなどの形の計算。
import earcut from 'earcut';

export type Vec3 = [number, number, number];

/** 多角形（ローカル座標 x, y, z の並び）の法線（Newell の方法、正規化前） */
export function newellNormal(ring: number[]): Vec3 {
  let nx = 0;
  let ny = 0;
  let nz = 0;
  const n = ring.length / 3;
  for (let i = 0; i < n; i++) {
    const j = (i + 1) % n;
    const x0 = ring[i * 3]!, y0 = ring[i * 3 + 1]!, z0 = ring[i * 3 + 2]!;
    const x1 = ring[j * 3]!, y1 = ring[j * 3 + 1]!, z1 = ring[j * 3 + 2]!;
    nx += (y0 - y1) * (z0 + z1);
    ny += (z0 - z1) * (x0 + x1);
    nz += (x0 - x1) * (y0 + y1);
  }
  return [nx, ny, nz];
}

export function normalize(v: Vec3): Vec3 | null {
  const len = Math.hypot(v[0], v[1], v[2]);
  if (!(len > 1e-12)) return null;
  return [v[0] / len, v[1] / len, v[2] / len];
}

export interface Triangulated {
  /** 頂点（x, y, z の並び） */
  positions: number[];
  /** 三角形の頂点番号（positions 内の番号） */
  indices: number[];
  /** 面の向き（単位ベクトル） */
  normal: Vec3;
  /** 面積（m²） */
  area: number;
}

/**
 * 立体の中の平らな多角形（穴あり）を三角形に分ける。
 * 法線の一番大きい軸を消して2次元にし、earcut で分ける。
 * できた三角形の向き（表裏）は元の多角形の向きにそろえる。
 */
export function triangulatePolygon(exterior: number[], interiors: number[][] = []): Triangulated | null {
  const nv = newellNormal(exterior);
  const area = Math.hypot(nv[0], nv[1], nv[2]) / 2;
  const normal = normalize(nv);
  if (!normal || area < 1e-4) return null;

  const ax = Math.abs(normal[0]);
  const ay = Math.abs(normal[1]);
  const az = Math.abs(normal[2]);
  // 2次元にするときに使う2つの軸
  let u = 0;
  let v = 2;
  if (ax >= ay && ax >= az) {
    u = 1;
    v = 2;
  } else if (az >= ax && az >= ay) {
    u = 0;
    v = 1;
  }

  const positions: number[] = [...exterior];
  const holes: number[] = [];
  for (const hole of interiors) {
    if (hole.length < 9) continue;
    holes.push(positions.length / 3);
    for (const c of hole) positions.push(c);
  }
  const flat: number[] = [];
  for (let i = 0; i < positions.length; i += 3) {
    flat.push(positions[i + u]!, positions[i + v]!);
  }
  const tri = earcut(flat, holes.length > 0 ? holes : undefined, 2);
  if (tri.length === 0) return null;

  // 三角形ごとに向きを確かめ、逆なら入れ替える
  const indices: number[] = [];
  for (let t = 0; t < tri.length; t += 3) {
    const a = tri[t]!, b = tri[t + 1]!, c = tri[t + 2]!;
    const e1x = positions[b * 3]! - positions[a * 3]!;
    const e1y = positions[b * 3 + 1]! - positions[a * 3 + 1]!;
    const e1z = positions[b * 3 + 2]! - positions[a * 3 + 2]!;
    const e2x = positions[c * 3]! - positions[a * 3]!;
    const e2y = positions[c * 3 + 1]! - positions[a * 3 + 1]!;
    const e2z = positions[c * 3 + 2]! - positions[a * 3 + 2]!;
    const cx = e1y * e2z - e1z * e2y;
    const cy = e1z * e2x - e1x * e2z;
    const cz = e1x * e2y - e1y * e2x;
    const dot = cx * normal[0] + cy * normal[1] + cz * normal[2];
    if (dot >= 0) indices.push(a, b, c);
    else indices.push(a, c, b);
  }
  return { positions, indices, normal, area };
}

/**
 * 2次元の多角形（[x, z, x, z, ...]）を、四角い範囲 [-half, half] で切り取る
 * （Sutherland–Hodgman 法。範囲が四角なので、どんな形の多角形にも使える）。
 */
export function clipRingToSquare(ring: number[], half: number): number[] {
  return clipRing(ring, half, 2, 0, 1);
}

function clipRing(ring: number[], half: number, stride: number, ax: number, az: number): number[] {
  let pts = ring;
  const edges: [number, number, number][] = [
    // [軸, 境界の値, 向き（+1 なら 値 <= 境界 が内側）]
    [ax, half, 1],
    [ax, -half, -1],
    [az, half, 1],
    [az, -half, -1],
  ];
  for (const [axis, bound, dir] of edges) {
    if (pts.length < stride * 3) return [];
    const out: number[] = [];
    const n = pts.length / stride;
    const inside = (i: number) => dir * (pts[i * stride + axis]! - bound) <= 0;
    for (let i = 0; i < n; i++) {
      const j = (i + 1) % n;
      const iIn = inside(i);
      const jIn = inside(j);
      if (iIn) for (let k = 0; k < stride; k++) out.push(pts[i * stride + k]!);
      if (iIn !== jIn) {
        const a = pts[i * stride + axis]!;
        const b = pts[j * stride + axis]!;
        const t = (bound - a) / (b - a);
        for (let k = 0; k < stride; k++) {
          out.push(k === axis ? bound : pts[i * stride + k]! + t * (pts[j * stride + k]! - pts[i * stride + k]!));
        }
      }
    }
    pts = out;
  }
  return pts.length >= stride * 3 ? pts : [];
}

/**
 * 点の集まり（[x, z, x, z, ...]）を上から見たときの「いちばん細い向きの幅」（凸包の最小の幅）。
 * 細長い建物なら短い辺の長さ、点や線のようにつぶれていれば 0。
 */
export function minWidth2d(pts: number[]): number {
  const p: [number, number][] = [];
  for (let i = 0; i + 1 < pts.length; i += 2) p.push([pts[i]!, pts[i + 1]!]);
  p.sort((a, b) => a[0] - b[0] || a[1] - b[1]);
  if (p.length < 3) return 0;
  // 凸包（Andrew の方法）
  const cross = (o: [number, number], a: [number, number], b: [number, number]) =>
    (a[0] - o[0]) * (b[1] - o[1]) - (a[1] - o[1]) * (b[0] - o[0]);
  const lower: [number, number][] = [];
  for (const q of p) {
    while (lower.length >= 2 && cross(lower[lower.length - 2]!, lower[lower.length - 1]!, q) <= 0) lower.pop();
    lower.push(q);
  }
  const upper: [number, number][] = [];
  for (let i = p.length - 1; i >= 0; i--) {
    const q = p[i]!;
    while (upper.length >= 2 && cross(upper[upper.length - 2]!, upper[upper.length - 1]!, q) <= 0) upper.pop();
    upper.push(q);
  }
  const hull = lower.slice(0, -1).concat(upper.slice(0, -1));
  if (hull.length < 3) return 0;
  // 凸包の各辺について、いちばん遠い点までの距離。その最小が幅
  let best = Infinity;
  for (let i = 0; i < hull.length; i++) {
    const a = hull[i]!;
    const b = hull[(i + 1) % hull.length]!;
    const len = Math.hypot(b[0] - a[0], b[1] - a[1]);
    if (len < 1e-12) continue;
    let far = 0;
    for (const q of hull) far = Math.max(far, Math.abs(cross(a, b, q)) / len);
    best = Math.min(best, far);
  }
  return Number.isFinite(best) ? best : 0;
}
