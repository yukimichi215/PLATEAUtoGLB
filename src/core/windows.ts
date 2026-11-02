// 壁に描く「窓の模様」。PLATEAU のデータに窓の形はほとんどないので、
// 階数のデータから1階分の高さを決め、窓が並んだ画像を壁に繰り返し貼る。
// 本物の窓の位置ではなく、見た目のための模様。
import { encodePngRgb } from './png.js';

/** 窓の模様1枚（1階分・窓1つ分）の横幅（m） */
export const WINDOW_BAY_WIDTH = 3.6;
/** 階数が分からないときの1階分の高さ（m） */
export const DEFAULT_STOREY_HEIGHT = 3.5;
const MIN_STOREY_HEIGHT = 2.4;
const MAX_STOREY_HEIGHT = 8;

/** 窓の模様の画像の一辺（px） */
export const WINDOW_TEXTURE_SIZE = 128;

/** 建物の高さと階数から、1階分の高さを決める。おかしな値なら標準の高さにする */
export function storeyHeight(height: number, storeys: number | undefined): number {
  if (storeys && storeys > 0 && height > 0) {
    const h = height / Math.round(storeys);
    if (h >= MIN_STOREY_HEIGHT && h <= MAX_STOREY_HEIGHT) return h;
  }
  return DEFAULT_STOREY_HEIGHT;
}

/**
 * 壁の頂点（x, y, z の並び）に、模様の位置（u, v）を付ける。
 * u は壁に沿った横の距離、v は高さ。1 で模様1枚分。
 * glTF では v が増えると画像の下へ進むので、高さは符号を反転して画像の上が上になるようにする。
 */
export function wallUvs(
  positions: number[],
  normal: [number, number, number],
  floorHeight: number,
): number[] {
  // 壁に沿った横向き（上向きと法線の外積）
  let tx = -normal[2];
  let tz = normal[0];
  const len = Math.hypot(tx, tz);
  if (len < 1e-6) {
    tx = 1;
    tz = 0;
  } else {
    tx /= len;
    tz /= len;
  }
  const uvs: number[] = [];
  for (let i = 0; i < positions.length; i += 3) {
    const x = positions[i]!;
    const y = positions[i + 1]!;
    const z = positions[i + 2]!;
    uvs.push((x * tx + z * tz) / WINDOW_BAY_WIDTH, -y / floorHeight);
  }
  return uvs;
}

type Rgb = [number, number, number];

/** 窓の模様の画像（PNG）。上が天井側、下が床側 */
export function windowTexturePng(): Uint8Array {
  const n = WINDOW_TEXTURE_SIZE;
  const wall: Rgb = [219, 216, 209];
  const frame: Rgb = [170, 172, 174];
  const glassTop: Rgb = [92, 112, 132];
  const glassBottom: Rgb = [58, 72, 88];
  const sill: Rgb = [196, 193, 186];
  const rgb = new Uint8Array(n * n * 3);
  // 窓の位置（画像の割合）
  const x0 = Math.round(n * 0.18);
  const x1 = Math.round(n * 0.82);
  const y0 = Math.round(n * 0.22);
  const y1 = Math.round(n * 0.8);
  const f = Math.max(2, Math.round(n * 0.03)); // 枠の太さ
  for (let y = 0; y < n; y++) {
    for (let x = 0; x < n; x++) {
      let c: Rgb = wall;
      if (x >= x0 && x < x1 && y >= y0 && y < y1) {
        const inner = x >= x0 + f && x < x1 - f && y >= y0 + f && y < y1 - f;
        const mullion = Math.abs(x - n / 2) < f / 2; // 真ん中の縦の枠
        if (!inner || mullion) c = frame;
        else {
          const t = (y - y0) / (y1 - y0);
          c = [
            Math.round(glassTop[0] + (glassBottom[0] - glassTop[0]) * t),
            Math.round(glassTop[1] + (glassBottom[1] - glassTop[1]) * t),
            Math.round(glassTop[2] + (glassBottom[2] - glassTop[2]) * t),
          ];
        }
      } else if (x >= x0 - f && x < x1 + f && y >= y1 && y < y1 + f) {
        c = sill; // 窓の下の台
      }
      const o = (y * n + x) * 3;
      rgb[o] = c[0];
      rgb[o + 1] = c[1];
      rgb[o + 2] = c[2];
    }
  }
  return encodePngRgb(n, n, rgb);
}
