import { createReadStream } from 'node:fs';
import { describe, expect, it } from 'vitest';
import { checkGlb } from '../scripts/lib/check-glb.js';
import type { SourceFile } from '../src/core/catalog.js';
import { generateFromPlan, type AreaPlan, type AreaRequest, type OpenText } from '../src/core/pipeline.js';

const open = (name: string): OpenText => async () =>
  createReadStream(new URL(`./fixtures/${name}`, import.meta.url), { encoding: 'utf8' }) as AsyncIterable<string>;

function bldgFile(code: string, name: string, year: number): SourceFile {
  const url = `https://assets.cms.plateau.reearth.io/test/${code}/bldg.gml`;
  return { type: 'bldg', mesh: '0', url, fileSize: 1000, maxLod: 3, cities: [{ code, name, year, url }] };
}

const TOKYO = { center: { lat: 35.6812, lon: 139.7671 }, size: 300, file: bldgFile('13101', '千代田区', 2025), fixture: 'bldg_tokyo_station.gml' };
const NUMAZU = { center: { lat: 35.10125, lon: 138.8592 }, size: 100, file: bldgFile('22203', '沼津市', 2023), fixture: 'bldg_numazu_lod3.gml' };

async function make(place: typeof TOKYO, req: Partial<AreaRequest>) {
  const request: AreaRequest = {
    center: place.center,
    size: place.size,
    lod: 1,
    includeRoads: false,
    includeGround: false,
    placeName: 'test',
    ...req,
  };
  const plan: AreaPlan = { request, meshes: [], files: [place.file], totalBytes: 1, unknownSizeFiles: 0 };
  return generateFromPlan(plan, open(place.fixture));
}

describe('細かさの選択', () => {
  it('段階ごとに三角形の数が増える（箱型 → 屋根の形 → 付属物あり → 窓・扉まで）', async () => {
    const box = await make(NUMAZU, { lod: 1 });
    const roof = await make(NUMAZU, { lod: 2 });
    const plus = await make(NUMAZU, { lod: 2, installations: true });
    const lod3 = await make(NUMAZU, { lod: 3 });
    expect(box.stats.triangles).toBeLessThan(roof.stats.triangles);
    expect(roof.stats.triangles).toBeLessThanOrEqual(plus.stats.triangles);
    expect(roof.stats.triangles).toBeLessThan(lod3.stats.triangles);
    for (const r of [box, roof, plus, lod3]) expect((await checkGlb(r.glb)).validatorErrors).toBe(0);
    // 東京駅の見本でも、箱型 < 屋根の形 < 付属物あり
    const t1 = await make(TOKYO, { lod: 1 });
    const t2 = await make(TOKYO, { lod: 2 });
    const t2p = await make(TOKYO, { lod: 2, installations: true });
    expect(t1.stats.triangles).toBeLessThan(t2.stats.triangles);
    expect(t2.stats.triangles).toBeLessThan(t2p.stats.triangles);
    // 画面の「窓・扉まで」は付属物も入れる。LOD3 のない東京でも「付属物あり」より粗くならない
    const t3p = await make(TOKYO, { lod: 3, installations: true });
    expect(t3p.stats.triangles).toBeGreaterThanOrEqual(t2p.stats.triangles);
    const lod3p = await make(NUMAZU, { lod: 3, installations: true });
    expect(lod3p.stats.triangles).toBeGreaterThanOrEqual(plus.stats.triangles);
    expect(lod3p.stats.triangles).toBeGreaterThanOrEqual(lod3.stats.triangles);
  });

  it('LOD3 のある見本では窓・扉が入り、代わりに作った建物は 0', async () => {
    const res = await make(NUMAZU, { lod: 3 });
    expect(res.stats.lodUsed[3]).toBe(res.stats.buildings);
    expect(res.stats.lodUsed[2] + res.stats.lodUsed[1]).toBe(0);
    expect(res.obj).toContain('usemtl window');
    expect(res.obj).toContain('usemtl door');
  });

  it('LOD3 のない見本では、すべて屋根の形・箱型で代わりに作り、その数が分かる', async () => {
    const res = await make(TOKYO, { lod: 3 });
    expect(res.stats.lodUsed[3]).toBe(0);
    expect(res.stats.lodUsed[2] + res.stats.lodUsed[1]).toBe(res.stats.buildings);
    expect(res.obj).not.toContain('usemtl window');
    // 代わりに作っても、屋根の形を選んだときと同じ形になる
    const roof = await make(TOKYO, { lod: 2 });
    expect(res.stats.triangles).toBe(roof.stats.triangles);
    expect(res.stats.lodUsed).toEqual(roof.stats.lodUsed);
  });

  it('3D プリンタ用でも、使った細かさを数える', async () => {
    const res = await make(NUMAZU, { lod: 3, print: { scaleDenominator: 1000, baseMm: 2 } });
    const sum = res.stats.lodUsed[1] + res.stats.lodUsed[2] + res.stats.lodUsed[3];
    expect(sum).toBe(res.stats.buildings);
    expect(res.stats.lodUsed[3]).toBe(res.stats.lod3Buildings);
  });
});
