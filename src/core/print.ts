// 3Dプリンタ用の仕上げ：縮尺を決め、台座を敷き、閉じた形の柱の下端・道路の高さを決める。
import { MeshPart, SOLID_BOTTOM, SOLID_ROAD_TOP, type PartName, type SceneBuilder } from './scene.js';
import { minWidth2d } from './geometry.js';
import { box, type Solid } from './solid.js';
import { unionSolids, type UnionGroup } from './union.js';

export interface PrintOptions {
  /** 縮尺の分母（1/1000 なら 1000）。fitSideMm を指定したときは使わない */
  scaleDenominator?: number;
  /** 切り出した正方形の一辺（＝台座の一辺）をこの長さ（mm）にする */
  fitSideMm?: number;
  /** 台座の厚さ（印刷したときの mm）。0 なら台座なし */
  baseMm: number;
  /**
   * 細かすぎる部分の省略：上から見たいちばん細い向きの幅が、印刷したときにこの長さ（mm）より細い建物・道路を外す。
   * 指定しないときは DEFAULT_MIN_FEATURE_MM。0 なら外さない
   */
  minFeatureMm?: number;
}

export const MIN_DENOMINATOR = 100;
export const MAX_DENOMINATOR = 100000;
export const MIN_FIT_MM = 10;
export const MAX_FIT_MM = 2000;
export const MAX_BASE_MM = 50;
/** 一般的な家庭用 3D プリンタ（ノズル 0.4mm）で、形として残る細さの目安（2本分の線の幅） */
export const DEFAULT_MIN_FEATURE_MM = 0.8;
export const MAX_MIN_FEATURE_MM = 10;
/** 印刷で見分けられない細かさ（mm）。これより細かい凹凸はならして三角形を減らす */
export const PRINT_TOLERANCE_MM = 0.01;
/** 道路の板の厚さ（印刷したときの mm）。台座の上に少し盛り上がって見える厚さ */
export const ROAD_PRINT_MM = 0.4;

export function validatePrint(p: PrintOptions): void {
  if (p.fitSideMm !== undefined) {
    if (!(p.fitSideMm >= MIN_FIT_MM && p.fitSideMm <= MAX_FIT_MM)) {
      throw new Error(`収める長さは ${MIN_FIT_MM}〜${MAX_FIT_MM} mm の範囲で指定してください。`);
    }
  } else if (!(p.scaleDenominator! >= MIN_DENOMINATOR && p.scaleDenominator! <= MAX_DENOMINATOR)) {
    throw new Error(`縮尺は 1/${MIN_DENOMINATOR}〜1/${MAX_DENOMINATOR} の範囲で指定してください。`);
  }
  if (!(p.baseMm >= 0 && p.baseMm <= MAX_BASE_MM)) {
    throw new Error(`台座の厚さは 0〜${MAX_BASE_MM} mm の範囲で指定してください。`);
  }
  if (p.minFeatureMm !== undefined && !(p.minFeatureMm >= 0 && p.minFeatureMm <= MAX_MIN_FEATURE_MM)) {
    throw new Error(`外す細さは 0〜${MAX_MIN_FEATURE_MM} mm の範囲で指定してください。`);
  }
}

export interface PrintInfo {
  /** 実物の 1 m が印刷で何 mm になるか */
  mmPerMeter: number;
  /** 「1/1000」のような縮尺の表し方（長さに合わせたときは近い値） */
  scaleLabel: string;
  baseMm: number;
  /** 形がくずれていて閉じた形にできず、入れられなかった屋根の面・道路の数 */
  droppedFaces: number;
  /** 細かすぎる部分の省略に使った細さ（mm。0 なら省略なし） */
  minFeatureMm: number;
  /** 細すぎて外した建物・道路の数 */
  removedBuildings: number;
  removedRoads: number;
  /** 印刷したときの大きさ（mm） */
  widthMm: number;
  depthMm: number;
  heightMm: number;
}

/** 縮尺の分母を、読みやすい数（有効数字2けた）に丸めた表し方 */
function scaleLabelOf(mmPerMeter: number): string {
  const d = 1000 / mmPerMeter;
  const digits = Math.pow(10, Math.max(0, Math.floor(Math.log10(d)) - 1));
  return `1/${Math.round(d / digits) * digits}`;
}

/**
 * 閉じた形で作った場面（SceneBuilder の solid）を仕上げる。
 * 建物・道路は範囲の正方形で切り落とし（立体として切るので切り口も閉じる）、台座はちょうど切り出した正方形にする。
 * 建物・道路の下端は台座の厚さの半分まで食い込ませ、台座とあわせて1つの立体にまとめる
 * （浮いた部品・重なった面・すき間をなくし、どの辺もちょうど2つの面が共有する形にする）。
 * 結果は scene.parts（roof＝建物、road＝道路、ground＝台座）に入れる。単位はまだメートル（実物の大きさ）のまま。
 */
export async function finishForPrint(scene: SceneBuilder, half: number, opt: PrintOptions): Promise<PrintInfo> {
  const mmPerMeter = opt.fitSideMm !== undefined ? opt.fitSideMm / (2 * half) : 1000 / opt.scaleDenominator!;
  const baseM = opt.baseMm / mmPerMeter;
  const heights = new Map<number, number>([
    [SOLID_BOTTOM, -baseM / 2],
    [SOLID_ROAD_TOP, ROAD_PRINT_MM / mmPerMeter],
  ]);
  const resolve = (s: Solid): Solid => ({
    positions: s.positions.map((v, i) => (i % 3 === 1 ? (heights.get(v) ?? v) : v)),
    indices: s.indices,
  });
  // 細かすぎる部分の省略：上から見て、印刷すると minFeatureMm より細い建物・道路は外す
  const minFeatureMm = opt.minFeatureMm ?? DEFAULT_MIN_FEATURE_MM;
  const minWidthM = minFeatureMm / mmPerMeter;
  const wide = (solids: Solid[]) => minFeatureMm <= 0 || minWidth2d(solids.flatMap((s) => xzOf(s, half))) >= minWidthM;
  const buildings = scene.solids.buildings.filter(wide);
  const roads = scene.solids.roads.filter((r) => wide([r]));
  const groups: UnionGroup<'roof' | 'road' | 'ground'>[] = [
    { key: 'roof', solids: buildings.flat().map(resolve) },
    { key: 'road', solids: roads.map(resolve) },
  ];
  if (baseM > 0) groups.push({ key: 'ground', solids: [box(-half, half, -baseM, 0, -half, half)] });
  // 印刷で 0.001 mm³ に満たないかけらは除き、0.01 mm より細かい凹凸はならす（実物の大きさに直して渡す）
  const result = await unionSolids(groups, {
    minVolume: 1e-3 / mmPerMeter ** 3,
    tolerance: PRINT_TOLERANCE_MM / mmPerMeter,
    clipHalf: half,
  });
  let maxY = 0;
  for (const g of groups) {
    const idx = result.indices[g.key];
    scene.parts[g.key].addFlatTriangles(result.positions, idx);
    for (const i of idx) maxY = Math.max(maxY, result.positions[i * 3 + 1]!);
  }
  const r1 = (v: number) => Math.round(v * 10) / 10;
  return {
    mmPerMeter,
    scaleLabel: opt.fitSideMm !== undefined ? `約${scaleLabelOf(mmPerMeter)}` : `1/${opt.scaleDenominator}`,
    baseMm: opt.baseMm,
    droppedFaces: scene.droppedFaces,
    minFeatureMm,
    removedBuildings: scene.solids.buildings.length - buildings.length,
    removedRoads: scene.solids.roads.length - roads.length,
    widthMm: r1(2 * half * mmPerMeter),
    depthMm: r1(2 * half * mmPerMeter),
    heightMm: r1(maxY * mmPerMeter + opt.baseMm),
  };
}

/**
 * 立体の頂点を上から見た点（[x, z, ...]）。範囲の外の点は範囲の線まで寄せる
 * （範囲の端で切り落としたあとに残る部分の細さで判断するため）
 */
function xzOf(s: Solid, half: number): number[] {
  const out: number[] = [];
  const c = (v: number) => Math.max(-half, Math.min(half, v));
  for (let i = 0; i < s.positions.length; i += 3) out.push(c(s.positions[i]!), c(s.positions[i + 2]!));
  return out;
}

/** 大きさを k 倍した部品の写し */
export function scaleParts(parts: Record<PartName, MeshPart>, k: number): Record<PartName, MeshPart> {
  const out = {} as Record<PartName, MeshPart>;
  for (const [name, part] of Object.entries(parts) as [PartName, MeshPart][]) {
    const copy = new MeshPart();
    copy.positions = part.positions.map((v) => v * k);
    copy.normals = part.normals;
    copy.indices = part.indices;
    out[name] = copy;
  }
  return out;
}
