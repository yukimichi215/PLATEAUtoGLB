// LOD3（窓・扉まで）の建物が集まっている場所を探す。対応地域の一覧の「LOD3 がある所」の位置を決めるのに使う
// （区画の中心では LOD3 の建物が範囲に入らないことがあるため。scripts/make-city-list.ts）。
import { metersPerDegree, type LatLon } from './geo.js';

export interface Lod3Spot extends LatLon {
  /** 中心から一辺 boxM の正方形に入る LOD3 の建物の数 */
  count: number;
}

/**
 * LOD3 の建物の位置（建物ごとの代表点）から、一辺 boxM（m）の正方形にいちばん多く入る中心を選ぶ。
 * いちばん多く入る正方形は、左の辺がどれかの建物の x、下の辺がどれかの建物の y に接するものの中にあるので、
 * その組み合わせをすべて数える（LOD3 の建物は1区画に数十棟までなので、単純な数え上げで足りる）。
 * 最後に、入った建物の平均の位置へ寄せる（入る数が減らないときだけ）。
 */
export function findLod3Spot(points: LatLon[], boxM = 300): Lod3Spot | null {
  if (points.length === 0) return null;
  // 最初の点のまわりの平面（m）に置き換えて数える（約1km 四方の中なので、ゆがみは無視できる）
  const o = points[0]!;
  const m = metersPerDegree(o.lat);
  const xy = points.map((p) => ({ x: (p.lon - o.lon) * m.lon, y: (p.lat - o.lat) * m.lat }));
  const half = boxM / 2;
  const inside = (cx: number, cy: number) => xy.filter((q) => Math.abs(q.x - cx) <= half + 1e-9 && Math.abs(q.y - cy) <= half + 1e-9);
  let best = { x: xy[0]!.x, y: xy[0]!.y };
  let bestCount = 0;
  for (const left of xy) {
    for (const bottom of xy) {
      const n = inside(left.x + half, bottom.y + half).length;
      if (n > bestCount) {
        best = { x: left.x + half, y: bottom.y + half };
        bestCount = n;
      }
    }
  }
  const group = inside(best.x, best.y);
  const mx = group.reduce((s, q) => s + q.x, 0) / group.length;
  const my = group.reduce((s, q) => s + q.y, 0) / group.length;
  const moved = inside(mx, my).length >= group.length ? { x: mx, y: my } : best;
  return { lat: o.lat + moved.y / m.lat, lon: o.lon + moved.x / m.lon, count: inside(moved.x, moved.y).length };
}
