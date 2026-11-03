// 切り出す範囲（正方形の一辺の上下限と、地図で囲んだ多角形）の計算。
// 画面（地図）でも、作る前の確認（pipeline.ts）でも同じものを使う。重い部品を読み込まないよう、ここは軽く保つ。
import { LocalProjector, meshBox, meshCodesForBox, type LatLon, type LatLonBox } from './geo.js';
import { isSimpleRing, pointInRing, ringArea, segmentsTouch } from './geometry.js';

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

/** これより小さい面積（m²）の形は、囲んだ範囲として使わない（点が一直線に並んだ形など） */
export const MIN_POLYGON_AREA_M2 = 1;

/**
 * 囲んだ範囲の問題（なければ undefined）。tooFew：3点未満、tooSmall：面積がほぼない（点が一直線など）、
 * crossing：線が交差する・1点で触れる、tooLarge：一辺 MAX_SIZE m の正方形に入らない
 */
export type PolygonIssue = 'tooFew' | 'tooSmall' | 'crossing' | 'tooLarge';

export function polygonIssue(points: LatLon[]): PolygonIssue | undefined {
  if (points.length < 3) return 'tooFew';
  const { center, size } = areaOfPolygon(points);
  const ring = localRingOf(points, center);
  // 交差を先に調べる（8 の字は面積が打ち消し合って 0 に近くなるため）
  if (!isSimpleRing(ring)) return 'crossing';
  if (ringArea(ring) < MIN_POLYGON_AREA_M2) return 'tooSmall';
  if (size > MAX_SIZE) return 'tooLarge';
  return undefined;
}

/** 囲んだ形の緯度経度の範囲（南西・北東） */
export function polygonBox(points: LatLon[]): LatLonBox {
  const lats = points.map((p) => p.lat);
  const lons = points.map((p) => p.lon);
  return { south: Math.min(...lats), west: Math.min(...lons), north: Math.max(...lats), east: Math.max(...lons) };
}

/**
 * 囲んだ形に重なる3次メッシュの番号。外接する四角にかかるメッシュのうち、形と重なるものだけ
 * （L 字などで、形のへこみにだけかかるメッシュのデータは取らない）
 */
export function meshCodesForPolygon(points: LatLon[]): string[] {
  // 経度・緯度をそのまま平面の座標として調べる（1km 程度の範囲なら、重なるかどうかの判定に十分）
  const ring = points.flatMap((p) => [p.lon, p.lat]);
  const n = points.length;
  return meshCodesForBox(polygonBox(points)).filter((code) => {
    const b = meshBox(code);
    const corners: [number, number][] = [[b.west, b.south], [b.east, b.south], [b.east, b.north], [b.west, b.north]];
    // 形の点がメッシュの中にある
    if (points.some((p) => p.lon >= b.west && p.lon <= b.east && p.lat >= b.south && p.lat <= b.north)) return true;
    // メッシュの角が形の中にある（メッシュが形を含む・形がメッシュを含む）
    if (corners.some(([x, y]) => pointInRing(x, y, ring))) return true;
    // 辺どうしが交わる
    for (let i = 0; i < n; i++) {
      const a: [number, number] = [ring[i * 2]!, ring[i * 2 + 1]!];
      const c: [number, number] = [ring[((i + 1) % n) * 2]!, ring[((i + 1) % n) * 2 + 1]!];
      for (let k = 0; k < 4; k++) if (segmentsTouch(a, c, corners[k]!, corners[(k + 1) % 4]!)) return true;
    }
    return false;
  });
}
