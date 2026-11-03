import { createReadStream } from 'node:fs';
import { describe, expect, it } from 'vitest';
import { checkGlb } from '../scripts/lib/check-glb.js';
import { checkMesh } from '../scripts/lib/check-mesh.js';
import type { SourceFile } from '../src/core/catalog.js';
import type { Building } from '../src/core/citygml.js';
import { LocalProjector, metersPerDegree } from '../src/core/geo.js';
import { SceneBuilder } from '../src/core/scene.js';
import { generateFromPlan, type AreaPlan, type AreaRequest, type OpenText } from '../src/core/pipeline.js';

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

const objNames = (obj: string) => obj.split('\n').filter((l) => l.startsWith('o ')).map((l) => l.slice(2));

describe('建物ごとに部品を分ける', () => {
  for (const lod of [1, 2] as const) {
    it(`LOD${lod}：GLB のノード・OBJ の o が建物の数と一致し、形は分けないときと同じ`, async () => {
      const merged = await generateFromPlan(plan({ lod }), openText);
      const sep = await generateFromPlan(plan({ lod, separateBuildings: true }), openText);
      const n = sep.stats.buildings;
      expect(n).toBeGreaterThan(1);
      expect(n).toBe(merged.stats.buildings);

      // GLB：Buildings の下に建物ごとのノード（それぞれメッシュを持つ）。道路・地面は1つずつ
      const a = await checkGlb(merged.glb);
      const b = await checkGlb(sep.glb);
      expect(b.validatorErrors).toBe(0);
      expect(b.loadedByThree).toBe(true);
      expect(a.groups).toEqual({ Buildings: 1, Roads: 1, Ground: 1 });
      expect(b.groups).toEqual({ Buildings: n, Roads: 1, Ground: 1 });
      // 三角形の数・外形は同じ
      expect(b.triangles).toBe(a.triangles);
      expect(b.size).toEqual(a.size);
      expect(sep.stats.triangles).toBe(merged.stats.triangles);

      // OBJ：建物ごとの o（名前は重ならない）＋ Roads・Ground
      const names = objNames(sep.obj);
      expect(names.slice(-2)).toEqual(['Roads', 'Ground']);
      const buildingNames = names.slice(0, -2);
      expect(buildingNames.length).toBe(n);
      expect(new Set(buildingNames).size).toBe(n);
      expect(objNames(merged.obj)).toEqual(['Buildings', 'Roads', 'Ground']);
      const objReport = checkMesh('obj', new TextEncoder().encode(sep.obj));
      expect(objReport.ok).toBe(true);
      expect(objReport.objects.length).toBe(n + 2);
      expect(objReport.triangles).toBe(a.triangles);
      // 名前は建物の一覧（buildings.json）の ID から付ける
      for (const [i, info] of sep.buildings.entries()) {
        expect(buildingNames[i]!.startsWith(info.buildingId ?? info.id)).toBe(true);
      }
      // STL は部品の区別がないので、同じ三角形の数の1つの形
      expect(checkMesh('stl', sep.stl).triangles).toBe(a.triangles);
    });
  }

  it('付属物・窓扉の材質も建物ごとの部品に入り、材質は共有される', async () => {
    const sep = await generateFromPlan(plan({ lod: 2, installations: true, separateBuildings: true }), openText);
    const b = await checkGlb(sep.glb);
    expect(b.validatorErrors).toBe(0);
    expect(b.groups.Buildings).toBe(sep.stats.buildings);
    // .mtl は種類ごとに1つ（建物の数だけ増えない）
    const newmtl = sep.mtl.split('\n').filter((l) => l.startsWith('newmtl ')).length;
    expect(newmtl).toBeLessThanOrEqual(7);
  });

  it('3D プリンタ用では分けない（1つの立体のまま）', async () => {
    const res = await generateFromPlan(plan({ print: { scaleDenominator: 1000, baseMm: 3 }, separateBuildings: true }), openText);
    const b = await checkGlb(res.glb);
    expect(b.groups.Buildings).toBe(1);
    expect(objNames(res.obj)).toEqual(['Buildings', 'Roads', 'Ground']);
    expect(checkMesh('stl', res.stl).printable!.pieces).toBe(1);
  });

  it('部品の名前が重なったら、後のものに番号を付けて分ける', () => {
    const center = { lat: 35.68, lon: 139.76 };
    const m = metersPerDegree(center.lat);
    // 一辺 2m・高さ 5m の箱（x, z は中心からの m）
    const box = (id: string, buildingId: string | undefined, x: number): Building => {
      const sq = [[x, 0], [x + 2, 0], [x + 2, 2], [x, 2]];
      const ring = (pts: number[][], h: number) => pts.flatMap(([px, pz]) => [center.lat - pz! / m.lat, center.lon + px! / m.lon, h]);
      return {
        id,
        attrs: buildingId ? { buildingId } : {},
        lod1: [
          { exterior: ring(sq, 5), interiors: [] },
          { exterior: ring([...sq].reverse(), 0), interiors: [] },
        ],
        lod2: [],
        installations: [],
        lod3: [],
        installations3: [],
      };
    };
    const scene = new SceneBuilder({ projector: new LocalProjector(center), half: 50, lod: 1, separate: true });
    for (const b of [box('a', 'X-1', -20), box('b', 'X-1', -10), box('c', 'X-1_2', 0), box('d', undefined, 10)]) {
      expect(scene.addBuilding(b)).toBe(true);
    }
    const names = scene.pieces().filter((p) => p.group === 'Buildings').map((p) => p.name);
    expect(names).toEqual(['X-1', 'X-1_2', 'X-1_2_2', 'd']);
  });
});
