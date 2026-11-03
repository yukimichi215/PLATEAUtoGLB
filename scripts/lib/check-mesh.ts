// OBJ・STL の検査（Node.js 用。verify-glb から使う）：three.js の OBJLoader・STLLoader で読めるか、三角形の数と外形。
import { Box3, BufferGeometry, Mesh, type Object3D } from 'three';
import { OBJLoader } from 'three/examples/jsm/loaders/OBJLoader.js';
import { STLLoader } from 'three/examples/jsm/loaders/STLLoader.js';
import { countNonManifoldEdges, countOpenEdges } from '../../src/core/solid.js';

export interface MeshReport {
  ok: boolean;
  loaded: boolean;
  error?: string;
  triangles: number;
  /** 部品（OBJ の `o`）の名前 */
  objects: string[];
  size?: { width: number; height: number; depth: number };
  min?: [number, number, number];
  max?: [number, number, number];
  bytes: number;
  /** STL のとき：3Dプリンタで印刷できる形か */
  printable?: PrintableReport;
}

export interface PrintableReport {
  /** 開いている辺（穴・すき間・裏返った面）の数。0 なら閉じた形 */
  openEdges: number;
  /** 3つ以上の面が共有する辺の数（部品どうしが辺だけで接しているところ）。0 なら、どの辺もちょうど2つの面が共有する */
  nonManifoldEdges: number;
  /** 同じ位置の頂点でつながった部品の数 */
  pieces: number;
  /** 体積が 0 以下の部品（裏返った形）の数 */
  nonPositivePieces: number;
  /** 一番低い点が高さ 0 より上にある部品の数（台座ありのとき、台座から浮いている部品） */
  piecesAboveZero: number;
}

/** 部品（同じ位置の頂点でつながった三角形）ごとの体積と一番低い高さ（+Z が上） */
export function piecesOf(positions: ArrayLike<number>): { volume: number; minZ: number; triangles: number }[] {
  const ids = new Map<string, number>();
  const triVerts: number[] = [];
  for (let i = 0; i < positions.length / 3; i++) {
    const k = `${positions[i * 3]},${positions[i * 3 + 1]},${positions[i * 3 + 2]}`;
    let v = ids.get(k);
    if (v === undefined) ids.set(k, (v = ids.size));
    triVerts.push(v);
  }
  const parent = Array.from({ length: ids.size }, (_, i) => i);
  const find = (a: number): number => {
    while (parent[a] !== a) a = parent[a] = parent[parent[a]!]!;
    return a;
  };
  for (let t = 0; t < triVerts.length; t += 3) {
    parent[find(triVerts[t]!)] = find(triVerts[t + 1]!);
    parent[find(triVerts[t + 1]!)] = find(triVerts[t + 2]!);
  }
  const out = new Map<number, { volume: number; minZ: number; triangles: number }>();
  for (let t = 0; t < triVerts.length / 3; t++) {
    const root = find(triVerts[t * 3]!);
    let p = out.get(root);
    if (!p) out.set(root, (p = { volume: 0, minZ: Infinity, triangles: 0 }));
    const o = t * 9;
    const [ax, ay, az, bx, by, bz, cx, cy, cz] = Array.from({ length: 9 }, (_, i) => positions[o + i]!) as number[];
    p.volume += (ax! * (by! * cz! - bz! * cy!) - ay! * (bx! * cz! - bz! * cx!) + az! * (bx! * cy! - by! * cx!)) / 6;
    p.minZ = Math.min(p.minZ, az!, bz!, cz!);
    p.triangles++;
  }
  return [...out.values()];
}

export function checkPrintable(positions: ArrayLike<number>): PrintableReport {
  const indices = Uint32Array.from({ length: positions.length / 3 }, (_, i) => i);
  const list = piecesOf(positions);
  return {
    openEdges: countOpenEdges(Array.from(positions), indices),
    nonManifoldEdges: countNonManifoldEdges(positions, indices),
    pieces: list.length,
    nonPositivePieces: list.filter((p) => !(p.volume > 0)).length,
    piecesAboveZero: list.filter((p) => p.minZ > 0).length,
  };
}

const r = (n: number) => Math.round(n * 100) / 100;

export function checkMesh(kind: 'obj' | 'stl', bytes: Uint8Array): MeshReport {
  const report: MeshReport = { ok: false, loaded: false, triangles: 0, objects: [], bytes: bytes.byteLength };
  try {
    const box = new Box3();
    if (kind === 'obj') {
      const root: Object3D = new OBJLoader().parse(new TextDecoder().decode(bytes));
      root.traverse((o) => {
        if (o instanceof Mesh) {
          report.objects.push(o.name);
          report.triangles += o.geometry.attributes.position!.count / 3;
        }
      });
      box.setFromObject(root);
    } else {
      const ab = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength) as ArrayBuffer;
      const geom: BufferGeometry = new STLLoader().parse(ab);
      report.triangles = geom.attributes.position!.count / 3;
      report.printable = checkPrintable(geom.attributes.position!.array);
      geom.computeBoundingBox();
      box.copy(geom.boundingBox!);
    }
    report.loaded = true;
    if (!box.isEmpty()) {
      report.min = [r(box.min.x), r(box.min.y), r(box.min.z)];
      report.max = [r(box.max.x), r(box.max.y), r(box.max.z)];
      report.size = { width: r(box.max.x - box.min.x), height: r(box.max.y - box.min.y), depth: r(box.max.z - box.min.z) };
    }
    report.ok = report.triangles > 0;
  } catch (e) {
    report.error = e instanceof Error ? e.message : String(e);
  }
  return report;
}
