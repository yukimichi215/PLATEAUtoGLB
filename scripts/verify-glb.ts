// GLB の検査：Khronos 公式の glTF Validator と、PlotBlock と同じ three.js の GLTFLoader で読めるか。
// 例：npm run verify -- out/xxx.glb
import { readFileSync } from 'node:fs';
import { checkGlb } from './lib/check-glb.js';

const files = process.argv.slice(2);
if (files.length === 0) {
  console.error('使い方: npm run verify -- <GLBファイル> ...');
  process.exit(1);
}
let failed = false;
for (const f of files) {
  const report = await checkGlb(new Uint8Array(readFileSync(f)));
  console.log(JSON.stringify({ file: f, ...report }, null, 2));
  if (!report.ok) failed = true;
}
process.exit(failed ? 1 : 0);
