// 対応地域の一覧（PLATEAU の建物モデルがある自治体）。中身は scripts/make-city-list.ts が作る city-list.json。
// 一覧は小さい（数十KB）ので、その場で約10MB のデータセット一覧を取るより、作っておいたものを同梱する。

/** LOD3（窓・扉まで）のデータがある場所の候補。位置は、その3次メッシュ（約1km 四方）の中で LOD3 の建物が集まっている所 */
export interface Lod3Place {
  mesh: string;
  lat: number;
  lon: number;
  /** そのメッシュの建物のファイルの大きさ（MB、展開後） */
  mb: number;
  /** この位置を中心にした一辺 300m の正方形に入る、LOD3（窓・扉まで）の建物の数。そのメッシュのファイルだけで数えるので、
   *  正方形がとなりのメッシュにかかると実際はもっと入る（画面では「◯棟以上」と出す） */
  lod3Count: number;
}

export interface CityEntry {
  /** 自治体コード（5桁） */
  code: string;
  pref: string;
  prefCode: string;
  /** 自治体名（日本語の原文） */
  name: string;
  /** LOD2（屋根の形）のデータがある（自治体の中の一部の地区だけのことが多い） */
  lod2: boolean;
  /** LOD3（窓・扉）のデータがある（ごく一部のメッシュだけ） */
  lod3: boolean;
  lod3Meshes?: number;
  lod3Places?: Lod3Place[];
  /** LOD3 の候補の場所がないときの理由。tooLarge：ファイルが大きすぎる、notChecked：読む量の上限で調べきれなかった、noLod3：LOD3 の建物が見つからなかった */
  lod3NoPlace?: 'tooLarge' | 'notChecked' | 'noLod3';
  /** データの年度（いちばん新しいもの） */
  year: number;
}

export interface CityList {
  source: string;
  createdAt: string;
  /** データカタログのデータセット一覧で、建物モデルがある自治体の数（3D 表示用だけのものも含む） */
  catalogCityCount: number;
  /** 一覧に入れた自治体の数（cities の数。catalogCityCount から excluded を除いた数） */
  cityCount: number;
  /** CityGML の建物がなく、このツールでは作れないので外した自治体 */
  excluded: { code: string; name: string }[];
  cities: CityEntry[];
}

export type LodFilter = 'all' | 'lod2' | 'lod3';

export interface PrefGroup {
  pref: string;
  prefCode: string;
  cities: CityEntry[];
}

/** 絞り込んで、都道府県ごとにまとめる（都道府県コードの順、自治体コードの順） */
export function groupByPref(cities: CityEntry[], filter: LodFilter): PrefGroup[] {
  const shown = cities.filter((c) => filter === 'all' || (filter === 'lod2' ? c.lod2 : c.lod3));
  const groups = new Map<string, PrefGroup>();
  for (const c of shown) {
    const g = groups.get(c.prefCode) ?? { pref: c.pref, prefCode: c.prefCode, cities: [] };
    g.cities.push(c);
    groups.set(c.prefCode, g);
  }
  return [...groups.values()]
    .sort((a, b) => a.prefCode.localeCompare(b.prefCode))
    .map((g) => ({ ...g, cities: g.cities.sort((a, b) => a.code.localeCompare(b.code)) }));
}

/** 都道府県名のローマ字（英語の画面で、日本語の名前に添える）。都道府県コード → 名前 */
export const PREF_ROMAJI: Record<string, string> = {
  '01': 'Hokkaido',
  '02': 'Aomori',
  '03': 'Iwate',
  '04': 'Miyagi',
  '05': 'Akita',
  '06': 'Yamagata',
  '07': 'Fukushima',
  '08': 'Ibaraki',
  '09': 'Tochigi',
  '10': 'Gunma',
  '11': 'Saitama',
  '12': 'Chiba',
  '13': 'Tokyo',
  '14': 'Kanagawa',
  '15': 'Niigata',
  '16': 'Toyama',
  '17': 'Ishikawa',
  '18': 'Fukui',
  '19': 'Yamanashi',
  '20': 'Nagano',
  '21': 'Gifu',
  '22': 'Shizuoka',
  '23': 'Aichi',
  '24': 'Mie',
  '25': 'Shiga',
  '26': 'Kyoto',
  '27': 'Osaka',
  '28': 'Hyogo',
  '29': 'Nara',
  '30': 'Wakayama',
  '31': 'Tottori',
  '32': 'Shimane',
  '33': 'Okayama',
  '34': 'Hiroshima',
  '35': 'Yamaguchi',
  '36': 'Tokushima',
  '37': 'Kagawa',
  '38': 'Ehime',
  '39': 'Kochi',
  '40': 'Fukuoka',
  '41': 'Saga',
  '42': 'Nagasaki',
  '43': 'Kumamoto',
  '44': 'Oita',
  '45': 'Miyazaki',
  '46': 'Kagoshima',
  '47': 'Okinawa',
};
