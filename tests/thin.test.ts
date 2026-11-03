import { createReadStream } from 'node:fs';
import { STLLoader } from 'three/examples/jsm/loaders/STLLoader.js';
import { describe, expect, it } from 'vitest';
import type { SourceFile } from '../src/core/catalog.js';
import { minWidth2d } from '../src/core/geometry.js';
import { generateFromPlan, planArea, type AreaPlan, type OpenText } from '../src/core/pipeline.js';
import type { PrintOptions } from '../src/core/print.js';

const FIXTURE: Record<string, string> = { bldg: 'bldg_tokyo_station.gml', tran: 'tran_sample.gml' };
const openText: OpenText = async (file) =>
  createReadStream(new URL(`./fixtures/${FIXTURE[file.type]}`, import.meta.url), { encoding: 'utf8' }) as AsyncIterable<string>;

function fakeFile(type: 'bldg' | 'tran'): SourceFile {
  return {
    type,
    mesh: '53394611',
    url: `https://assets.cms.plateau.reearth.io/test/13101/udx/${type}/53394611_${type}_6697_op.gml`,
    fileSize: 1000,
    maxLod: 2,
    cities: [{ code: '13101', name: '千代田区', year: 2025, url: `https://assets.cms.plateau.reearth.io/test/13101/${type}.gml` }],
  };
}

const plan = (print: PrintOptions, includeRoads = true): AreaPlan => ({
  request: { center: { lat: 35.6812, lon: 139.7671 }, size: 300, lod: 2, includeRoads, includeGround: true, placeName: '東京駅', print },
  meshes: ['53394611'],
  files: includeRoads ? [fakeFile('bldg'), fakeFile('tran')] : [fakeFile('bldg')],
  totalBytes: 2000,
  unknownSizeFiles: 0,
});

/** STL を、同じ位置の頂点でつながった部品ごとの「上から見た点」に分ける（+Z が上なので x, y） */
function piecesXY(stl: Uint8Array): number[][] {
  const ab = stl.buffer.slice(stl.byteOffset, stl.byteOffset + stl.byteLength) as ArrayBuffer;
  const p = new STLLoader().parse(ab).attributes.position!.array;
  const ids = new Map<string, number>();
  const tv: number[] = [];
  for (let i = 0; i < p.length / 3; i++) {
    const k = `${p[i * 3]},${p[i * 3 + 1]},${p[i * 3 + 2]}`;
    let v = ids.get(k);
    if (v === undefined) ids.set(k, (v = ids.size));
    tv.push(v);
  }
  const parent = Array.from({ length: ids.size }, (_, i) => i);
  const find = (a: number): number => (parent[a] === a ? a : (parent[a] = find(parent[a]!)));
  for (let t = 0; t < tv.length; t += 3) {
    parent[find(tv[t]!)] = find(tv[t + 1]!);
    parent[find(tv[t + 1]!)] = find(tv[t + 2]!);
  }
  const out = new Map<number, number[]>();
  for (let i = 0; i < tv.length; i++) {
    const r = find(tv[i]!);
    if (!out.has(r)) out.set(r, []);
    out.get(r)!.push(p[i * 3]!, p[i * 3 + 1]!);
  }
  return [...out.values()];
}

describe('細かすぎる部分の省略', () => {
  it('上から見たいちばん細い向きの幅', () => {
    expect(minWidth2d([0, 0, 10, 0, 10, 2, 0, 2])).toBeCloseTo(2, 9); // 10 × 2 の長方形
    expect(minWidth2d([0, 0, 5, 5, 6, 4, 1, -1])).toBeCloseTo(Math.SQRT2, 9); // 斜めの細長い長方形
    expect(minWidth2d([0, 0, 4, 0, 4, 4, 0, 4, 2, 2])).toBeCloseTo(4, 9); // 正方形（中の点は関係ない）
    expect(minWidth2d([0, 0, 1, 1, 2, 2])).toBe(0); // 一直線
  });

  it('1/1000・0.8mm では見本の建物は1棟も外れない', async () => {
    const res = await generateFromPlan(plan({ scaleDenominator: 1000, baseMm: 3 }), openText);
    expect(res.stats.print!.minFeatureMm).toBe(0.8);
    expect(res.stats.print!.removedBuildings).toBe(0);
  });

  it('基準より細い建物・道路が残らず、太い建物は消えない（台座なしで部品ごとに確かめる）', async () => {
    const all = await generateFromPlan(plan({ scaleDenominator: 5000, baseMm: 0, minFeatureMm: 0 }), openText);
    const thin = await generateFromPlan(plan({ scaleDenominator: 5000, baseMm: 0, minFeatureMm: 4 }), openText); // 実物で 20m
    const p = thin.stats.print!;
    expect(p.removedBuildings).toBeGreaterThan(0);
    expect(p.removedBuildings).toBeLessThan(thin.stats.buildings); // 全部は消えない
    expect(p.removedRoads).toBeGreaterThan(0);
    // 残った部品は、どれも上から見て 4mm 以上の幅がある
    const pieces = piecesXY(thin.stl);
    expect(pieces.length).toBeGreaterThan(0);
    for (const xy of pieces) expect(minWidth2d(xy)).toBeGreaterThanOrEqual(4 - 1e-3);
    // 省略なしでは 4mm 未満の部品がある（＝確かめ方が意味を持つ）
    expect(piecesXY(all.stl).some((xy) => minWidth2d(xy) < 4)).toBe(true);
    expect(thin.credit).toContain(`印刷すると 4 mm より細い建物 ${p.removedBuildings} 棟・道路 ${p.removedRoads} か所を省く`);
  });

  it('いちばん大きい建物は消えない（高さが変わらない）', async () => {
    const all = await generateFromPlan(plan({ scaleDenominator: 5000, baseMm: 2, minFeatureMm: 0 }, false), openText);
    const thin = await generateFromPlan(plan({ scaleDenominator: 5000, baseMm: 2, minFeatureMm: 4 }, false), openText);
    expect(thin.stats.print!.heightMm).toBe(all.stats.print!.heightMm);
  });

  it('外す細さの入力を確かめる', async () => {
    const noFetch = async () => ({ cities: [] });
    await expect(planArea(plan({ scaleDenominator: 1000, baseMm: 3, minFeatureMm: -1 }).request, noFetch)).rejects.toThrow('細さ');
  });
});
