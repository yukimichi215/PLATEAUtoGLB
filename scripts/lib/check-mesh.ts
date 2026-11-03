// OBJ・STL の検査（Node.js 用。verify-glb から使う）：three.js の OBJLoader・STLLoader で読めるか、三角形の数と外形。
import { Box3, BufferGeometry, Mesh, type Object3D } from 'three';
import { OBJLoader } from 'three/examples/jsm/loaders/OBJLoader.js';
import { STLLoader } from 'three/examples/jsm/loaders/STLLoader.js';

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
