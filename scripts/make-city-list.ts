// 対応地域の一覧（src/web/city-list.json）を作る（開発用。一覧を新しくしたいときに手で実行する）。
// 1. PLATEAU データカタログ API の「データセットの一覧」（plateau-datasets。約10MB）を1回だけ取り、
//    建物モデル（bldg）のある自治体を集める（3D 表示用のデータも含む一覧）
// 2. その全自治体について、CityGML の一覧（/datacatalog/citygml/<自治体コード>）を1件ずつ問い合わせ、
//    このツールで作れる（CityGML の建物がある）かと、LOD2・LOD3 があるかを確かめる。CityGML のない自治体は一覧から外す
// 3. LOD3 の入ったメッシュ（約1km 四方）の大きさを、ファイルの頭（HEAD。中身は取らない）で調べ、
//    大きすぎるファイルは外して候補にする
// 4. 候補のメッシュの CityGML を、合計の上限（MAX_TOTAL_BYTES）の中で1件ずつ読み（保存はしない）、
//    LOD3 の建物が集まっている所を「LOD3 がある所」の位置にする（区画の中心には LOD3 の建物がないことがあるため）。
//    上限に入らなかった区画・LOD3 の建物が見つからなかった区画は候補にしない
// 相手の負荷を抑えるため、1件ずつ、間を 3 秒あけ、429・5xx・時間切れはすぐ止める。
// 例：npm run make-city-list
import { writeFileSync } from 'node:fs';
import { CATALOG_API } from '../src/core/catalog.js';
import { readCityGml } from '../src/core/citygml.js';
import { meshCode3, type LatLon } from '../src/core/geo.js';
import { findLod3Spot } from '../src/core/lod3-spot.js';
import { ReadBudget, roundRobin } from './lod3-read-plan.js';
import type { CityList, CityEntry, Lod3Place } from '../src/web/city-list.js';

const DATASETS_URL = 'https://api.plateauview.mlit.go.jp/datacatalog/plateau-datasets';
/** 候補にする LOD3 のファイルの大きさの上限（規則の1ファイル 200MB） */
const MAX_FILE_BYTES = 200e6;
/** LOD3 の候補は1自治体につきこの数まで（小さいファイルから） */
const MAX_PLACES = 3;
/** 問い合わせの上限（データセット一覧1件＋自治体ごと約300件＋HEAD 約50件） */
const MAX_REQUESTS = 460;
const TIMEOUT_MS = 60_000;
/** LOD3 の位置を調べるために読む CityGML の合計の上限（展開後）。2026-11-03 利用者が「実用上必要なら（1作業 1GB の目安を）妥協してよい」と了承 */
const MAX_TOTAL_BYTES = 2000e6;
/** CityGML 1件を読むときの時間の上限 */
const DOWNLOAD_TIMEOUT_MS = 600_000;

const sleep = (ms: number) => new Promise((r) => setTimeout(r, ms));
let requests = 0;
let totalBytes = 0;

async function request(url: string, method: 'GET' | 'HEAD', timeoutMs = TIMEOUT_MS): Promise<Response> {
  if (++requests > MAX_REQUESTS) throw new Error('問い合わせの上限に達したので止めます');
  await sleep(3000);
  const res = await fetch(url, { method, signal: AbortSignal.timeout(timeoutMs) });
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

const budget = new ReadBudget(MAX_FILE_BYTES, MAX_TOTAL_BYTES);
/** 通信した量（圧縮のまま。content-length が分かったものだけの合計） */
let networkBytes = 0;
/** 読むのをやめた理由（1ファイルの上限・合計の上限） */
class ReadStop extends Error {
  constructor(readonly reason: 'fileTooLarge' | 'totalReached') {
    super(reason);
  }
}
/**
 * CityGML を少しずつ読み（保存しない）、LOD3 の形がある建物の位置（LOD3 の面の点の平均）と、展開後の大きさを返す。
 * 注意：HEAD で分かる大きさ（x-goog-stored-content-length）は圧縮した大きさで、展開すると 5〜15 倍になることがある
 * （2026-11-03 の実行で確認）。そのため、読んだ量（展開後）で上限を確かめ、超えたらその場で止める。
 */
async function lod3Points(url: string): Promise<{ points: LatLon[]; bytes: number }> {
  let bytes = 0;
  const res = await request(url, 'GET', DOWNLOAD_TIMEOUT_MS);
  if (!res.ok || !res.body) throw new Error(`CityGML を読めませんでした（${res.status}）: ${url}`);
  networkBytes += Number(res.headers.get('content-length') ?? 0) || 0;
  const decoder = new TextDecoder('utf-8');
  const body = res.body;
  async function* chunks(): AsyncIterable<string> {
    for await (const part of body as unknown as AsyncIterable<Uint8Array>) {
      bytes += part.byteLength;
      const r = budget.add(part.byteLength, bytes);
      if (r !== 'ok') throw new ReadStop(r);
      yield decoder.decode(part, { stream: true });
    }
    yield decoder.decode();
  }
  const out: LatLon[] = [];
  try {
    await readCityGml(chunks(), {
      onBuilding: (b) => {
        let lat = 0, lon = 0, n = 0;
        for (const s of b.lod3) {
          // PLATEAU の座標は 緯度・経度・高さ の順
          for (let i = 0; i + 2 < s.polygon.exterior.length; i += 3) {
            lat += s.polygon.exterior[i]!;
            lon += s.polygon.exterior[i + 1]!;
            n++;
          }
        }
        if (n > 0) out.push({ lat: lat / n, lon: lon / n });
      },
    });
  } catch (e) {
    // 途中でやめたときは、残りを受け取らないように通信を切る
    await body.cancel().catch(() => undefined);
    throw e;
  }
  return { points: out, bytes };
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
/** LOD3 の位置を調べる候補の区画（自治体ごと、小さいファイルの順） */
const candidates = new Map<CityEntry, { mesh: string; size: number; url: string }[]>();
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
    const meshes: { mesh: string; size: number; url: string }[] = [];
    for (const f of lod3) meshes.push({ mesh: f.code, size: f.fileSize && f.fileSize > 0 ? f.fileSize : await headSize(f.url), url: f.url });
    const usable = meshes.filter((m) => m.size > 0 && m.size <= MAX_FILE_BYTES).sort((a, b) => a.size - b.size);
    skippedLarge += meshes.length - usable.length;
    entry.lod3 = true;
    entry.lod3Meshes = meshes.length;
    candidates.set(entry, usable);
    console.log(`${c.pref}${c.name}: LOD3 のメッシュ ${meshes.length}（200MB 以下 ${usable.length}）`);
  }
  cities.push(entry);
}

// LOD3 の位置：1周目は各自治体の一番小さい区画、2周目は2番目…の順に読み、各自治体 MAX_PLACES か所まで候補にする。
// 1ファイルが大きすぎればそのファイルだけ飛ばし、合計の上限に達したら残りは読まない。
// 同じ区画のファイルを別の区（東京23区など）が配っているときは、ファイル名が同じなら1回だけ読む。
const cand = [...candidates];
const placesOf = new Map<CityEntry, Lod3Place[]>();
const readByName = new Map<string, { points: LatLon[]; bytes: number } | 'fileTooLarge'>();
const unread = new Set<CityEntry>();
let droppedNoLod3 = 0;
for (const [i, m] of roundRobin(cand.map(([, list]) => list))) {
  const entry = cand[i]![0];
  const places = placesOf.get(entry) ?? [];
  if (places.length >= MAX_PLACES) continue;
  const name = m.url.split('/').pop()!;
  let read = readByName.get(name);
  if (read === undefined) {
    if (!budget.canStart()) {
      unread.add(entry);
      continue;
    }
    try {
      read = await lod3Points(m.url);
      console.log(`  読んだ：${name}（LOD3 の建物 ${read.points.length} 棟、展開後 ${(read.bytes / 1e6).toFixed(0)} MB、累計 ${(budget.total / 1e6).toFixed(0)} MB）`);
    } catch (e) {
      if (!(e instanceof ReadStop)) throw e;
      if (e.reason === 'totalReached') {
        console.log(`  読んだ量の合計が上限に達したので、${name} から先は読まない`);
        unread.add(entry);
        continue;
      }
      console.log(`  飛ばした：${name}（展開後 200MB を超える）`);
      read = 'fileTooLarge';
    }
    readByName.set(name, read);
  }
  if (read === 'fileTooLarge') continue;
  // そのメッシュの中の建物だけで探す（隣のメッシュにまたがる建物の代表点が外に出ることがある）
  const spot = findLod3Spot(read.points.filter((p) => meshCode3(p.lat, p.lon) === m.mesh));
  if (!spot) {
    droppedNoLod3++;
    continue;
  }
  places.push({ mesh: m.mesh, lat: +spot.lat.toFixed(5), lon: +spot.lon.toFixed(5), mb: Math.round(read.bytes / 1e6), lod3Count: spot.count });
  placesOf.set(entry, places);
}
for (const [entry, list] of cand) {
  const places = placesOf.get(entry) ?? [];
  if (places.length > 0) entry.lod3Places = places;
  // 候補がないときは、その理由を残す（画面の説明に使う）
  else if (list.length === 0 || list.every((m) => readByName.get(m.url.split('/').pop()!) === 'fileTooLarge')) entry.lod3NoPlace = 'tooLarge';
  else if (unread.has(entry)) entry.lod3NoPlace = 'notChecked';
  else entry.lod3NoPlace = 'noLod3';
  if (!entry.lod3Places) console.log(`${entry.pref}${entry.name}: LOD3 の候補なし（${entry.lod3NoPlace}）`);
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
    `200MB を超えて候補から外した LOD3 のメッシュ ${skippedLarge}。LOD3 の建物が見つからず外した区画 ${droppedNoLod3}。` +
    `問い合わせ ${requests} 件・受け取った JSON 合計 ${(totalBytes / 1e6).toFixed(1)} MB・読んだ CityGML 合計 展開後 ${(budget.total / 1e6).toFixed(0)} MB・通信 ${(networkBytes / 1e6).toFixed(0)} MB（content-length が分かった分）`,
);
