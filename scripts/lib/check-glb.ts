// GLB の検査（Node.js 用。自動テストと verify-glb から使う）。
import { Box3, Mesh, type Object3D } from 'three';
import { GLTFLoader } from 'three/examples/jsm/loaders/GLTFLoader.js';
// @ts-expect-error 型定義がない
import validator from 'gltf-validator';

export interface GlbReport {
  ok: boolean;
  validatorErrors: number;
  validatorWarnings: number;
  validatorMessages: string[];
  loadedByThree: boolean;
  threeError?: string;
  triangles: number;
  meshes: number;
  size?: { width: number; height: number; depth: number };
  min?: [number, number, number];
  max?: [number, number, number];
  copyright?: string;
  usesExtensions: string[];
  bytes: number;
}

interface ValidatorReport {
  issues: { numErrors: number; numWarnings: number; messages: { code: string; message: string; severity: number; pointer?: string }[] };
  info?: { extensionsUsed?: string[] };
}

export async function checkGlb(bytes: Uint8Array): Promise<GlbReport> {
  const v = (await validator.validateBytes(bytes, {
    maxIssues: 50,
    externalResourceFunction: () => Promise.reject(new Error('外部ファイルの参照は使わない')),
  })) as ValidatorReport;

  const report: GlbReport = {
    ok: false,
    validatorErrors: v.issues.numErrors,
    validatorWarnings: v.issues.numWarnings,
    validatorMessages: v.issues.messages
      .filter((m) => m.severity <= 1)
      .map((m) => `${m.severity === 0 ? 'エラー' : '警告'} ${m.code}: ${m.message} ${m.pointer ?? ''}`),
    loadedByThree: false,
    triangles: 0,
    meshes: 0,
    usesExtensions: v.info?.extensionsUsed ?? [],
    bytes: bytes.byteLength,
  };

  try {
    const loader = new GLTFLoader();
    const ab = bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength) as ArrayBuffer;
    const gltf = await loader.parseAsync(ab, '');
    report.loadedByThree = true;
    report.copyright = (gltf.asset as { copyright?: string }).copyright;
    gltf.scene.updateMatrixWorld(true);
    gltf.scene.traverse((o: Object3D) => {
      if (o instanceof Mesh) {
        report.meshes++;
        const g = o.geometry;
        report.triangles += (g.index ? g.index.count : g.attributes.position!.count) / 3;
      }
    });
    const box = new Box3().setFromObject(gltf.scene);
    const r = (n: number) => Math.round(n * 100) / 100;
    report.min = [r(box.min.x), r(box.min.y), r(box.min.z)];
    report.max = [r(box.max.x), r(box.max.y), r(box.max.z)];
    report.size = { width: r(box.max.x - box.min.x), height: r(box.max.y - box.min.y), depth: r(box.max.z - box.min.z) };
  } catch (e) {
    report.threeError = e instanceof Error ? e.message : String(e);
  }
  report.ok = report.validatorErrors === 0 && report.loadedByThree;
  return report;
}
