// 対応地域の一覧（src/web/city-list.json）を作る（開発用。一覧を新しくしたいときに手で実行する）。
// 1. PLATEAU データカタログ API の「データセットの一覧」（plateau-datasets。約10MB）を1回だけ取り、
//    建物モデル（bldg）のある自治体を集める（3D 表示用のデータも含む一覧）
// 2. その全自治体について、CityGML の一覧（/datacatalog/citygml/<自治体コード>）を1件ずつ問い合わせ、
//    このツールで作れる（CityGML の建物がある）かと、LOD2・LOD3 があるかを確かめる。CityGML のない自治体は一覧から外す
// 3. LOD3 の入ったメッシュ（約1km 四方）の大きさを、ファイルの頭（HEAD。中身は取らない）で調べ、
//    大きすぎるファイルは外して候補の場所にする
// 相手の負荷を抑えるため、1件ずつ、間を 3 秒あけ、429・5xx・時間切れはすぐ止める。データ本体（CityGML のファイル）は取らない。
// 例：npm run make-city-list
import { writeFileSync } from 'node:fs';
import { CATALOG_API } from '../src/core/catalog.js';
import { meshBox } from '../src/core/geo.js';
import type { CityList, CityEntry, Lod3Place } from '../src/web/city-list.js';

const DATASETS_URL = 'https://api.plateauview.mlit.go.jp/datacatalog/plateau-datasets';
/** 候補にする LOD3 のファイルの大きさの上限（規則の1ファイル 200MB） */
const MAX_FILE_BYTES = 200e6;
/** LOD3 の候補は1自治体につきこの数まで（小さいファイルから） */
const MAX_PLACES = 3;
/** 問い合わせの上限（データセット一覧1件＋自治体ごと約300件＋HEAD 約50件） */
const MAX_REQUESTS = 420;
const TIMEOUT_MS = 60_000;

const sleep = (ms: number) => new Promise((r) => setTimeout(r, ms));
let requests = 0;
let totalBytes = 0;

async function request(url: string, method: 'GET' | 'HEAD'): Promise<Response> {
  if (++requests > MAX_REQUESTS) throw new Error('問い合わせの上限に達したので止めます');
  await sleep(3000);
  const res = await fetch(url, { method, signal: AbortSignal.timeout(TIMEOUT_MS) });
  // 404（データなし）以外の失敗は、相手の負荷・障害のおそれがあるので続けない
  if (!res.ok && res.status !== 404) throw new Error(`問い合わせに失敗したので止めます（${res.status}）: ${url}`);
  return res;
}

/** JSON を取る。404 は「データなし」として null */
async function getJson(url: string): Promise<unknown> {
  const res = await request(url, 'GET');
  const text = await res.text();
  totalBytes += Buffer.byteLength(text);
  return res.status === 404 ? null : JSON.parse(text);
}

/** ファイルの大きさを、中身を取らずに調べる（HEAD）。分からなければ 0 */
async function headSize(url: string): Promise<number> {
  const res = await request(url, 'HEAD');
  if (!res.ok) throw new Error(`大きさを調べられませんでした（${res.status}）: ${url}`);
  return Number(res.headers.get('x-goog-stored-content-length') ?? res.headers.get('content-length') ?? 0) || 0;
}

interface Dataset {
  type_en: string;
  pref: string;
  pref_code: string;
  city: string;
  city_code: string;
  year?: number;
}

interface CityGmlList {
  cities?: { cityCode: string; files?: { bldg?: { code: string; maxLod?: number; fileSize?: number; url: string }[] } }[];
}

const datasets = ((await getJson(DATASETS_URL)) as { datasets: Dataset[] }).datasets.filter((d) => d.type_en === 'bldg');
const byCity = new Map<string, { pref: string; prefCode: string; name: string; year: number }>();
for (const d of datasets) {
  const c = byCity.get(d.city_code) ?? { pref: d.pref, prefCode: d.pref_code, name: d.city, year: 0 };
  c.year = Math.max(c.year, d.year ?? 0);
  byCity.set(d.city_code, c);
}

const cities: CityEntry[] = [];
const excluded: { code: string; name: string }[] = [];
let skippedLarge = 0;
for (const [code, c] of [...byCity].sort((a, b) => a[0].localeCompare(b[0]))) {
  const json = (await getJson(`${CATALOG_API}/${code}?types=bldg`)) as CityGmlList | null;
  // その自治体の分のファイルだけを見る（隣の自治体と同じファイルを配っていることがある）
  const files = (json?.cities ?? []).filter((x) => x.cityCode === code).flatMap((x) => x.files?.bldg ?? []);
  if (files.length === 0) {
    excluded.push({ code, name: `${c.pref}${c.name}` });
    console.log(`${c.pref}${c.name}: CityGML の建物なし → 一覧から外す`);
    continue;
  }
  const maxLod = Math.max(...files.map((f) => f.maxLod ?? 1));
  const entry: CityEntry = { code, pref: c.pref, prefCode: c.prefCode, name: c.name, lod2: maxLod >= 2, lod3: false, year: c.year };
  // LOD3 の入ったメッシュ（3次メッシュ、8桁）と、その大きさ
  const lod3 = files.filter((f) => (f.maxLod ?? 0) >= 3 && f.code.length === 8);
  if (lod3.length > 0) {
    const meshes: [string, number][] = [];
    for (const f of lod3) meshes.push([f.code, f.fileSize && f.fileSize > 0 ? f.fileSize : await headSize(f.url)]);
    const usable = meshes.filter(([, size]) => size > 0 && size <= MAX_FILE_BYTES);
    skippedLarge += meshes.length - usable.length;
    const places: Lod3Place[] = usable
      .sort((a, b) => a[1] - b[1])
      .slice(0, MAX_PLACES)
      .map(([mesh, size]) => {
        const b = meshBox(mesh);
        return { mesh, lat: +((b.south + b.north) / 2).toFixed(5), lon: +((b.west + b.east) / 2).toFixed(5), mb: Math.round(size / 1e6) };
      });
    entry.lod3 = true;
    entry.lod3Meshes = meshes.length;
    if (places.length > 0) entry.lod3Places = places;
    console.log(`${c.pref}${c.name}: LOD3 のメッシュ ${meshes.length}（候補 ${places.length}）`);
  }
  cities.push(entry);
}

const out: CityList = {
  source: `${DATASETS_URL} と ${CATALOG_API}/<自治体コード>（建物モデル bldg）`,
  createdAt: new Date().toISOString().slice(0, 10),
  catalogCityCount: byCity.size,
  cityCount: cities.length,
  excluded,
  cities,
};
writeFileSync(new URL('../src/web/city-list.json', import.meta.url), JSON.stringify(out) + '\n');
console.log(
  `データセット一覧の自治体 ${byCity.size}。一覧に入れた自治体 ${cities.length}（LOD2 あり ${cities.filter((c) => c.lod2).length}、` +
    `LOD3 あり ${cities.filter((c) => c.lod3).length}）。CityGML がなく外した自治体 ${excluded.length}：${excluded.map((e) => e.name).join('・') || 'なし'}。` +
    `200MB を超えて候補から外した LOD3 のメッシュ ${skippedLarge}。問い合わせ ${requests} 件・受け取った JSON 合計 ${(totalBytes / 1e6).toFixed(1)} MB`,
);
