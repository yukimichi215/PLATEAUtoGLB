import { describe, expect, it } from 'vitest';
import { catalogUrl, parseCatalog } from '../src/core/catalog.js';

// 2026-11-02 に API から返った答え（m:53394611）を短くしたもの
const sample = {
  cities: [
    {
      cityCode: '13101', cityName: '千代田区', year: 2025,
      files: {
        bldg: [{ code: '53394611', maxLod: 2, url: 'https://assets.cms.plateau.reearth.io/a/13101/udx/bldg/53394611_bldg_6697_op.gml', fileSize: 166007469 }],
        tran: [{ code: '53394611', maxLod: 3, url: 'https://assets.cms.plateau.reearth.io/a/13101/udx/tran/53394611_tran_6697_op.gml', fileSize: 37903117 }],
      },
    },
    {
      cityCode: '13102', cityName: '中央区', year: 2025,
      files: {
        bldg: [{ code: '53394611', maxLod: 2, url: 'https://assets.cms.plateau.reearth.io/b/13102/udx/bldg/53394611_bldg_6697_op.gml', fileSize: 166007469 }],
        dem: [{ code: '533946', url: 'https://example/dem.gml', fileSize: 1 }],
      },
    },
  ],
};

describe('データカタログの答えの整理', () => {
  it('同じファイルを複数の区が配布していても1つにまとめ、配布元を並べる', () => {
    const files = parseCatalog(sample, '53394611', ['bldg', 'tran']);
    expect(files).toHaveLength(2);
    const bldg = files.find((f) => f.type === 'bldg')!;
    expect(bldg.cities.map((c) => c.name)).toEqual(['千代田区', '中央区']);
    expect(bldg.cities[1]!.url).toContain('/13102/');
    expect(bldg.fileSize).toBe(166007469);
  });

  it('頼んでいない種類（dem）は含めない', () => {
    expect(parseCatalog(sample, '53394611', ['bldg']).every((f) => f.type === 'bldg')).toBe(true);
  });

  it('問い合わせ先の URL', () => {
    expect(catalogUrl('53394611', ['bldg', 'tran'])).toBe(
      'https://api.plateauview.mlit.go.jp/datacatalog/citygml/m:53394611?types=bldg,tran',
    );
  });
});
