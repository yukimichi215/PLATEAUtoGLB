// 切り出す範囲（正方形の一辺の上下限と、地図で囲んだ多角形）の計算。
// 画面（地図）でも、作る前の確認（pipeline.ts）でも同じものを使う。重い部品を読み込まないよう、ここは軽く保つ。
import { LocalProjector, type LatLon, type LatLonBox } from './geo.js';
import { isSimpleRing } from './geometry.js';

export const MIN_SIZE = 50;
export const MAX_SIZE = 1000;

/** 囲んだ範囲がちょうど入る正方形（中心と一辺 m。一辺は MIN_SIZE 以上、1 m 単位で切り上げ） */
export function areaOfPolygon(points: LatLon[]): { center: LatLon; size: number } {
  const lats = points.map((p) => p.lat);
  const lons = points.map((p) => p.lon);
  const center = {
    lat: (Math.min(...lats) + Math.max(...lats)) / 2,
    lon: (Math.min(...lons) + Math.max(...lons)) / 2,
  };
  const projector = new LocalProjector(center);
  let half = 0;
  for (const p of points) {
    const [x, z] = projector.toXZ(p.lat, p.lon);
    half = Math.max(half, Math.abs(x), Math.abs(z));
  }
  return { center, size: Math.max(MIN_SIZE, Math.ceil(2 * half)) };
}

/** 囲んだ範囲を、center から見たローカル座標の多角形 [x, z, ...] にする */
export function localRingOf(points: LatLon[], center: LatLon): number[] {
  const projector = new LocalProjector(center);
  return points.flatMap((p) => projector.toXZ(p.lat, p.lon));
}

/** 囲んだ範囲の問題（なければ undefined）。tooFew：3点未満、crossing：線が交差、tooLarge：一辺 MAX_SIZE m の正方形に入らない */
export type PolygonIssue = 'tooFew' | 'crossing' | 'tooLarge';

export function polygonIssue(points: LatLon[]): PolygonIssue | undefined {
  if (points.length < 3) return 'tooFew';
  const { center, size } = areaOfPolygon(points);
  if (!isSimpleRing(localRingOf(points, center))) return 'crossing';
  if (size > MAX_SIZE) return 'tooLarge';
  return undefined;
}

/** 囲んだ形の緯度経度の範囲（南西・北東） */
export function polygonBox(points: LatLon[]): LatLonBox {
  const lats = points.map((p) => p.lat);
  const lons = points.map((p) => p.lon);
  return { south: Math.min(...lats), west: Math.min(...lons), north: Math.max(...lats), east: Math.max(...lons) };
}
