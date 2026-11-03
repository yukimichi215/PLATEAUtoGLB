// コマンドで GLB を作る（開発・確認用）。取得したデータは data/cache/ に保存して使い回す。
// 例：npm run cli -- --lat 35.6812 --lon 139.7671 --size 300 --lod 1 --name 東京駅
import { createReadStream, createWriteStream, existsSync, mkdirSync, renameSync, rmSync, writeFileSync } from 'node:fs';
import { join, resolve } from 'node:path';
import { Readable, Transform } from 'node:stream';
import { pipeline as streamPipeline } from 'node:stream/promises';
import { parseArgs } from 'node:util';
import type { SourceFile } from '../src/core/catalog.js';
import { parseFormats } from '../src/core/export.js';
import { defaultFetchJson, generateFromPlan, planArea, type OpenText } from '../src/core/pipeline.js';

const { values } = parseArgs({
  options: {
    lat: { type: 'string' },
    lon: { type: 'string' },
    size: { type: 'string', default: '300' },
    lod: { type: 'string', default: '1' },
    name: { type: 'string' },
    out: { type: 'string', default: 'out' },
    'no-roads': { type: 'boolean', default: false },
    installations: { type: 'boolean', default: false },
    'no-ground': { type: 'boolean', default: false },
    'max-mb': { type: 'string', default: '1000' },
    'max-file-mb': { type: 'string', default: '200' },
    /** 書き出す形式（カンマ区切り）：glb, obj, stl */
    format: { type: 'string', default: 'glb' },
    /** 3Dプリンタ用（縮尺・台座・閉じた形）。--scale か --fit-mm と一緒に使う */
    print: { type: 'boolean', default: false },
    /** 縮尺の分母（1/1000 なら 1000） */
    scale: { type: 'string', default: '1000' },
    /** 台座の一辺をこの長さ（mm）にする（--scale の代わり） */
    'fit-mm': { type: 'string' },
    /** 台座の厚さ（mm。0 で台座なし） */
    'base-mm': { type: 'string', default: '3' },
    /** 印刷するとこの mm より細い建物・道路を外す（0 で外さない） */
    'min-mm': { type: 'string', default: '0.8' },
    /** 建物の高さだけを何倍にするか（1〜3） */
    'height-scale': { type: 'string', default: '1' },
  },
});

if (!values.lat || !values.lon) {
  console.error('使い方: npm run cli -- --lat <緯度> --lon <経度> [--size 300] [--lod 1|2|3] [--installations] [--format glb,obj,stl] [--print [--scale 1000 | --fit-mm 100] [--base-mm 3] [--min-mm 0.8]] [--height-scale 1.5] [--name 名前]');
  process.exit(1);
}

let formats: Set<string>;
try {
  formats = new Set(parseFormats(values.format!));
} catch (e) {
  console.error(e instanceof Error ? e.message : e);
  process.exit(1);
}

const CACHE_DIR = resolve('data/cache');
mkdirSync(CACHE_DIR, { recursive: true });

function cachePath(url: string): string {
  const u = new URL(url);
  return join(CACHE_DIR, u.pathname.replace(/^\/+/, '').replace(/[^A-Za-z0-9._-]+/g, '_'));
}

let lastDownload = 0;
const sleep = (ms: number) => new Promise((r) => setTimeout(r, ms));

/** 手元になければ1件ずつ取得して保存し、保存したファイルを読む */
const openText: OpenText = async (file: SourceFile, onBytes) => {
  const path = cachePath(file.url);
  if (!existsSync(path)) {
    // 前回の取得から3秒以上あける（相手の負荷を抑える）
    const wait = lastDownload + 3000 - Date.now();
    if (wait > 0) await sleep(wait);
    console.error(`取得: ${file.url}（${file.fileSize > 0 ? `約 ${(file.fileSize / 1e6).toFixed(0)} MB` : '大きさ不明'}）`);
    const res = await fetch(file.url, { signal: AbortSignal.timeout(600_000) });
    lastDownload = Date.now();
    if (!res.ok || !res.body) throw new Error(`取得に失敗しました（${res.status}）。取得を中止します。`);
    const tmp = `${path}.part`;
    // 大きさが分からないファイルもあるので、取得しながら上限を確かめ、超えたら止めて消す
    const limit = Number(values['max-file-mb']) * 1e6;
    let got = 0;
    const counter = new Transform({
      transform(chunk: Buffer, _enc, cb) {
        got += chunk.length;
        if (got > limit) cb(new Error(`1ファイル ${values['max-file-mb']} MB を超えたため取得を中止しました`));
        else cb(null, chunk);
      },
    });
    try {
      await streamPipeline(Readable.fromWeb(res.body as never), counter, createWriteStream(tmp));
    } catch (e) {
      rmSync(tmp, { force: true });
      throw e;
    }
    renameSync(tmp, path);
  }
  const stream = createReadStream(path, { encoding: 'utf8', highWaterMark: 1 << 20 });
  async function* gen() {
    for await (const chunk of stream) {
      onBytes(Buffer.byteLength(chunk as string));
      yield chunk as string;
    }
  }
  return gen();
};

const req = {
  center: { lat: Number(values.lat), lon: Number(values.lon) },
  size: Number(values.size),
  lod: (values.lod === '3' ? 3 : values.lod === '2' ? 2 : 1) as 1 | 2 | 3,
  installations: values.installations,
  includeRoads: !values['no-roads'],
  includeGround: !values['no-ground'],
  placeName: values.name,
  heightScale: Number(values['height-scale']),
  print: values.print
    ? values['fit-mm'] !== undefined
      ? { fitSideMm: Number(values['fit-mm']), baseMm: Number(values['base-mm']), minFeatureMm: Number(values['min-mm']) }
      : { scaleDenominator: Number(values.scale), baseMm: Number(values['base-mm']), minFeatureMm: Number(values['min-mm']) }
    : undefined,
};

const t0 = Date.now();
const plan = await planArea(req, defaultFetchJson);
console.error(`メッシュ: ${plan.meshes.join(', ')}`);
for (const f of plan.files) {
  console.error(`  ${f.type} ${f.mesh} ${f.fileSize > 0 ? `${(f.fileSize / 1e6).toFixed(1)} MB` : '大きさ不明'} ${f.cities.map((c) => c.name).join('/')}`);
}
if (plan.totalBytes > Number(values['max-mb']) * 1e6) {
  console.error(`合計 ${(plan.totalBytes / 1e6).toFixed(0)} MB が上限を超えるため中止します（--max-mb で変更）`);
  process.exit(2);
}
const big = plan.files.filter((f) => f.fileSize > Number(values['max-file-mb']) * 1e6);
if (big.length > 0) {
  console.error(`1ファイル ${values['max-file-mb']} MB を超えるデータがあるため中止します（--max-file-mb で変更）`);
  process.exit(2);
}
let lastMsg = '';
const result = await generateFromPlan(plan, openText, (p) => {
  const msg = p.message.replace(/ \d+ \/ \d+ MB$/, '');
  if (msg !== lastMsg) {
    console.error(p.message);
    lastMsg = msg;
  }
});
mkdirSync(values.out!, { recursive: true });
const base = join(values.out!, result.fileName);
// 出典の文章ファイル（_credit.txt）は、どの形式のときも必ず一緒に書き出す
if (formats.has('glb')) writeFileSync(`${base}.glb`, result.glb);
if (formats.has('obj')) {
  writeFileSync(`${base}.obj`, result.obj);
  writeFileSync(`${base}.mtl`, result.mtl);
}
if (formats.has('stl')) writeFileSync(`${base}.stl`, result.stl);
writeFileSync(`${base}_credit.txt`, result.credit);
writeFileSync(`${base}_buildings.json`, JSON.stringify(result.buildings, null, 1));
for (const w of result.stats.warnings) console.error(`注意: ${w}`);
const mem = process.memoryUsage();
console.log(
  JSON.stringify(
    { file: `${base}.glb`, ...result.stats, seconds: (Date.now() - t0) / 1000, maxRssMB: Math.round(mem.rss / 1e6) },
    null,
    2,
  ),
);
