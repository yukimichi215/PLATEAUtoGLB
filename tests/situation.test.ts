import { createReadStream, readFileSync } from 'node:fs';
import { describe, expect, it } from 'vitest';
import type { SourceFile } from '../src/core/catalog.js';
import { readCityGml, type Building } from '../src/core/citygml.js';
import { generateFromPlan, type AreaPlan, type OpenText } from '../src/core/pipeline.js';
import { areaCharacter, evidenceOf, situationEvidence, SITUATIONS } from '../src/core/situation.js';
import { evidenceText } from '../src/web/evidence-text.js';
import { metersPerDegree } from '../src/core/geo.js';

const KANAZAWA = 'bldg_kanazawa_attrs.gml';
const fixture = (name: string) =>
  createReadStream(new URL(`./fixtures/${name}`, import.meta.url), { encoding: 'utf8' }) as AsyncIterable<string>;
const rawText = readFileSync(new URL(`./fixtures/${KANAZAWA}`, import.meta.url), 'utf8');
/** 元の GML の、タグの中身の値の一覧（建物ごとに1つずつ書かれている属性） */
const values = (tag: string) => [...rawText.matchAll(new RegExp(`<${tag}[^>]*>([^<]*)<`, 'g'))].map((m) => m[1]!);
/** 面の高さ（標高）の平均。PLATEAU の座標は 緯度・経度・高さ の順 */
const avgAlt = (r: number[]) => r.filter((_, i) => i % 3 === 2).reduce((a, b) => a + b, 0) / (r.length / 3);
/** 緯度経度の輪の広さ（m²）。その場所の 1 度あたりの長さで平面にして測る */
function groundArea(r: number[]): number {
  const m = metersPerDegree(r[0]!);
  let sum = 0;
  for (let i = 0; i < r.length; i += 3) {
    const j = (i + 3) % r.length;
    sum += r[i + 1]! * m.lon * r[j]! * m.lat - r[j + 1]! * m.lon * r[i]! * m.lat;
  }
  return Math.abs(sum) / 2;
}

describe('シチュエーション検索の根拠の数値', () => {
  it('作った例の建物で、割合と数を正しく数える', () => {
    const c = areaCharacter(
      [
        { measuredHeight: 10, footprintM2: 100 },
        { measuredHeight: 40, footprintM2: 500 },
        { measuredHeight: 70, footprintM2: 3000 },
        {},
      ],
      20000,
    );
    expect(c).toMatchObject({ buildings: 4, areaHa: 2, density: 2, heightKnown: 3, tall31: 2, tall60: 1, footprintKnown: 3, small: 1, large: 1 });
    expect(c.avgHeight).toBeCloseTo(40, 9);
    // 高さのばらつき・中層は、小さな建物（150m² 未満）を除いた 40m と 70m の2棟で数える
    expect(c).toMatchObject({ mainKnown: 2, mid: 0 });
    expect(c.heightSd).toBeCloseTo(15, 9);
    expect(areaCharacter([{ measuredHeight: 12, footprintM2: 400 }, { measuredHeight: 20, footprintM2: 400 }, { measuredHeight: 3, footprintM2: 20 }], 10000)).toMatchObject({ mainKnown: 2, mid: 2 });
    expect(c.avgFootprint).toBeCloseTo(1200, 9);
    expect(evidenceOf(c, 'small')).toMatchObject({ known: true, n: 1, of: 3, pct: 33 });
    expect(evidenceText(evidenceOf(c, 'large'), 'ja').value).toBe('33%（1 棟 / 3 棟）');
    expect(evidenceText(evidenceOf(c, 'density'), 'ja').value).toBe('1 ha（100m 四方）あたり 2.0 棟（4 棟 / 2.0 ha）');
    expect(evidenceText(evidenceOf(c, 'tall60'), 'ja').value).toBe('1 棟（高さが分かる 3 棟のうち 33%）');
    expect(evidenceText(evidenceOf(c, 'heightSd'), 'ja').value).toBe('± 15.0 m（小さな建物を除いて高さが分かる 2 棟）');
    expect(evidenceText(evidenceOf(c, 'avgFootprint'), 'ja').value).toBe('1,200 m²（3 棟）');
    expect(evidenceText(evidenceOf(c, 'avgHeight'), 'en').value).toBe('40.0 m (3 buildings with a known height)');
    expect(evidenceText(evidenceOf(c, 'small'), 'en')).toEqual({ label: 'Small buildings (under 150 m² from above, about a house)', value: '33% (1 of 3 buildings)' });
  });

  it('データにない特徴は「データなし」と出し、0% と見せない', () => {
    const c = areaCharacter([{ footprintM2: 80 }], 10000);
    const e = evidenceOf(c, 'avgHeight');
    expect(e.known).toBe(false);
    expect(evidenceText(e, 'ja').value).toContain('データなし');
    expect(evidenceText(e, 'en').value).toContain('No data');
    expect(evidenceOf(c, 'heightSd').known).toBe(false);
    expect(evidenceOf(c, 'small').known).toBe(true);
  });

  it('実データ（金沢市の30棟）で、高さの数値が元の GML の値と一致し、上から見た大きさが地面の形の広さと合う', async () => {
    const list: Building[] = [];
    await readCityGml(fixture(KANAZAWA), { onBuilding: (b) => list.push(b) });
    expect(list).toHaveLength(30);
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
    const c = areaCharacter(res.buildings, 1e6);
    expect(c.footprintKnown).toBe(res.buildings.length);

    // 高さ：元の GML を文字のまま数えた値と比べる
    const ids = new Set(res.buildings.map((b) => b.id));
    const inside = list.filter((b) => ids.has(b.id));
    const heights = inside.map((b) => b.attrs.measuredHeight).filter((h): h is number => h !== undefined);
    expect(c.heightKnown).toBe(heights.length);
    expect(c.avgHeight).toBeCloseTo(heights.reduce((a, b) => a + b, 0) / heights.length, 9);
    expect(values('bldg:measuredHeight').length).toBe(30);

    // 上から見た大きさ：いちばん低い面（地面の形）の広さを、緯度経度から別の方法で求めて比べる
    for (const info of res.buildings) {
      const b = inside.find((x) => x.id === info.id)!;
      const ground = [...b.lod1].sort((p, q) => avgAlt(p.exterior) - avgAlt(q.exterior))[0]!.exterior;
      const area = groundArea(ground);
      expect(Math.abs(info.footprintM2 - area)).toBeLessThanOrEqual(Math.max(1, area * 0.02));
    }
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
    // 駅前3種類と、町並み（戸建て住宅地・団地・工場・倉庫街・まばらな集落）。見た目でわからない条件（木造・古さ）は作らない
    expect([...ids]).toEqual(['city-station', 'regional-station', 'rural-station', 'detached-houses', 'housing-estate', 'industrial', 'sparse-village']);
  });
});
