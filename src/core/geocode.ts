// 住所・地名から緯度経度を調べる。国土地理院の住所検索（無料・登録不要）を使う。
// 「35.6812, 139.7671」のような緯度経度の直接入力にも対応する。
import type { LatLon } from './geo.js';

export const GSI_ADDRESS_SEARCH = 'https://msearch.gsi.go.jp/address-search/AddressSearch';

export interface Place extends LatLon {
  title: string;
}

/** 「緯度, 経度」の形なら読み取る。日本の範囲の外なら null */
export function parseLatLon(text: string): LatLon | null {
  const m = text
    .trim()
    .replace(/[，、]/g, ',')
    .match(/^(-?\d+(?:\.\d+)?)\s*[,\s]\s*(-?\d+(?:\.\d+)?)$/);
  if (!m) return null;
  let a = Number(m[1]);
  let b = Number(m[2]);
  // 経度・緯度の順で書かれていたら入れ替える
  if (a > 90 && b <= 90) [a, b] = [b, a];
  if (!(a >= 20 && a <= 46 && b >= 122 && b <= 154)) return null;
  return { lat: a, lon: b };
}

interface GsiFeature {
  geometry?: { coordinates?: [number, number] };
  properties?: { title?: string };
}

/** 国土地理院の答えを、候補の一覧にする（多すぎる場合は先頭から max 件） */
export function parseGsiResult(json: unknown, max = 10): Place[] {
  if (!Array.isArray(json)) return [];
  const out: Place[] = [];
  for (const f of json as GsiFeature[]) {
    const c = f.geometry?.coordinates;
    if (!c || !Number.isFinite(c[0]) || !Number.isFinite(c[1])) continue;
    out.push({ lon: c[0], lat: c[1], title: f.properties?.title ?? '' });
    if (out.length >= max) break;
  }
  return out;
}

export async function searchPlace(
  text: string,
  fetchJson: (url: string) => Promise<unknown>,
): Promise<Place[]> {
  const q = text.trim();
  if (q === '') return [];
  const ll = parseLatLon(q);
  if (ll) return [{ ...ll, title: `緯度 ${ll.lat}・経度 ${ll.lon}` }];
  const json = await fetchJson(`${GSI_ADDRESS_SEARCH}?q=${encodeURIComponent(q)}`);
  return parseGsiResult(json);
}
