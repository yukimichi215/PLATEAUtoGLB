// LOD3（窓・扉まで）の建物が集まっている場所を探す。対応地域の一覧の「LOD3 がある所」の位置を決めるのに使う
// （区画の中心では LOD3 の建物が範囲に入らないことがあるため。scripts/make-city-list.ts）。
import { metersPerDegree, type LatLon } from './geo.js';

export interface Lod3Spot extends LatLon {
  /** 中心から一辺 boxM の正方形に入る LOD3 の建物の数 */
  count: number;
}

/**
 * LOD3 の建物の位置（建物ごとの代表点）から、一辺 boxM（m）の正方形にいちばん多く入る中心を選ぶ。
 * 中心の候補は建物の位置そのもの（数百棟までを想定した単純な数え上げ）。最後に、入った建物の平均の位置へ寄せる。
 */
export function findLod3Spot(points: LatLon[], boxM = 300): Lod3Spot | null {
  if (points.length === 0) return null;
  // 最初の点のまわりの平面（m）に置き換えて数える（約1km 四方の中なので、ゆがみは無視できる）
  const o = points[0]!;
  const m = metersPerDegree(o.lat);
  const xy = points.map((p) => ({ x: (p.lon - o.lon) * m.lon, y: (p.lat - o.lat) * m.lat }));
  const half = boxM / 2;
  const inside = (cx: number, cy: number) => xy.filter((q) => Math.abs(q.x - cx) <= half && Math.abs(q.y - cy) <= half);
  let best = xy[0]!;
  let bestCount = 0;
  for (const c of xy) {
    const n = inside(c.x, c.y).length;
    if (n > bestCount) {
      best = c;
      bestCount = n;
    }
  }
  const group = inside(best.x, best.y);
  const mx = group.reduce((s, q) => s + q.x, 0) / group.length;
  const my = group.reduce((s, q) => s + q.y, 0) / group.length;
  // 平均へ寄せて入る数が減るときは、寄せる前の中心のままにする
  const moved = inside(mx, my).length >= group.length ? { x: mx, y: my } : best;
  return { lat: o.lat + moved.y / m.lat, lon: o.lon + moved.x / m.lon, count: inside(moved.x, moved.y).length };
}
