import { describe, expect, it } from 'vitest';
import { CoverageIndex, coverageUrl, lodOfMesh, mesh2CodesForBox, parseCoverage } from '../src/core/coverage.js';
import { meshCodesForArea, meshCodesForPolygon } from '../src/core/area.js';
import { LocalProjector, meshCode3, meshCodesForBox } from '../src/core/geo.js';

// データカタログ API の答えの形（実物の一部を短くしたもの）
const tokyo = {
  cities: [
    {
      cityCode: '13101',
      cityName: '千代田区',
      year: 2025,
      files: {
        bldg: [
          { code: '53394611', maxLod: 2, url: 'u1', fileSize: 1 },
          { code: '53394600', maxLod: 3, url: 'u2', fileSize: 1 },
          { code: '53394700', maxLod: 2, url: 'x', fileSize: 1 }, // 隣の2次メッシュ（入れない）
        ],
      },
    },
    { cityCode: '13102', cityName: '中央区', year: 2025, files: { bldg: [{ code: '53394611', maxLod: 1, url: 'u3', fileSize: 1 }] } },
  ],
};

/** 2次メッシュ 533946 だけデータがあり、ほかは 404（空の答え）を返す偽の問い合わせ */
function fakeFetch() {
  const calls: string[] = [];
  const fetchJson = async (url: string) => {
    calls.push(url);
    return url === coverageUrl('533946') ? tokyo : { cities: [] };
  };
  return { calls, fetchJson };
}

const TOKYO_STATION = { lat: 35.6812, lon: 139.7671 };
// 白神山地の山の中（PLATEAU のデータがない。実際の API は 404 を返す。2026-11-03 確認）
const NO_DATA = { lat: 40.47, lon: 140.1 };

describe('PLATEAU の建物データがある場所', () => {
  it('答えから、メッシュごとの最大の LOD を集める（隣の2次メッシュは入れない）', () => {
    const cov = parseCoverage(tokyo, '533946');
    expect(cov.get('53394611')).toBe(2);
    expect(cov.get('53394600')).toBe(3);
    expect(cov.has('53394700')).toBe(false);
  });

  it('6桁（2次メッシュ単位）のファイルは、その中のメッシュ全部にデータがあるとみなす', () => {
    const cov = parseCoverage({ cities: [{ files: { bldg: [{ code: '533946', maxLod: 1 }] } }] }, '533946');
    expect(lodOfMesh(cov, '53394655')).toBe(1);
    expect(lodOfMesh(cov, '53394755')).toBeUndefined();
  });

  it('東京駅にはデータがあり、データのない場所では「ない」と判定する', async () => {
    const idx = new CoverageIndex(fakeFetch().fetchJson);
    expect(meshCode3(TOKYO_STATION.lat, TOKYO_STATION.lon)).toBe('53394611');
    expect(await idx.lodAt(TOKYO_STATION.lat, TOKYO_STATION.lon)).toBe(2);
    expect(await idx.lodAt(NO_DATA.lat, NO_DATA.lon)).toBeUndefined();
    const none = await idx.areaCoverage(meshCodesForArea({ center: NO_DATA, size: 300 }));
    expect(none.covered).toBe(0);
    expect(none.total).toBeGreaterThan(0);
  });

  it('範囲の一部だけにデータがあるときは、その数を数える', async () => {
    const idx = new CoverageIndex(fakeFetch().fetchJson);
    // 東京駅のメッシュ（53394611）と、その東隣（53394612。この偽の答えではデータなし）にまたがる範囲
    const box = { south: 35.68, north: 35.6825, west: 139.7720, east: 139.7780 };
    const r = await idx.areaCoverage(meshCodesForBox(box));
    expect(r.total).toBe(2);
    expect(r.covered).toBe(1);
  });

  it('自由な形で囲んだときは、作るときと同じ数え方（meshCodesForPolygon）で数える', async () => {
    const idx = new CoverageIndex(fakeFetch().fetchJson);
    // 細長い三角形：囲む四角には入るが、形には重ならないメッシュがある
    const polygon = [
      { lat: 35.676, lon: 139.760 },
      { lat: 35.676, lon: 139.790 },
      { lat: 35.690, lon: 139.790 },
    ];
    const meshes = meshCodesForArea({ center: TOKYO_STATION, size: 3000, polygon });
    expect(meshes).toEqual(meshCodesForPolygon(polygon));
    const r = await idx.areaCoverage(meshes);
    expect(r.total).toBe(meshes.length);
  });

  it('同じ2次メッシュは1回しか問い合わせない', async () => {
    const f = fakeFetch();
    const idx = new CoverageIndex(f.fetchJson);
    await idx.lodAt(TOKYO_STATION.lat, TOKYO_STATION.lon);
    await idx.areaCoverage(meshCodesForArea({ center: TOKYO_STATION, size: 1000 }));
    await idx.cells(new LocalProjector(TOKYO_STATION).boxAround(500));
    expect(f.calls.filter((u) => u === coverageUrl('533946'))).toHaveLength(1);
  });

  it('地図の枠：見える範囲の2次メッシュが多すぎるときは調べない', async () => {
    const idx = new CoverageIndex(fakeFetch().fetchJson);
    const cells = await idx.cells(new LocalProjector(TOKYO_STATION).boxAround(500));
    expect(cells?.map((c) => c.code).sort()).toEqual(['53394600', '53394611']);
    const wide = { south: 35.3, north: 36.1, west: 139.2, east: 140.3 };
    expect(mesh2CodesForBox(wide).length).toBeGreaterThan(4);
    expect(await idx.cells(wide)).toBeNull();
  });
});

describe('データカタログ API の問い合わせ', () => {
  it('データのない場所（404）は空の答えにし、ほかの失敗はエラーにする', async () => {
    const { fetchCatalogJson } = await import('../src/core/catalog.js');
    const orig = globalThis.fetch;
    try {
      globalThis.fetch = (async () => new Response('{"error":"not found"}', { status: 404 })) as typeof fetch;
      expect(await fetchCatalogJson('x')).toEqual({ cities: [] });
      globalThis.fetch = (async () => new Response('', { status: 500 })) as typeof fetch;
      await expect(fetchCatalogJson('x')).rejects.toThrow('500');
    } finally {
      globalThis.fetch = orig;
    }
  });
});
