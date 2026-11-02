import { createReadStream } from 'node:fs';
import { describe, expect, it } from 'vitest';
import { checkGlb } from '../scripts/lib/check-glb.js';
import type { SourceFile } from '../src/core/catalog.js';
import { readCityGml, type Building } from '../src/core/citygml.js';
import { generateFromPlan, planArea, type AreaPlan, type AreaRequest, type OpenText } from '../src/core/pipeline.js';

const FIXTURE: Record<string, string> = {
  bldg: 'bldg_tokyo_station.gml',
  tran: 'tran_sample.gml',
};
const openFixture = (type: string) =>
  createReadStream(new URL(`./fixtures/${FIXTURE[type]}`, import.meta.url), { encoding: 'utf8' }) as AsyncIterable<string>;

const openText: OpenText = async (file) => openFixture(file.type);

function fakeFile(type: 'bldg' | 'tran'): SourceFile {
  return {
    type,
    mesh: '53394611',
    url: `https://assets.cms.plateau.reearth.io/test/13101/udx/${type}/53394611_${type}_6697_op.gml`,
    fileSize: 1000,
    maxLod: 2,
    cities: [
      { code: '13101', name: '千代田区', year: 2025, url: `https://assets.cms.plateau.reearth.io/test/13101/${type}.gml` },
      { code: '13102', name: '中央区', year: 2025, url: `https://assets.cms.plateau.reearth.io/test/13102/${type}.gml` },
    ],
  };
}

function plan(req: Partial<AreaRequest> = {}): AreaPlan {
  const request: AreaRequest = {
    center: { lat: 35.6812, lon: 139.7671 },
    size: 300,
    lod: 1,
    includeRoads: true,
    includeGround: true,
    placeName: '東京駅',
    ...req,
  };
  const files = request.includeRoads ? [fakeFile('bldg'), fakeFile('tran')] : [fakeFile('bldg')];
  return { request, meshes: ["53394611"], files, totalBytes: 1000 * files.length, unknownSizeFiles: 0 };
}

/** 元データでの、建物ごとの高さ（いちばん高い点 − いちばん低い点）の最大 */
async function sourceMaxHeight(lod: 1 | 2): Promise<number> {
  const list: Building[] = [];
  await readCityGml(openFixture('bldg'), { onBuilding: (b) => list.push(b) });
  let max = 0;
  for (const b of list) {
    const polys = lod === 1 ? b.lod1 : b.lod2.map((s) => s.polygon);
    const z: number[] = [];
    for (const p of polys) for (let i = 2; i < p.exterior.length; i += 3) z.push(p.exterior[i]!);
    max = Math.max(max, Math.max(...z) - Math.min(...z));
  }
  return max;
}

describe('GLB を作る流れ（テスト用の小さなデータ）', () => {
  for (const lod of [1, 2] as const) {
    it(`LOD${lod}：Validator のエラー0件・three.js で読める・高さが元データと合う・原点が中心`, async () => {
      const res = await generateFromPlan(plan({ lod }), openText);
      expect(res.stats.buildings).toBe(6);
      expect(res.stats.roads).toBeGreaterThanOrEqual(1); // 見本の道路3本のうち、範囲にかかるもの

      const report = await checkGlb(res.glb);
      expect(report.validatorMessages).toEqual([]);
      expect(report.validatorErrors).toBe(0);
      expect(report.loadedByThree).toBe(true);
      expect(report.usesExtensions).toEqual([]); // Draco などの圧縮を使っていない
      expect(report.triangles).toBe(res.stats.triangles);

      // 高さ：元データの形の高さと一致（地面を0にそろえるだけで、高さは変えない）
      expect(report.max![1]).toBeCloseTo(await sourceMaxHeight(lod), 2);
      expect(report.min![1]).toBeCloseTo(0, 5);
      // 原点は範囲の中心：地面の板（一辺300m）がちょうど ±150m
      expect(report.size!.width).toBeGreaterThanOrEqual(300);
      expect(report.min![0]).toBeLessThanOrEqual(-150);
      expect(report.max![0]).toBeGreaterThanOrEqual(150);
      // 大きな座標のまま出していない
      expect(Math.max(...report.max!.map(Math.abs), ...report.min!.map(Math.abs))).toBeLessThan(1000);

      // 出典
      expect(report.copyright).toContain('3D都市モデル（Project PLATEAU）千代田区（2025年度）');
      expect(report.copyright).toContain('加工して作成');
      expect(res.credit).toContain('国土交通省・各自治体が作成したものではありません');
      expect(res.credit).toContain('https://assets.cms.plateau.reearth.io/test/13101/');
    });
  }

  it('建物の自治体コードから出典の自治体を絞る（道路は配布元すべて）', async () => {
    const res = await generateFromPlan(plan({ includeRoads: false }), openText);
    expect(res.credit).toContain('千代田区');
    expect(res.credit).not.toContain('中央区');
  });

  it('LOD1 は LOD2 より三角形が少ない（軽い）', async () => {
    const a = await generateFromPlan(plan({ lod: 1, includeRoads: false, includeGround: false }), openText);
    const b = await generateFromPlan(plan({ lod: 2, includeRoads: false, includeGround: false }), openText);
    expect(a.stats.triangles).toBeLessThan(b.stats.triangles);
  });

  it('窓の模様：壁に模様の位置と画像が入り、Validator のエラー0件・three.js で読める', async () => {
    const plain = await generateFromPlan(plan({ lod: 2 }), openText);
    const res = await generateFromPlan(plan({ lod: 2, windows: true }), openText);
    const report = await checkGlb(res.glb);
    expect(report.validatorMessages.filter((m) => m.startsWith('エラー'))).toEqual([]);
    expect(report.validatorErrors).toBe(0);
    expect(report.loadedByThree).toBe(true);
    expect(report.usesExtensions).toEqual([]);
    // 形は同じで、増えるのは模様の画像1枚（約50KB）と壁の頂点ごとの模様の位置（8バイト）だけ
    expect(res.stats.triangles).toBe(plain.stats.triangles);
    const wallVertices = plain.stats.vertices; // 壁の頂点数はこれ以下
    expect(res.glb.byteLength - plain.glb.byteLength).toBeLessThan(100_000 + wallVertices * 8);
    expect(res.fileName).toContain('lod2_win');
    expect(res.credit).toContain('実際の窓の位置ではない');
    const json = new TextDecoder().decode(res.glb.slice(20, 20 + new DataView(res.glb.buffer).getUint32(12, true)));
    const gltf = JSON.parse(json);
    expect(gltf.images).toHaveLength(1);
    expect(gltf.images[0].mimeType).toBe('image/png');
    expect(gltf.images[0].uri).toBeUndefined(); // 外部ファイルの参照なし
  });

  it('付属物の指定は屋根の形あり（LOD2）のときだけ効く', async () => {
    const a = await generateFromPlan(plan({ lod: 1, installations: true, includeRoads: false }), openText);
    expect(a.fileName).toContain('lod1');
    expect(a.stats.buildingsWithInstallations).toBe(0);
    const b = await generateFromPlan(plan({ lod: 2, installations: true, includeRoads: false }), openText);
    expect(b.fileName).toContain('lod2plus');
    expect(b.credit).toContain('付属物');
  });

  it('範囲の外の建物は入れない', async () => {
    // 東京駅から約1km東
    await expect(
      generateFromPlan(plan({ center: { lat: 35.6812, lon: 139.778 }, size: 100 }), openText),
    ).rejects.toThrow('建物が見つかりませんでした');
  });

  it('広さ・場所の入力を確かめる', async () => {
    const noFetch = async () => ({ cities: [] });
    await expect(planArea({ ...plan().request, size: 5000 }, noFetch)).rejects.toThrow('広さ');
    await expect(planArea({ ...plan().request, center: { lat: 0, lon: 0 } }, noFetch)).rejects.toThrow('日本');
  });
});
