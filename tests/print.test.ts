import { createReadStream } from 'node:fs';
import { STLLoader } from 'three/examples/jsm/loaders/STLLoader.js';
import { describe, expect, it } from 'vitest';
import { checkGlb } from '../scripts/lib/check-glb.js';
import { checkMesh, piecesOf as pieces } from '../scripts/lib/check-mesh.js';
import type { SourceFile } from '../src/core/catalog.js';
import { generateFromPlan, planArea, type AreaPlan, type AreaRequest, type OpenText } from '../src/core/pipeline.js';
import type { Building } from '../src/core/citygml.js';
import { LocalProjector, metersPerDegree } from '../src/core/geo.js';
import { finishForPrint, type PrintOptions } from '../src/core/print.js';
import { SceneBuilder } from '../src/core/scene.js';
import { box, countOpenEdges, extrudeDown } from '../src/core/solid.js';

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

function plan(lod: 1 | 2, print: PrintOptions, req: Partial<AreaRequest> = {}): AreaPlan {
  return {
    request: {
      center: { lat: 35.6812, lon: 139.7671 },
      size: 300,
      lod,
      includeRoads: true,
      includeGround: true,
      placeName: '東京駅',
      print,
      ...req,
    },
    meshes: ['53394611'],
    files: [fakeFile('bldg'), fakeFile('tran')],
    totalBytes: 2000,
    unknownSizeFiles: 0,
  };
}

/** STL を読んで、頂点（x, y, z の並び）と三角形の番号にする */
function readStl(stl: Uint8Array): { positions: Float32Array; indices: Uint32Array } {
  const ab = stl.buffer.slice(stl.byteOffset, stl.byteOffset + stl.byteLength) as ArrayBuffer;
  const positions = new STLLoader().parse(ab).attributes.position!.array as Float32Array;
  return { positions, indices: Uint32Array.from({ length: positions.length / 3 }, (_, i) => i) };
}

function signedVolume(p: number[], idx: number[]): number {
  let v = 0;
  for (let t = 0; t < idx.length; t += 3) {
    const [a, b, c] = [idx[t]! * 3, idx[t + 1]! * 3, idx[t + 2]! * 3];
    v +=
      (p[a]! * (p[b + 1]! * p[c + 2]! - p[b + 2]! * p[c + 1]!) -
        p[a + 1]! * (p[b]! * p[c + 2]! - p[b + 2]! * p[c]!) +
        p[a + 2]! * (p[b]! * p[c + 1]! - p[b + 1]! * p[c]!)) /
      6;
  }
  return v;
}

describe('閉じた形を作る計算', () => {
  it('穴のある多角形・傾いた屋根を押し出すと、閉じて表が外向きの柱になる', () => {
    const flat = [0, 5, 0, 10, 5, 0, 10, 5, 10, 0, 5, 10];
    const hole = [3, 5, 3, 3, 5, 6, 6, 5, 6, 6, 5, 3];
    const s = extrudeDown(flat, [hole], -1)!;
    expect(countOpenEdges(s.positions, s.indices)).toBe(0);
    expect(signedVolume(s.positions, s.indices)).toBeCloseTo((100 - 9) * 6, 6);

    const sloped = [0, 5, 0, 10, 5, 0, 10, 8, 10, 0, 8, 10]; // 片側が高い屋根
    const t = extrudeDown(sloped, [], -1)!;
    expect(countOpenEdges(t.positions, t.indices)).toBe(0);
    expect(signedVolume(t.positions, t.indices)).toBeCloseTo(100 * (6.5 + 1), 6);
  });

  it('向きが逆の多角形・同じ点の繰り返しがあっても閉じた形になる。壁のような面は押し出さない', () => {
    const cw = [0, 3, 0, 0, 3, 4, 0, 3, 4, 4, 3, 4, 4, 3, 0];
    const s = extrudeDown(cw, [], 0)!;
    expect(countOpenEdges(s.positions, s.indices)).toBe(0);
    expect(extrudeDown([0, 0, 0, 5, 0, 0, 5, 3, 0, 0, 3, 0], [], -1)).toBeNull(); // 上から見て面積がない
    const b = box(-1, 1, -2, 0, -1, 1);
    expect(countOpenEdges(b.positions, b.indices)).toBe(0);
    expect(b.indices.length / 3).toBe(12);
  });
});

describe('3Dプリンタ用（縮尺・台座・閉じた形）', () => {
  for (const lod of [1, 2] as const) {
    it(`LOD${lod}：300m 四方を 1/1000 → 幅 300mm、STL は閉じた形・体積が正・すべての部品が台座とつながる`, async () => {
      const res = await generateFromPlan(plan(lod, { scaleDenominator: 1000, baseMm: 3 }), openText);
      const p = res.stats.print!;
      expect(p.scaleLabel).toBe('1/1000');
      expect(p.widthMm).toBe(300);
      expect(p.depthMm).toBe(300);

      // STL：ミリメートル・+Z が上
      const stl = checkMesh('stl', res.stl);
      expect(stl.size!.width).toBeCloseTo(300, 1);
      expect(stl.size!.height).toBeCloseTo(300, 1); // STL の y は北向き（奥行き）
      expect(stl.max![2] - stl.min![2]).toBeCloseTo(p.heightMm, 1); // 高さは台座の底から一番高い屋根まで
      expect(stl.min![2]).toBeCloseTo(-3, 3); // 台座の底（厚さ 3mm）

      // 閉じた形：穴・すき間がなく、どの辺もちょうど2つの面が共有し、体積が正
      // 建物・道路は台座と1つの立体にまとまる（離れた部品がない）
      expect(stl.printable).toEqual({ openEdges: 0, nonManifoldEdges: 0, pieces: 1, nonPositivePieces: 0, piecesAboveZero: 0 });
      // 元の三角形の番号でも、どの辺もちょうど2つの面が共有する
      const { positions, indices } = readStl(res.stl);
      expect(countOpenEdges(positions, indices)).toBe(0);

      // 建物の高さ：元の高さ（実物）× 縮尺
      const plain = await generateFromPlan(plan(lod, { scaleDenominator: 1000, baseMm: 0 }, { print: undefined, includeGround: false, includeRoads: false }), openText);
      expect(p.heightMm - 3).toBeCloseTo(plain.stats.height, 0); // 1/1000 なので m の値 = mm の値

      // GLB：メートルで縮尺をかけた大きさ（0.3m）、Validator エラー0、three.js で読める
      const glb = await checkGlb(res.glb);
      expect(glb.validatorErrors).toBe(0);
      expect(glb.loadedByThree).toBe(true);
      expect(glb.size!.width).toBeCloseTo(0.3, 3);
      expect(glb.copyright).toContain('加工して作成');

      // OBJ：ミリメートル・+Y が上
      const obj = checkMesh('obj', new TextEncoder().encode(res.obj));
      expect(obj.size!.width).toBeCloseTo(300, 1);
      expect(obj.size!.depth).toBeCloseTo(300, 1);
      expect(res.obj).toContain('単位：ミリメートル（縮尺 1/1000）');

      // 出典に加工の内容
      expect(res.credit).toContain('縮尺 1/1000');
      expect(res.credit).toContain('厚さ 3 mm の台座');
      expect(res.fileName).toContain('_print');
    });
  }

  it('横幅に合わせる：一辺 100mm を指定すると、台座の一辺が 100mm', async () => {
    const res = await generateFromPlan(plan(2, { fitSideMm: 100, baseMm: 2 }), openText);
    expect(res.stats.print!.widthMm).toBe(100);
    expect(res.stats.print!.scaleLabel).toBe('約1/3000');
    const stl = checkMesh('stl', res.stl);
    expect(stl.size!.width).toBeCloseTo(100, 1);
    expect(stl.min![2]).toBeCloseTo(-2, 3);
    const { positions, indices } = readStl(res.stl);
    expect(countOpenEdges(positions, indices)).toBe(0);
  });

  it('範囲からはみ出した建物は切り落とす（台座の外に出ない）', async () => {
    const res = await generateFromPlan(plan(1, { scaleDenominator: 1000, baseMm: 3 }, { size: 100 }), openText);
    const stl = checkMesh('stl', res.stl);
    expect(stl.size!.width).toBeCloseTo(100, 1);
    expect(stl.size!.height).toBeCloseTo(100, 1);
    const { positions, indices } = readStl(res.stl);
    expect(countOpenEdges(positions, indices)).toBe(0);
  });

  it('台座なしでも閉じた形になる', async () => {
    const res = await generateFromPlan(plan(2, { scaleDenominator: 2000, baseMm: 0 }), openText);
    const { positions, indices } = readStl(res.stl);
    expect(countOpenEdges(positions, indices)).toBe(0);
    for (const piece of pieces(positions)) expect(piece.volume).toBeGreaterThan(0);
    // 台座がないので、建物・道路はばらばらの部品になる（それぞれは閉じた形）
    expect(pieces(positions).length).toBeGreaterThan(1);
    expect(res.credit).not.toContain('台座');
  });

  it('縮尺・台座の入力を確かめる', async () => {
    const noFetch = async () => ({ cities: [] });
    const req = plan(1, { scaleDenominator: 1000, baseMm: 3 }).request;
    await expect(planArea({ ...req, print: { scaleDenominator: 10, baseMm: 3 } }, noFetch)).rejects.toThrow('縮尺');
    await expect(planArea({ ...req, print: { fitSideMm: 5, baseMm: 3 } }, noFetch)).rejects.toThrow('長さ');
    await expect(planArea({ ...req, print: { scaleDenominator: 1000, baseMm: -1 } }, noFetch)).rejects.toThrow('台座');
  });
});

describe('範囲の端で切り落とす（へこんだ形）', () => {
  it('C 字形の建物を範囲の線で切っても捨てずに、切り口の閉じた形が2つ残る', async () => {
    const center = { lat: 35.68, lon: 139.76 };
    const m = metersPerDegree(center.lat);
    // ローカル座標（x 東, z 南, 高さ）→ 緯度・経度・高さ
    const ring = (pts: number[][], h: number) =>
      pts.flatMap(([x, z]) => [center.lat - z! / m.lat, center.lon + x! / m.lon, h]);
    // 左に開いた C 字形（x = 10 より右でつながっている）。範囲は一辺 20m（x = ±10 で切る）
    const c = [[0, -8], [16, -8], [16, 8], [0, 8], [0, 4], [12, 4], [12, -4], [0, -4]];
    const building: Building = {
      id: 'c-shape',
      attrs: {},
      lod1: [
        { exterior: ring(c, 10), interiors: [] }, // 上の面
        { exterior: ring([...c].reverse(), 0), interiors: [] }, // 底
      ],
      lod2: [],
      installations: [],
      lod3: [],
      installations3: [],
    };
    const scene = new SceneBuilder({ projector: new LocalProjector(center), half: 10, lod: 1, solid: true });
    expect(scene.addBuilding(building)).toBe(true);
    const info = await finishForPrint(scene, 10, { scaleDenominator: 1000, baseMm: 0 });
    expect(info.droppedFaces).toBe(0);
    const part = scene.parts.roof;
    expect(part.triangleCount).toBeGreaterThan(0);
    // 1/1000 なので m の値をそのまま mm として見る。x = 10 より右は残らない
    let maxX = -Infinity;
    for (let i = 0; i < part.positions.length; i += 3) maxX = Math.max(maxX, part.positions[i]!);
    expect(maxX).toBeCloseTo(10, 4);
    const pos = Float32Array.from(part.positions);
    expect(countOpenEdges(pos, part.indices)).toBe(0);
    // 上下の帯（各 10 × 4 m）が、高さ 10 m の2つの閉じた形として残る：体積 2 × 400
    const zUp = new Float32Array(pos.length);
    for (let i = 0; i < pos.length; i += 3) {
      zUp[i] = pos[i]!;
      zUp[i + 1] = -pos[i + 2]!;
      zUp[i + 2] = pos[i + 1]!;
    }
    const list = pieces(zUp);
    expect(list.length).toBe(2);
    for (const p of list) expect(p.volume).toBeCloseTo(400, 1);
  });

  it('範囲の端で切り落としたあとに細く残るだけの建物は、細かすぎる部分として外す', async () => {
    const center = { lat: 35.68, lon: 139.76 };
    const m = metersPerDegree(center.lat);
    const ring = (pts: number[][], h: number) =>
      pts.flatMap(([x, z]) => [center.lat - z! / m.lat, center.lon + x! / m.lon, h]);
    // x = 9.7〜30 の長方形（範囲は x = ±10 なので、中に残るのは幅 0.3 m だけ）。
    // 左の辺に点を多く置き、点の平均（建物の中心）を範囲の中にする
    const left = Array.from({ length: 300 }, (_, i) => [9.7, 5 - (10 * i) / 299]);
    const rect = [...left, [30, -5], [30, 5]];
    const building: Building = {
      id: 'edge-sliver',
      attrs: {},
      lod1: [
        { exterior: ring(rect, 10), interiors: [] },
        { exterior: ring([...rect].reverse(), 0), interiors: [] },
      ],
      lod2: [],
      installations: [],
      lod3: [],
      installations3: [],
    };
    const scene = new SceneBuilder({ projector: new LocalProjector(center), half: 10, lod: 1, solid: true });
    expect(scene.addBuilding(building)).toBe(true);
    // 1/1000 で 0.8 mm（実物 0.8 m）より細いものを外す。残る幅は 0.3 m
    const info = await finishForPrint(scene, 10, { scaleDenominator: 1000, baseMm: 0, minFeatureMm: 0.8 });
    expect(info.removedBuildings).toBe(1);
    expect(scene.parts.roof.triangleCount).toBe(0);
  });

  it('上から見てごく小さな屋根の面（10 cm 角未満）は、くずれた面として数えずに省く', async () => {
    const center = { lat: 35.68, lon: 139.76 };
    const m = metersPerDegree(center.lat);
    const ring = (pts: number[][], h: number) =>
      pts.flatMap(([x, z]) => [center.lat - z! / m.lat, center.lon + x! / m.lon, h]);
    const square = (x0: number, z0: number, s: number) => [[x0, z0], [x0 + s, z0], [x0 + s, z0 + s], [x0, z0 + s]];
    const building: Building = {
      id: 'tiny-roof',
      attrs: {},
      lod1: [],
      lod2: [
        { kind: 'roof', polygon: { exterior: ring(square(-4, -4, 8), 10), interiors: [] } },
        // 5 cm 角の小さな屋根の面（飾りなど）
        { kind: 'roof', polygon: { exterior: ring(square(5, 5, 0.05), 12), interiors: [] } },
        { kind: 'ground', polygon: { exterior: ring(square(-4, -4, 8).reverse(), 0), interiors: [] } },
      ],
      installations: [],
      lod3: [],
      installations3: [],
    };
    const scene = new SceneBuilder({ projector: new LocalProjector(center), half: 10, lod: 2, solid: true });
    expect(scene.addBuilding(building)).toBe(true);
    const info = await finishForPrint(scene, 10, { scaleDenominator: 1000, baseMm: 0 });
    expect(info.droppedFaces).toBe(0);
    expect(scene.parts.roof.triangleCount).toBe(12);
  });
});
