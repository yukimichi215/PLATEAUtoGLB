import { createReadStream, readFileSync } from 'node:fs';
import { describe, expect, it } from 'vitest';
import type { SourceFile } from '../src/core/catalog.js';
import { readCityGml, type Building } from '../src/core/citygml.js';
import { generateFromPlan, type AreaPlan, type OpenText } from '../src/core/pipeline.js';
import { areaCharacter, evidenceOf, situationEvidence, SITUATIONS } from '../src/core/situation.js';
import { evidenceText } from '../src/web/evidence-text.js';

const KANAZAWA = 'bldg_kanazawa_attrs.gml';
const fixture = (name: string) =>
  createReadStream(new URL(`./fixtures/${name}`, import.meta.url), { encoding: 'utf8' }) as AsyncIterable<string>;
const rawText = readFileSync(new URL(`./fixtures/${KANAZAWA}`, import.meta.url), 'utf8');
/** 元の GML の、タグの中身の値の一覧（建物ごとに1つずつ書かれている属性） */
const values = (tag: string) => [...rawText.matchAll(new RegExp(`<${tag}[^>]*>([^<]*)<`, 'g'))].map((m) => m[1]!);

describe('シチュエーション検索の根拠の数値', () => {
  it('作った例の建物で、割合と数を正しく数える', () => {
    const c = areaCharacter(
      [
        { measuredHeight: 10, yearOfConstruction: 1960, structureType: '601', usage: '411' },
        { measuredHeight: 40, yearOfConstruction: 2005, structureType: '603', usage: '401' },
        { measuredHeight: 70, yearOfConstruction: 1970, structureType: '611', usage: '461' },
        {},
      ],
      20000,
    );
    expect(c).toMatchObject({
      buildings: 4,
      areaHa: 2,
      density: 2,
      heightKnown: 3,
      tall31: 2,
      tall60: 1,
      yearKnown: 3,
      builtBy1970: 2,
      builtFrom2000: 1,
      structureKnown: 2, // 611（不明）は数えない
      wooden: 1,
      usageKnown: 2, // 461（不明）は数えない
      residential: 1,
    });
    expect(c.avgHeight).toBeCloseTo(40, 9);
    expect(evidenceOf(c, 'old')).toMatchObject({ known: true, n: 2, of: 3, pct: 67 });
    expect(evidenceText(evidenceOf(c, 'old'), 'ja').value).toBe('67%（2 棟 / 建てた年が分かる 3 棟）');
    expect(evidenceText(evidenceOf(c, 'wooden'), 'ja').value).toBe('50%（1 棟 / 構造が分かる 2 棟）');
    expect(evidenceText(evidenceOf(c, 'density'), 'ja').value).toBe('1 ha（100m 四方）あたり 2.0 棟（4 棟 / 2.0 ha）');
    expect(evidenceText(evidenceOf(c, 'tall60'), 'ja').value).toBe('1 棟（高さが分かる 3 棟のうち 33%）');
    expect(evidenceText(evidenceOf(c, 'avgHeight'), 'en').value).toBe('40.0 m (3 buildings with a known height)');
    expect(evidenceText(evidenceOf(c, 'old'), 'en')).toEqual({ label: 'Built in 1970 or earlier', value: '67% (2 of 3 with a known construction year)' });
  });

  it('データにない属性は「データなし」と出し、0% と見せない', () => {
    const c = areaCharacter([{ measuredHeight: 5 }], 10000);
    const e = evidenceOf(c, 'wooden');
    expect(e.known).toBe(false);
    expect(evidenceText(e, 'ja').value).toContain('データなし');
    expect(evidenceText(e, 'en').value).toContain('No data');
    expect(evidenceOf(c, 'old').known).toBe(false);
    expect(evidenceOf(c, 'avgHeight').known).toBe(true);
  });

  it('実データ（金沢市の30棟）で、根拠の数値が元の GML の値と一致する', async () => {
    const list: Building[] = [];
    await readCityGml(fixture(KANAZAWA), { onBuilding: (b) => list.push(b) });
    expect(list).toHaveLength(30);
    const c = areaCharacter(list.map((b) => b.attrs), 30000);

    // 元の GML を文字のまま数えた値と比べる
    const structures = values('uro:buildingStructureType');
    expect(structures).toHaveLength(30);
    expect(c.structureKnown).toBe(structures.filter((v) => v !== '611').length);
    expect(c.wooden).toBe(structures.filter((v) => v === '601').length);
    expect(c.wooden).toBe(19);

    const years = values('bldg:yearOfConstruction').map(Number).filter((y) => y > 1000 && y < 9999); // 0001 は「不明」
    expect(c.yearKnown).toBe(years.length);
    expect(c.builtBy1970).toBe(years.filter((y) => y <= 1970).length);
    expect(c.builtFrom2000).toBe(years.filter((y) => y >= 2000).length);

    const usages = values('bldg:usage').filter((u) => u !== '461');
    expect(c.usageKnown).toBe(usages.length);
    expect(c.residential).toBe(usages.filter((u) => ['411', '412', '413', '414', '415'].includes(u)).length);

    const heights = values('bldg:measuredHeight').map(Number).filter((h) => h > 0 && h < 9999);
    expect(c.heightKnown).toBe(heights.length);
    expect(c.avgHeight).toBeCloseTo(heights.reduce((a, b) => a + b, 0) / heights.length, 9);
  });

  it('切り出した建物の一覧（buildings.json）に構造が入り、そこから同じ数値が出る', async () => {
    const list: Building[] = [];
    await readCityGml(fixture(KANAZAWA), { onBuilding: (b) => list.push(b) });
    const lat = list.reduce((s, b) => s + b.lod1[0]!.exterior[0]!, 0) / list.length;
    const lon = list.reduce((s, b) => s + b.lod1[0]!.exterior[1]!, 0) / list.length;
    const file: SourceFile = {
      type: 'bldg',
      mesh: '54366592',
      url: 'https://assets.cms.plateau.reearth.io/test/17201/udx/bldg/54366592_bldg_6697_op.gml',
      fileSize: 1000,
      maxLod: 1,
      cities: [{ code: '17201', name: '金沢市', year: 2024, url: 'https://assets.cms.plateau.reearth.io/test/17201/bldg.gml' }],
    };
    const plan: AreaPlan = {
      request: { center: { lat, lon }, size: 1000, lod: 1, includeRoads: false, includeGround: false, placeName: '金沢' },
      meshes: ['54366592'],
      files: [file],
      totalBytes: 1000,
      unknownSizeFiles: 0,
    };
    const openText: OpenText = async () => fixture(KANAZAWA);
    const res = await generateFromPlan(plan, openText);
    // 範囲（1km 四方）の外に中心がある建物は入らないので、入った建物どうしで比べる
    expect(res.buildings.length).toBeGreaterThanOrEqual(25);
    const ids = new Set(res.buildings.map((b) => b.id));
    const inside = list.filter((b) => ids.has(b.id));
    expect(inside).toHaveLength(res.buildings.length);
    expect(res.buildings.some((b) => b.structureType === '601')).toBe(true);
    const fromInfo = areaCharacter(res.buildings, 1e6);
    const fromGml = areaCharacter(inside.map((b) => b.attrs), 1e6);
    expect(fromInfo).toEqual(fromGml);
  });

  it('条件ごとに見本の地域が3つ以上あり、根拠の数値を大事な順に出す', () => {
    const ids = new Set<string>();
    for (const s of SITUATIONS) {
      expect(ids.has(s.id)).toBe(false);
      ids.add(s.id);
      expect(s.places.length).toBeGreaterThanOrEqual(3);
      for (const p of s.places) {
        expect(p.lat).toBeGreaterThan(24);
        expect(p.lat).toBeLessThan(46);
        expect(p.lon).toBeGreaterThan(122);
        expect(p.lon).toBeLessThan(154);
      }
      for (const text of [s.label, s.approximation, ...s.places.flatMap((p) => [p.name, p.note])]) {
        expect(text.ja.length).toBeGreaterThan(0);
        expect(text.en.length).toBeGreaterThan(0);
        expect(text.en).not.toMatch(/[\u3040-\u30ff\u4e00-\u9fff]/); // 英語に日本語が残っていない
      }
      const ev = situationEvidence(s, areaCharacter([], 90000));
      expect(ev.map((e) => e.metric)).toEqual(s.metrics);
    }
    // 駅前3種類と、ジャンル（ホラー・ほのぼの・近未来）
    expect([...ids]).toEqual(['city-station', 'regional-station', 'rural-station', 'horror', 'calm-residential', 'futuristic']);
  });
});
