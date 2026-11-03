// 対応地域の一覧（PLATEAU の建物モデルがある自治体）。中身は scripts/make-city-list.ts が作る city-list.json。
// 一覧は小さい（数十KB）ので、その場で約10MB のデータセット一覧を取るより、作っておいたものを同梱する。

/** LOD3（窓・扉まで）のデータがある場所（3次メッシュ、約1km 四方）の候補 */
export interface Lod3Place {
  mesh: string;
  lat: number;
  lon: number;
  /** そのメッシュの建物のファイルの大きさ（MB、展開後） */
  mb: number;
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
  /** データの年度（いちばん新しいもの） */
  year: number;
}

export interface CityList {
  source: string;
  createdAt: string;
  /** データセット一覧の自治体の数（cities の数と一致する） */
  cityCount: number;
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
