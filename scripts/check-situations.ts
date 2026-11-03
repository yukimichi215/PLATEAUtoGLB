// シチュエーション検索の候補の地域を確かめる（開発用）。
// 1. 国土地理院の住所検索で名前を調べ、一覧の座標との距離を出す（駅名などは見つからないこともある）
// 2. PLATEAU のデータカタログで、300m 四方に建物のデータがあるか・ファイルの大きさを出す（データ本体は取得しない）
// 相手の負荷を抑えるため、1件ずつ、間を 3 秒あける。
import { searchPlace } from '../src/core/geocode.js';
import { metersPerDegree } from '../src/core/geo.js';
import { defaultFetchJson, planArea } from '../src/core/pipeline.js';
import { SITUATIONS } from '../src/core/situation.js';

const sleep = (ms: number) => new Promise((r) => setTimeout(r, ms));
const MAX_REQUESTS = 100;
let requests = 0;
const fetchJson: typeof defaultFetchJson = async (url) => {
  if (++requests > MAX_REQUESTS) throw new Error('問い合わせの上限に達したので止めます');
  await sleep(3000);
  return defaultFetchJson(url);
};

for (const s of SITUATIONS) {
  console.log(`## ${s.label.ja}`);
  for (const p of s.places) {
    const query = p.name.ja.replace(/（.*）/, '').replace(/ .*/, '');
    let geo = '';
    try {
      const found = await searchPlace(query, fetchJson);
      const m = metersPerDegree(p.lat);
      const best = found[0];
      geo = best ? `地理院「${best.title}」まで ${Math.round(Math.hypot((best.lat - p.lat) * m.lat, (best.lon - p.lon) * m.lon))} m` : '地理院で見つからず';
    } catch (e) {
      geo = `地理院エラー: ${e instanceof Error ? e.message : e}`;
    }
    try {
      const plan = await planArea({ center: p, size: 300, lod: 1, includeRoads: false, includeGround: true }, fetchJson);
      const bldg = plan.files.filter((f) => f.type === 'bldg');
      const cities = [...new Set(bldg.flatMap((f) => f.cities.map((c) => `${c.name}${c.year}`)))].join('/');
      console.log(`- ${p.name.ja}: 建物ファイル ${bldg.length} 件 ${(plan.totalBytes / 1e6).toFixed(0)} MB ${cities} ／ ${geo}`);
    } catch (e) {
      console.log(`- ${p.name.ja}: カタログ エラー ${e instanceof Error ? e.message : e} ／ ${geo}`);
    }
  }
}
