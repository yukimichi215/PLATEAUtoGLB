// 対応地域の一覧（src/web/city-list.json）を作る（開発用。一覧を新しくしたいときに手で実行する）。
// 1. PLATEAU データカタログ API の「データセットの一覧」（plateau-datasets。約10MB）を1回だけ取り、
//    建物モデル（bldg）のある自治体と、その LOD（2・3 があるか）を集める
// 2. LOD3 のある自治体だけ、CityGML の一覧（/datacatalog/citygml/<自治体コード>）を1件ずつ問い合わせ、
//    LOD3 の入ったメッシュ（約1km 四方）を集める。大きさはファイルの頭（HEAD。中身は取らない）で調べ、
//    大きすぎるファイルは外して候補にする
// 相手の負荷を抑えるため、1件ずつ、間を 3 秒あける。データ本体（CityGML のファイル）は取らない。
// 例：npm run make-city-list
import { writeFileSync } from 'node:fs';
import { CATALOG_API, fetchCatalogJson } from '../src/core/catalog.js';
import { meshBox } from '../src/core/geo.js';
import type { CityList, CityEntry, Lod3Place } from '../src/web/city-list.js';

const DATASETS_URL = 'https://api.plateauview.mlit.go.jp/datacatalog/plateau-datasets';
/** 候補にする LOD3 のファイルの大きさの上限（規則の1ファイル 200MB） */
const MAX_FILE_BYTES = 200e6;
/** LOD3 の候補は1自治体につきこの数まで（小さいファイルから） */
const MAX_PLACES = 3;
const MAX_REQUESTS = 80;

const sleep = (ms: number) => new Promise((r) => setTimeout(r, ms));
let requests = 0;
async function get(url: string): Promise<unknown> {
  if (++requests > MAX_REQUESTS) throw new Error('問い合わせの上限に達したので止めます');
  await sleep(3000);
  return fetchCatalogJson(url);
}

/** ファイルの大きさを、中身を取らずに調べる（HEAD）。分からなければ 0 */
async function headSize(url: string): Promise<number> {
  if (++requests > MAX_REQUESTS) throw new Error('問い合わせの上限に達したので止めます');
  await sleep(3000);
  const res = await fetch(url, { method: 'HEAD' });
  if (!res.ok) throw new Error(`大きさを調べられませんでした（${res.status}）: ${url}`);
  return Number(res.headers.get('x-goog-stored-content-length') ?? res.headers.get('content-length') ?? 0) || 0;
}

interface Dataset {
  type_en: string;
  pref: string;
  pref_code: string;
  city: string;
  city_code: string;
  lod?: string;
  year?: number;
}

const datasets = ((await get(DATASETS_URL)) as { datasets: Dataset[] }).datasets.filter((d) => d.type_en === 'bldg');
const byCity = new Map<string, { pref: string; prefCode: string; name: string; lods: Set<number>; year: number }>();
for (const d of datasets) {
  const c = byCity.get(d.city_code) ?? { pref: d.pref, prefCode: d.pref_code, name: d.city, lods: new Set<number>(), year: 0 };
  c.lods.add(Number(d.lod ?? 1));
  c.year = Math.max(c.year, d.year ?? 0);
  byCity.set(d.city_code, c);
}

const cities: CityEntry[] = [];
let skippedLarge = 0;
for (const [code, c] of [...byCity].sort((a, b) => a[0].localeCompare(b[0]))) {
  const maxLod = Math.max(...c.lods);
  const entry: CityEntry = { code, pref: c.pref, prefCode: c.prefCode, name: c.name, lod2: maxLod >= 2, lod3: false, year: c.year };
  if (maxLod >= 3) {
    // 3D Tiles の一覧に LOD3 があっても、CityGML のメッシュで確かめる（候補の場所もここで決める）
    const json = (await get(`${CATALOG_API}/${code}?types=bldg`)) as {
      cities?: { cityCode: string; files?: { bldg?: { code: string; maxLod?: number; fileSize?: number; url: string }[] } }[];
    };
    const meshes = new Map<string, number>();
    const urls = new Map<string, string>();
    for (const city of json.cities ?? []) {
      if (city.cityCode !== code) continue;
      for (const f of city.files?.bldg ?? []) {
        if ((f.maxLod ?? 0) < 3 || f.code.length !== 8) continue;
        meshes.set(f.code, f.fileSize ?? 0);
        urls.set(f.code, f.url);
      }
    }
    // 自治体ごとの答えにはファイルの大きさが入っていない（2次メッシュの答えにも無い自治体がある）ので、HEAD で調べる
    for (const [mesh, size] of meshes) if (!(size > 0)) meshes.set(mesh, await headSize(urls.get(mesh)!));
    const usable = [...meshes].filter(([, size]) => size > 0 && size <= MAX_FILE_BYTES);
    skippedLarge += meshes.size - usable.length;
    const places: Lod3Place[] = usable
      .sort((a, b) => a[1] - b[1])
      .slice(0, MAX_PLACES)
      .map(([mesh, size]) => {
        const b = meshBox(mesh);
        return { mesh, lat: +((b.south + b.north) / 2).toFixed(5), lon: +((b.west + b.east) / 2).toFixed(5), mb: Math.round(size / 1e6) };
      });
    entry.lod3 = meshes.size > 0;
    entry.lod3Meshes = meshes.size;
    if (places.length > 0) entry.lod3Places = places;
    console.log(`${c.pref}${c.name}: LOD3 のメッシュ ${meshes.size}（候補 ${places.length}）`);
  }
  cities.push(entry);
}

const out: CityList = {
  source: `${DATASETS_URL} と ${CATALOG_API}/<自治体コード>（建物モデル bldg）`,
  createdAt: new Date().toISOString().slice(0, 10),
  cityCount: byCity.size,
  cities,
};
writeFileSync(new URL('../src/web/city-list.json', import.meta.url), JSON.stringify(out) + '\n');
console.log(
  `自治体 ${cities.length}（LOD2 あり ${cities.filter((c) => c.lod2).length}、LOD3 あり ${cities.filter((c) => c.lod3).length}）。` +
    `200MB を超えて候補から外した LOD3 のメッシュ ${skippedLarge}。問い合わせ ${requests} 件`,
);
