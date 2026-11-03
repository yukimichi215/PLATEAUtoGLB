import { createReadStream } from 'node:fs';
import { Box3, BufferGeometry, Mesh, type Object3D } from 'three';
import { OBJLoader } from 'three/examples/jsm/loaders/OBJLoader.js';
import { STLLoader } from 'three/examples/jsm/loaders/STLLoader.js';
import { describe, expect, it } from 'vitest';
import { checkGlb } from '../scripts/lib/check-glb.js';
import { checkMesh } from '../scripts/lib/check-mesh.js';
import { srgbToLinear } from '../src/core/glb.js';
import type { SourceFile } from '../src/core/catalog.js';
import { crc32, makeZip, parseFormats, stlHeader } from '../src/core/export.js';
import { downloadFiles, generateFromPlan, type AreaPlan, type OpenText } from '../src/core/pipeline.js';

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

const plan = (lod: 1 | 2): AreaPlan => ({
  request: {
    center: { lat: 35.6812, lon: 139.7671 },
    size: 300,
    lod,
    includeRoads: true,
    includeGround: true,
    placeName: '東京駅',
  },
  meshes: ['53394611'],
  files: [fakeFile('bldg'), fakeFile('tran')],
  totalBytes: 2000,
  unknownSizeFiles: 0,
});

function bounds(obj: Object3D | BufferGeometry) {
  const box = obj instanceof BufferGeometry ? (obj.computeBoundingBox(), obj.boundingBox!) : new Box3().setFromObject(obj);
  return [box.min.x, box.min.y, box.min.z, box.max.x, box.max.y, box.max.z];
}

/** zip の中のファイル名と中身を読む（圧縮なしの zip だけ。テスト用） */
function readZip(zip: Uint8Array): Map<string, Uint8Array> {
  const view = new DataView(zip.buffer, zip.byteOffset, zip.byteLength);
  const end = zip.byteLength - 22;
  expect(view.getUint32(end, true)).toBe(0x06054b50);
  const count = view.getUint16(end + 10, true);
  let o = view.getUint32(end + 16, true);
  const out = new Map<string, Uint8Array>();
  for (let i = 0; i < count; i++) {
    expect(view.getUint32(o, true)).toBe(0x02014b50);
    const crc = view.getUint32(o + 16, true);
    const size = view.getUint32(o + 20, true);
    const nameLen = view.getUint16(o + 28, true);
    const local = view.getUint32(o + 42, true);
    const name = new TextDecoder().decode(zip.subarray(o + 46, o + 46 + nameLen));
    const localNameLen = view.getUint16(local + 26, true);
    const data = zip.subarray(local + 30 + localNameLen, local + 30 + localNameLen + size);
    expect(crc32(data)).toBe(crc);
    out.set(name, data);
    o += 46 + nameLen;
  }
  return out;
}

describe('OBJ・STL での書き出し', () => {
  for (const lod of [1, 2] as const) {
    it(`LOD${lod}：three.js の OBJLoader・STLLoader で読め、三角形の数と外形が GLB と同じ`, async () => {
      const res = await generateFromPlan(plan(lod), openText);
      const glb = await checkGlb(res.glb);
      const glbBounds = [...glb.min!, ...glb.max!];

      // OBJ
      const obj = new OBJLoader().parse(res.obj);
      let objTriangles = 0;
      const names: string[] = [];
      obj.traverse((o) => {
        if (o instanceof Mesh) {
          objTriangles += o.geometry.attributes.position!.count / 3;
          names.push(o.name);
        }
      });
      expect(objTriangles).toBe(res.stats.triangles);
      expect(names).toEqual(['Buildings', 'Roads', 'Ground']);
      bounds(obj).forEach((v, i) => expect(Math.abs(v - glbBounds[i]!)).toBeLessThan(0.006)); // GLB の検査結果は 0.01m 単位
      expect(res.obj).toMatch(/^# 【出典】/);
      expect(res.obj).toContain('3D都市モデル（Project PLATEAU）千代田区（2025年度）');
      expect(res.obj).toContain('mtllib plateau_東京駅_300m_');
      expect(res.mtl).toContain('newmtl wall');
      expect(res.mtl).toContain('国土交通省・各自治体が作成したものではありません');

      // STL（バイナリ形式）
      const ab = res.stl.buffer.slice(res.stl.byteOffset, res.stl.byteOffset + res.stl.byteLength) as ArrayBuffer;
      expect(res.stl.byteLength).toBe(84 + res.stats.triangles * 50);
      const stl = new STLLoader().parse(ab);
      expect(stl.attributes.position!.count / 3).toBe(res.stats.triangles);
      bounds(stl).forEach((v, i) => expect(Math.abs(v - glbBounds[i]!)).toBeLessThan(0.006));
      const header = stlHeader(`${res.fileName}_credit.txt`);
      expect(header.length).toBeLessThanOrEqual(80);
      expect(new TextDecoder().decode(res.stl.subarray(0, header.length))).toBe(header);
    });
  }

  it('OBJ・STL・まとめては、出典の文章ファイルと一緒に zip で出す', async () => {
    const res = await generateFromPlan(plan(1), openText);
    const files = downloadFiles(res);
    const base = res.fileName;
    expect(files.glb.name).toBe(`${base}.glb`);
    expect(files.glb.data).toBe(res.glb);

    const objZip = readZip(files.obj.data);
    expect([...objZip.keys()]).toEqual([`${base}.obj`, `${base}.mtl`, `${base}_credit.txt`]);
    expect(new TextDecoder().decode(objZip.get(`${base}.obj`))).toBe(res.obj);

    const stlZip = readZip(files.stl.data);
    expect([...stlZip.keys()]).toEqual([`${base}.stl`, `${base}_credit.txt`]);
    expect(stlZip.get(`${base}.stl`)).toEqual(res.stl);
    expect(new TextDecoder().decode(stlZip.get(`${base}_credit.txt`))).toBe(res.credit);
    expect(res.credit).toContain('GLB・OBJ・STL のどの形式で使うときも');

    const all = readZip(files.all.data);
    expect([...all.keys()].sort()).toEqual(
      [`${base}.glb`, `${base}.obj`, `${base}.mtl`, `${base}.stl`, `${base}_credit.txt`].sort(),
    );
  });

  it('LOD3：窓・扉の材質も OBJ・.mtl に入る', async () => {
    const lod3File: SourceFile = { ...fakeFile('bldg'), url: 'https://assets.cms.plateau.reearth.io/test/22203/bldg.gml', cities: [{ code: '22203', name: '沼津市', year: 2023, url: 'https://assets.cms.plateau.reearth.io/test/22203/bldg.gml' }] };
    const open: OpenText = async () =>
      createReadStream(new URL('./fixtures/bldg_numazu_lod3.gml', import.meta.url), { encoding: 'utf8' }) as AsyncIterable<string>;
    const res = await generateFromPlan(
      {
        request: { center: { lat: 35.10125, lon: 138.8592 }, size: 100, lod: 3, includeRoads: false, includeGround: false, placeName: '沼津' },
        meshes: [],
        files: [lod3File],
        totalBytes: 1,
        unknownSizeFiles: 0,
      },
      open,
    );
    expect(res.stats.lod3Buildings).toBeGreaterThan(0);
    expect(res.obj).toContain('usemtl window');
    expect(res.mtl).toContain('newmtl window');
    expect(res.mtl).toContain('newmtl door');
    const obj = checkMesh('obj', new TextEncoder().encode(res.obj));
    expect(obj.triangles).toBe(res.stats.triangles);
  });

  it('コマンドの --format：空・重複を除き、知らない形式はエラー', () => {
    expect(parseFormats('glb,')).toEqual(['glb']);
    expect(parseFormats(' OBJ , stl,obj ')).toEqual(['obj', 'stl']);
    expect(() => parseFormats('glb,fbx')).toThrow('fbx');
    expect(() => parseFormats(',')).toThrow('1つ以上');
  });

  it('STL の先頭の文：英数字のファイル名ならそのまま、日本語なら一般的な書き方', () => {
    expect(stlHeader('plateau_tokyo_300m_lod1_credit.txt')).toContain('plateau_tokyo_300m_lod1_credit.txt');
    expect(stlHeader('plateau_東京駅_300m_lod1_credit.txt')).toContain('*_credit.txt');
  });

  it('.mtl の色は GLB と同じ直線の色の値（linear）', async () => {
    const res = await generateFromPlan(plan(1), openText);
    const wall = res.mtl.split('newmtl wall\n')[1]!.split('\n')[0]!;
    expect(wall).toBe(`Kd ${[0.86, 0.85, 0.82].map((c) => srgbToLinear(c).toFixed(4)).join(' ')}`); // 建物の壁の色
    expect(wall).toBe('Kd 0.7106 0.6921 0.6383');
  });

  it('zip：日本語のファイル名と中身が壊れない', () => {
    const zip = makeZip([
      { name: '東京駅.txt', data: 'こんにちは' },
      { name: 'b.bin', data: new Uint8Array([0, 1, 2, 255]) },
    ]);
    const files = readZip(zip);
    expect(new TextDecoder().decode(files.get('東京駅.txt'))).toBe('こんにちは');
    expect([...files.get('b.bin')!]).toEqual([0, 1, 2, 255]);
    expect(crc32(new TextEncoder().encode('123456789'))).toBe(0xcbf43926); // CRC-32 の標準の検査値
  });
});
