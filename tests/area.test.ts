import { createReadStream } from 'node:fs';
import { describe, expect, it } from 'vitest';
import { checkMesh } from '../scripts/lib/check-mesh.js';
import type { SourceFile } from '../src/core/catalog.js';
import { LocalProjector, metersPerDegree, type LatLon } from '../src/core/geo.js';
import { polygonIssue } from '../src/core/area.js';
import { clipPolygonByRing, isSimpleRing, pointInRing } from '../src/core/geometry.js';
import { areaOfPolygon, generateFromPlan, validateRequest, type AreaPlan, type AreaRequest, type OpenText } from '../src/core/pipeline.js';

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

const CENTER = { lat: 35.6812, lon: 139.7671 };
const m = metersPerDegree(CENTER.lat);
/** ローカル座標（x 東, z 南。m）→ 緯度経度 */
const toLatLon = (pts: number[][]): LatLon[] => pts.map(([x, z]) => ({ lat: CENTER.lat - z! / m.lat, lon: CENTER.lon + x! / m.lon }));

// L 字（へこんだ形）。北東の角（x > 0 かつ z < -35）を除く
const L = [[-150, -150], [0, -150], [0, -35], [150, -35], [150, 150], [-150, 150]];
const L_RING = L.flat();

function plan(req: Partial<AreaRequest>): AreaPlan {
  const request: AreaRequest = { center: CENTER, size: 300, lod: 1, includeRoads: true, includeGround: true, placeName: '東京駅', ...req };
  return { request, meshes: ['53394611'], files: [fakeFile('bldg'), fakeFile('tran')], totalBytes: 2000, unknownSizeFiles: 0 };
}

const polygonReq = (pts: number[][]): Partial<AreaRequest> => {
  const polygon = toLatLon(pts);
  return { polygon, ...areaOfPolygon(polygon) };
};

describe('囲んだ範囲の計算', () => {
  it('点が内側か・線が交差していないか', () => {
    expect(pointInRing(-10, 0, L_RING)).toBe(true);
    expect(pointInRing(10, -50, L_RING)).toBe(false); // 除いた角
    expect(pointInRing(200, 0, L_RING)).toBe(false);
    expect(isSimpleRing(L_RING)).toBe(true);
    expect(isSimpleRing([0, 0, 10, 10, 10, 0, 0, 10])).toBe(false); // 8の字
  });

  it('画面で囲んだ範囲の問題を見分ける（点が足りない・交差・大きすぎる）', () => {
    expect(polygonIssue(toLatLon(L))).toBeUndefined();
    expect(polygonIssue(toLatLon([[0, 0], [10, 10]]))).toBe('tooFew');
    expect(polygonIssue(toLatLon([[0, 0], [100, 100], [100, 0], [0, 100]]))).toBe('crossing');
    expect(polygonIssue(toLatLon([[-600, -100], [600, -100], [600, 100], [-600, 100]]))).toBe('tooLarge');
    expect(polygonIssue(toLatLon([[-499, -100], [499, -100], [499, 100], [-499, 100]]))).toBeUndefined();
  });

  it('多角形を、へこんだ範囲で切り取る（面積が合う）', () => {
    // 一辺 100 の正方形（-50〜50）を L 字で切ると、北東の角（0〜50 × -50〜-35）が欠ける
    const cut = clipPolygonByRing([-50, -50, 50, -50, 50, 50, -50, 50], [], L_RING);
    let area = 0;
    const p = cut.points;
    for (let t = 0; t < cut.indices.length; t += 3) {
      const [a, b, c] = [cut.indices[t]! * 2, cut.indices[t + 1]! * 2, cut.indices[t + 2]! * 2];
      area += Math.abs((p[b]! - p[a]!) * (p[c + 1]! - p[a + 1]!) - (p[c]! - p[a]!) * (p[b + 1]! - p[a + 1]!)) / 2;
    }
    expect(area).toBeCloseTo(100 * 100 - 50 * 15, 6);
  });

  it('囲んだ範囲がちょうど入る正方形', () => {
    const { center, size } = areaOfPolygon(toLatLon(L));
    expect(center.lat).toBeCloseTo(CENTER.lat, 7);
    expect(center.lon).toBeCloseTo(CENTER.lon, 7);
    expect(size).toBe(300);
  });
});

describe('範囲を囲んで切り出す', () => {
  it('囲んだ範囲の外の建物は 0、内側の建物は入る', async () => {
    const square = await generateFromPlan(plan({}), openText);
    const area = await generateFromPlan(plan(polygonReq(L)), openText);
    const inside = square.buildings.filter((b) => pointInRing(b.x, b.z, L_RING));
    expect(inside.length).toBeGreaterThan(0);
    expect(inside.length).toBeLessThan(square.buildings.length); // 外の建物が見本にある（確かめ方が意味を持つ）
    expect(area.buildings.map((b) => b.id).sort()).toEqual(inside.map((b) => b.id).sort());
    for (const b of area.buildings) expect(pointInRing(b.x, b.z, L_RING)).toBe(true);
    expect(area.credit).toContain('地図の上で囲んだ範囲（6 点の多角形');
    expect(area.fileName).toMatch(/_area$/);
  });

  it('道路・地面は囲んだ形で切られる（頂点がすべて範囲の中か線の上）', async () => {
    const res = await generateFromPlan(plan(polygonReq(L)), openText);
    const obj = res.obj.split('\n');
    const verts = obj.filter((l) => l.startsWith('v ')).map((l) => l.slice(2).split(' ').map(Number));
    // Roads・Ground の面が使う頂点
    let current = '';
    const used = new Set<number>();
    for (const l of obj) {
      if (l.startsWith('o ')) current = l.slice(2);
      else if (l.startsWith('f ') && current !== 'Buildings') for (const i of l.slice(2).split(' ')) used.add(Number(i) - 1);
    }
    expect(used.size).toBeGreaterThan(0);
    const near = (x: number, z: number) => pointInRing(x, z, L_RING) || [0, 1, 2, 3, 4, 5].some((i) => {
      const [ax, az] = L[i]!, [bx, bz] = L[(i + 1) % 6]!;
      const len = Math.hypot(bx! - ax!, bz! - az!);
      const t = Math.max(0, Math.min(1, ((x - ax!) * (bx! - ax!) + (z - az!) * (bz! - az!)) / len ** 2));
      return Math.hypot(x - (ax! + t * (bx! - ax!)), z - (az! + t * (bz! - az!))) < 0.05;
    });
    for (const i of used) expect(near(verts[i]![0]!, verts[i]![2]!)).toBe(true);
    // 地面の面積は L 字の面積（300×300 − 150×115）
    const groundLines = obj.slice(obj.indexOf('o Ground'));
    let area = 0;
    for (const l of groundLines.filter((x) => x.startsWith('f '))) {
      const [a, b, c] = l.slice(2).split(' ').map((i) => verts[Number(i) - 1]!);
      area += Math.abs((b![0]! - a![0]!) * (c![2]! - a![2]!) - (c![0]! - a![0]!) * (b![2]! - a![2]!)) / 2;
    }
    expect(area).toBeCloseTo(300 * 300 - 150 * 115, 0);
  });

  it('3D プリンタ用：台座は囲んだ形、閉じた1つの立体になる', async () => {
    const res = await generateFromPlan(plan({ ...polygonReq(L), print: { scaleDenominator: 1000, baseMm: 2 } }), openText);
    const stl = checkMesh('stl', res.stl);
    expect(stl.printable).toMatchObject({ openEdges: 0, pieces: 1, nonPositivePieces: 0 });
    // 1/1000 なので mm の値 = m の値。STL は +Z が上・+Y が北（z_local = -y）
    const p = new DataView(res.stl.buffer, res.stl.byteOffset);
    const n = p.getUint32(80, true);
    for (let t = 0; t < n; t++) {
      for (let v = 0; v < 3; v++) {
        const o = 84 + t * 50 + 12 + v * 12;
        const x = p.getFloat32(o, true), y = p.getFloat32(o + 4, true);
        // 北東の角（x > 0.05 かつ z < -35.05）には何もない
        expect(x > 0.05 && -y < -35.05).toBe(false);
      }
    }
    expect(res.stats.print!.widthMm).toBe(300);
    expect(res.stats.print!.depthMm).toBe(300);
  });

  it('囲み方の誤りを知らせる', () => {
    const base = { center: CENTER, size: 300, lod: 1 as const, includeRoads: true, includeGround: true };
    expect(() => validateRequest({ ...base, polygon: toLatLon([[0, 0], [10, 0]]) })).toThrow('3点以上');
    const bow = toLatLon([[-50, -50], [50, 50], [50, -50], [-50, 50]]);
    expect(() => validateRequest({ ...base, ...areaOfPolygon(bow), polygon: bow })).toThrow('交差');
    // 正方形より外にはみ出す
    expect(() => validateRequest({ ...base, size: 100, polygon: toLatLon(L) })).toThrow('大きすぎ');
  });
});

// LocalProjector を使わないと型の import が消えるため（toLatLon と同じ向きであることの確認）
it('ローカル座標と緯度経度の向き', () => {
  const [x, z] = new LocalProjector(CENTER).toXZ(toLatLon([[10, -20]])[0]!.lat, toLatLon([[10, -20]])[0]!.lon);
  expect(x).toBeCloseTo(10, 6);
  expect(z).toBeCloseTo(-20, 6);
});
