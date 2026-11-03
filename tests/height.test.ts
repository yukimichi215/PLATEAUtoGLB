import { createReadStream } from 'node:fs';
import { describe, expect, it } from 'vitest';
import { checkGlb } from '../scripts/lib/check-glb.js';
import { checkMesh } from '../scripts/lib/check-mesh.js';
import type { SourceFile } from '../src/core/catalog.js';
import { generateFromPlan, planArea, type AreaPlan, type AreaRequest, type OpenText } from '../src/core/pipeline.js';

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

function plan(req: Partial<AreaRequest>): AreaPlan {
  const request: AreaRequest = {
    center: { lat: 35.6812, lon: 139.7671 },
    size: 300,
    lod: 2,
    includeRoads: true,
    includeGround: true,
    placeName: '東京駅',
    ...req,
  };
  return { request, meshes: ['53394611'], files: [fakeFile('bldg'), fakeFile('tran')], totalBytes: 2000, unknownSizeFiles: 0 };
}

describe('高さの強調', () => {
  for (const lod of [1, 2] as const) {
    it(`LOD${lod}：1.5 倍で建物の高さが元の 1.5 倍（±1%）、幅・奥行きは変わらない`, async () => {
      const base = await generateFromPlan(plan({ lod }), openText);
      const tall = await generateFromPlan(plan({ lod, heightScale: 1.5 }), openText);
      const a = await checkGlb(base.glb);
      const b = await checkGlb(tall.glb);
      expect(b.validatorErrors).toBe(0);
      expect(b.size!.height / a.size!.height).toBeCloseTo(1.5, 2);
      expect(b.size!.width).toBe(a.size!.width);
      expect(b.size!.depth).toBe(a.size!.depth);
      // 建物ごとにも 1.5 倍
      for (const [i, info] of tall.buildings.entries()) {
        expect(info.modelHeight).toBeCloseTo(base.buildings[i]!.modelHeight * 1.5, 1);
      }
      expect(tall.credit).toContain('建物の高さだけを 1.5 倍に強調');
      expect(tall.fileName).toContain('_h1.5x');
      expect(base.credit).not.toContain('強調');
    });
  }

  it('3Dプリンタ用：台座の厚さは変わらず、建物の高さだけ 2 倍。閉じた形のまま', async () => {
    const print = { scaleDenominator: 1000, baseMm: 3 };
    const base = await generateFromPlan(plan({ print }), openText);
    const tall = await generateFromPlan(plan({ print, heightScale: 2 }), openText);
    const sa = checkMesh('stl', base.stl);
    const sb = checkMesh('stl', tall.stl);
    expect(sb.min![2]).toBeCloseTo(-3, 3); // 台座の底（厚さ 3mm のまま）
    expect(sb.max![2] / sa.max![2]).toBeCloseTo(2, 2); // 台座の上面（0）からの建物の高さが 2 倍
    expect(sb.size!.width).toBeCloseTo(300, 1);
    expect(sb.printable).toMatchObject({ openEdges: 0, pieces: 1, nonPositivePieces: 0, piecesAboveZero: 0 });
    expect(tall.stats.print!.heightMm - 3).toBeCloseTo((base.stats.print!.heightMm - 3) * 2, 0);
  });

  it('倍率の入力を確かめる（1〜3 倍）', async () => {
    const noFetch = async () => ({ cities: [] });
    await expect(planArea({ ...plan({}).request, heightScale: 0.5 }, noFetch)).rejects.toThrow('高さの強調');
    await expect(planArea({ ...plan({}).request, heightScale: 3.5 }, noFetch)).rejects.toThrow('高さの強調');
  });
});
