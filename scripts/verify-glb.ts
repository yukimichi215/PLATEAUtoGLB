// 出力の検査。GLB：Khronos 公式の glTF Validator と、PlotBlock と同じ three.js の GLTFLoader で読めるか。
// OBJ・STL：three.js の OBJLoader・STLLoader で読めるか。どれも三角形の数と外形を表示する。
// 例：npm run verify -- out/xxx.glb out/xxx.obj out/xxx.stl
import { readFileSync } from 'node:fs';
import { checkGlb } from './lib/check-glb.js';
import { checkMesh } from './lib/check-mesh.js';

const files = process.argv.slice(2);
if (files.length === 0) {
  console.error('使い方: npm run verify -- <GLB・OBJ・STL のファイル> ...');
  process.exit(1);
}
let failed = false;
for (const f of files) {
  const bytes = new Uint8Array(readFileSync(f));
  const ext = f.toLowerCase().split('.').pop();
  const report = ext === 'obj' || ext === 'stl' ? checkMesh(ext, bytes) : await checkGlb(bytes);
  // 建物を1棟ずつ分けた OBJ は部品の名前が多いので、数と最初のいくつかだけ出す
  const shown =
    'objects' in report && report.objects.length > 10
      ? { ...report, objectCount: report.objects.length, objects: [...report.objects.slice(0, 5), '…'] }
      : report;
  console.log(JSON.stringify({ file: f, ...shown }, null, 2));
  if (!report.ok) failed = true;
}
process.exit(failed ? 1 : 0);
