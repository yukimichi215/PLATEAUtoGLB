import { describe, expect, it } from 'vitest';
import listJson from '../src/web/city-list.json';
import { groupByPref, PREF_ROMAJI, type CityList } from '../src/web/city-list.js';
import { meshBox, meshCode3 } from '../src/core/geo.js';

const list = listJson as CityList;

describe('対応地域の一覧', () => {
  it('一覧の自治体の数＋外した自治体の数が、データカタログの自治体の数と一致し、重複がない', () => {
    expect(list.cities).toHaveLength(list.cityCount);
    expect(list.cityCount + list.excluded.length).toBe(list.catalogCityCount);
    const codes = [...list.cities.map((c) => c.code), ...list.excluded.map((e) => e.code)];
    expect(new Set(codes).size).toBe(list.catalogCityCount);
    // 2026-11 時点のデータカタログでは 306 自治体。大きく減っていたら作り方の誤りを疑う
    expect(list.cityCount).toBeGreaterThan(250);
  });

  it('CityGML のない自治体（岐阜市など）は一覧に入れない', () => {
    expect(list.cities.some((c) => c.code === '21201')).toBe(false);
    expect(list.excluded.some((e) => e.code === '21201')).toBe(true);
  });

  it('都道府県のローマ字が、一覧のすべての都道府県にある', () => {
    for (const c of list.cities) expect(PREF_ROMAJI[c.prefCode], c.pref).toBeTruthy();
    expect(PREF_ROMAJI['13']).toBe('Tokyo');
  });

  it('都道府県ごとにまとめても、数は変わらない（すべての自治体がどこかの都道府県に入る）', () => {
    const groups = groupByPref(list.cities, 'all');
    expect(groups.reduce((s, g) => s + g.cities.length, 0)).toBe(list.cityCount);
    expect(groups.map((g) => g.prefCode)).toEqual([...groups.map((g) => g.prefCode)].sort());
    for (const g of groups) for (const c of g.cities) expect(c.prefCode).toBe(g.prefCode);
  });

  it('LOD2・LOD3 で絞り込むと、その LOD がある自治体だけになる', () => {
    const lod2 = groupByPref(list.cities, 'lod2').flatMap((g) => g.cities);
    const lod3 = groupByPref(list.cities, 'lod3').flatMap((g) => g.cities);
    expect(lod2.length).toBe(list.cities.filter((c) => c.lod2).length);
    expect(lod2.every((c) => c.lod2)).toBe(true);
    expect(lod3.length).toBeGreaterThan(0);
    expect(lod3.every((c) => c.lod3)).toBe(true);
    expect(lod3.length).toBeLessThan(lod2.length);
  });

  it('LOD3 の場所は、その区画（3次メッシュ）の中心で、200MB 以下', () => {
    for (const c of list.cities) {
      for (const p of c.lod3Places ?? []) {
        expect(c.lod3).toBe(true);
        expect(meshCode3(p.lat, p.lon)).toBe(p.mesh);
        const b = meshBox(p.mesh);
        expect(Math.abs(p.lat - (b.south + b.north) / 2)).toBeLessThan(1e-4);
        expect(p.mb).toBeLessThanOrEqual(200);
      }
    }
  });

  it('沼津市（LOD3 の代表の地域）に LOD3 の場所がある', () => {
    const numazu = list.cities.find((c) => c.code === '22203');
    expect(numazu?.lod3).toBe(true);
    expect(numazu?.lod3Places?.length ?? 0).toBeGreaterThan(0);
  });
});
