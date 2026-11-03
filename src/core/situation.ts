// シチュエーション検索：「都会の駅前」や町並み（古い木造の町並みなど）から、向いた地域の候補を出す。
// 候補の地域は手で選んだ一覧。選んだ地域が本当に向いているかは、切り出した建物の属性
// （建てた年・構造・用途・高さ・建物の密度）から出した「根拠の数値」で示す。
// 町の雰囲気（「静かな」など）は PLATEAU のデータにないので、属性での近似であることを画面に出す。
// 作品のジャンル（ホラーなど）の名前は付けない（建物の細かさが足りず、ジャンル向けとしては機能しないため。2026-11-03 利用者）。
// 一般に公開するので、実在の町を悪く言う名前・説明にしない（候補は「データ上の特徴が近い例」として出す）。
import type { LatLon } from './geo.js';

/** 根拠の数値の計算に使う、建物1棟の属性（BuildingInfo の一部） */
export interface CharacterInput {
  measuredHeight?: number;
  yearOfConstruction?: number;
  structureType?: string;
  usage?: string;
}

/** 切り出した範囲の建物の特徴（根拠の数値） */
export interface AreaCharacter {
  buildings: number;
  /** 範囲の広さ（ha） */
  areaHa: number;
  /** 1 ha あたりの棟数 */
  density: number;
  /** 高さが分かる棟数と、その平均（m） */
  heightKnown: number;
  avgHeight?: number;
  /** 高さ 31m 以上（おおむね 10 階建て以上）・60m 以上（超高層）の棟数 */
  tall31: number;
  tall60: number;
  /** 建てた年が分かる棟数と、そのうち 1970 年以前・2000 年以降の棟数 */
  yearKnown: number;
  builtBy1970: number;
  builtFrom2000: number;
  /** 構造が分かる棟数（「不明」を除く）と、そのうち木造の棟数 */
  structureKnown: number;
  wooden: number;
  /** 用途が分かる棟数（「不明」を除く）と、そのうち住宅（併用住宅を含む）の棟数 */
  usageKnown: number;
  residential: number;
}

/** 構造のコード。出典：PLATEAU 標準製品仕様書のコードリスト BuildingDetailAttribute_buildingStructureType（国土交通省）
 * https://www.mlit.go.jp/plateaudocument/toc4/toc4_02/toc4_02_04/toc4_02_04_02/BuildingDetailAttribute_buildingStructureType_xml */
const WOODEN = '601'; // 木造・土蔵造
const STRUCTURE_UNKNOWN = '611'; // 不明
/** 用途のコードのうち住宅（住宅・共同住宅・店舗等併用住宅・店舗等併用共同住宅・作業所併用住宅） */
const RESIDENTIAL = new Set(['411', '412', '413', '414', '415']);
const USAGE_UNKNOWN = '461';

export function areaCharacter(buildings: CharacterInput[], areaM2: number): AreaCharacter {
  const c: AreaCharacter = {
    buildings: buildings.length,
    areaHa: areaM2 / 10000,
    density: areaM2 > 0 ? buildings.length / (areaM2 / 10000) : 0,
    heightKnown: 0,
    tall31: 0,
    tall60: 0,
    yearKnown: 0,
    builtBy1970: 0,
    builtFrom2000: 0,
    structureKnown: 0,
    wooden: 0,
    usageKnown: 0,
    residential: 0,
  };
  let heightSum = 0;
  for (const b of buildings) {
    if (b.measuredHeight !== undefined) {
      c.heightKnown++;
      heightSum += b.measuredHeight;
      if (b.measuredHeight >= 31) c.tall31++;
      if (b.measuredHeight >= 60) c.tall60++;
    }
    if (b.yearOfConstruction !== undefined) {
      c.yearKnown++;
      if (b.yearOfConstruction <= 1970) c.builtBy1970++;
      if (b.yearOfConstruction >= 2000) c.builtFrom2000++;
    }
    if (b.structureType !== undefined && b.structureType !== STRUCTURE_UNKNOWN) {
      c.structureKnown++;
      if (b.structureType === WOODEN) c.wooden++;
    }
    if (b.usage !== undefined && b.usage !== USAGE_UNKNOWN) {
      c.usageKnown++;
      if (RESIDENTIAL.has(b.usage)) c.residential++;
    }
  }
  if (c.heightKnown > 0) c.avgHeight = heightSum / c.heightKnown;
  return c;
}

/** 根拠の数値の種類 */
export type Metric = 'density' | 'avgHeight' | 'tall31' | 'tall60' | 'old' | 'new' | 'wooden' | 'residential';

/** 割合の母数の種類（「高さが分かる N 棟のうち」など） */
export type Basis = 'all' | 'height' | 'year' | 'structure' | 'usage';

/** 根拠の数値（文にするのは画面の側。言語ごとに書き方が違うため） */
export interface Evidence {
  metric: Metric;
  basis: Basis;
  /** その数値が出せたか（属性がデータにないときは false） */
  known: boolean;
  /** 当てはまる棟数と、母数（属性が分かる棟数） */
  n: number;
  of: number;
  /** 割合（%、整数） */
  pct: number;
  /** 密度（棟/ha）・平均の高さ（m）のときの値 */
  value?: number;
  /** 密度のときの範囲の広さ（ha） */
  areaHa?: number;
}

const BASIS: Record<Metric, Basis> = {
  density: 'all',
  avgHeight: 'height',
  tall31: 'height',
  tall60: 'height',
  old: 'year',
  new: 'year',
  wooden: 'structure',
  residential: 'usage',
};

export function evidenceOf(c: AreaCharacter, metric: Metric): Evidence {
  const basis = BASIS[metric];
  const of = { all: c.buildings, height: c.heightKnown, year: c.yearKnown, structure: c.structureKnown, usage: c.usageKnown }[basis];
  const n = {
    density: c.buildings,
    avgHeight: c.heightKnown,
    tall31: c.tall31,
    tall60: c.tall60,
    old: c.builtBy1970,
    new: c.builtFrom2000,
    wooden: c.wooden,
    residential: c.residential,
  }[metric];
  const e: Evidence = { metric, basis, known: basis === 'all' || of > 0, n, of, pct: of > 0 ? Math.round((n / of) * 100) : 0 };
  if (metric === 'density') {
    e.value = c.density;
    e.areaHa = c.areaHa;
  }
  if (metric === 'avgHeight' && c.avgHeight !== undefined) e.value = c.avgHeight;
  return e;
}

/** 日本語と英語の文 */
export interface Text {
  ja: string;
  en: string;
}

export interface SituationPlace extends LatLon {
  name: Text;
  /** 選んだ理由（短く） */
  note: Text;
}

export interface Situation {
  id: string;
  /** 'station'：駅前の雰囲気、'town'：町並み */
  kind: 'station' | 'town';
  label: Text;
  /** どの属性で近似するか（画面に出す） */
  approximation: Text;
  /** 根拠として出す数値（大事な順） */
  metrics: Metric[];
  places: SituationPlace[];
}

// 候補の地域：PLATEAU の 3D 都市モデルがある自治体から選ぶ（scripts/check-situations.ts で
// データカタログに建物のデータがあること・ファイルの大きさを確かめる）。
// 座標は国土地理院の住所検索で駅名・地名を調べた位置（2026-11-03）。
export const SITUATIONS: Situation[] = [
  {
    id: 'city-station',
    kind: 'station',
    label: { ja: '都会の駅前', en: 'Big-city station' },
    approximation: {
      ja: '高い建物が多く、平均の高さが高い所（大きなビルは1棟が大きいので、1 ha あたりの棟数はむしろ少なく出ることがある）',
      en: 'many tall buildings and a high average height (big buildings are large, so the number of buildings per ha can come out low)',
    },
    metrics: ['avgHeight', 'tall31', 'tall60', 'density'],
    places: [
      { name: { ja: '丸の内（東京駅の西側）', en: 'Marunouchi (west of Tokyo Station)' }, lat: 35.6815, lon: 139.7655, note: { ja: '東京駅と高層のオフィスビル', en: 'Tokyo Station and office towers' } },
      { name: { ja: '新宿駅', en: 'Shinjuku Station' }, lat: 35.6882, lon: 139.6988, note: { ja: '商業ビルが密集する', en: 'dense commercial buildings' } },
      { name: { ja: '渋谷駅', en: 'Shibuya Station' }, lat: 35.6583, lon: 139.6996, note: { ja: '再開発の高層ビルと繁華街', en: 'redeveloped towers and busy streets' } },
    ],
  },
  {
    id: 'regional-station',
    kind: 'station',
    label: { ja: '地方都市の駅前', en: 'Regional-city station' },
    approximation: { ja: '中くらいの高さの建物が多く、住宅も混ざる所', en: 'mostly mid-rise buildings mixed with houses' },
    metrics: ['avgHeight', 'tall31', 'density', 'residential'],
    places: [
      { name: { ja: '沼津駅（静岡県沼津市）', en: 'Numazu Station (Shizuoka)' }, lat: 35.1029, lon: 138.8606, note: { ja: '商店街と中層のビル', en: 'shopping streets and mid-rise buildings' } },
      { name: { ja: '金沢駅（石川県金沢市）', en: 'Kanazawa Station (Ishikawa)' }, lat: 36.5781, lon: 136.6476, note: { ja: '駅前のホテル・オフィス街', en: 'hotels and offices by the station' } },
      { name: { ja: '宇都宮駅（栃木県宇都宮市）', en: 'Utsunomiya Station (Tochigi)' }, lat: 36.5598, lon: 139.8957, note: { ja: '県庁所在地の駅前', en: 'prefectural capital station area' } },
    ],
  },
  {
    id: 'rural-station',
    kind: 'station',
    label: { ja: '田舎の駅前', en: 'Countryside station' },
    approximation: {
      ja: '低い建物と住宅が中心の所（地方都市の駅前は大きな建物が多いので、1 ha あたりの棟数は田舎の駅前のほうが多く出ることがある）',
      en: 'mostly low buildings and houses (regional-city stations have many large buildings, so the number of buildings per ha can come out higher at a countryside station)',
    },
    metrics: ['avgHeight', 'residential', 'wooden', 'density'],
    places: [
      { name: { ja: '大聖寺駅（石川県加賀市）', en: 'Daishoji Station (Kaga, Ishikawa)' }, lat: 36.3003, lon: 136.3143, note: { ja: '小さな町の駅前', en: 'small-town station' } },
      { name: { ja: '茅野駅（長野県茅野市）', en: 'Chino Station (Nagano)' }, lat: 35.995, lon: 138.1522, note: { ja: '高原の町の駅前', en: 'highland town station' } },
      { name: { ja: '伊豆急下田駅（静岡県下田市）', en: 'Izukyu-Shimoda Station (Shizuoka)' }, lat: 34.68, lon: 138.9404, note: { ja: '海辺の小さな町', en: 'small seaside town' } },
    ],
  },
  {
    id: 'horror',
    kind: 'town',
    label: { ja: '古い木造の町並み', en: 'Old wooden townscape' },
    approximation: { ja: '古い建物と木造の建物が多い所', en: 'many old and wooden buildings' },
    metrics: ['old', 'wooden', 'avgHeight'],
    places: [
      { name: { ja: 'ひがし茶屋街（金沢市東山）', en: 'Higashi Chaya district (Kanazawa)' }, lat: 36.5714, lon: 136.6669, note: { ja: '古い木造の町並みが残る', en: 'an old wooden townscape remains' } },
      { name: { ja: 'ペリーロード付近（下田市三丁目）', en: 'Near Perry Road (Shimoda)' }, lat: 34.6679, lon: 138.9451, note: { ja: '古い家が残る港町', en: 'port town with old houses' } },
      { name: { ja: '旧城下町（加賀市大聖寺）', en: 'Old castle town (Daishoji, Kaga)' }, lat: 36.3047, lon: 136.3125, note: { ja: '古い家と寺が多い', en: 'many old houses and temples' } },
    ],
  },
  {
    id: 'calm-residential',
    kind: 'town',
    label: { ja: '静かな住宅街', en: 'Quiet residential area' },
    approximation: { ja: '住宅が多く、低い建物が中心の所', en: 'mostly houses and low buildings' },
    metrics: ['residential', 'avgHeight', 'tall31', 'density'],
    places: [
      { name: { ja: '成城学園前駅（東京都世田谷区）', en: 'Seijogakuen-mae Station (Setagaya, Tokyo)' }, lat: 35.64, lon: 139.5989, note: { ja: '低い戸建てが並ぶ住宅街', en: 'streets of low detached houses' } },
      { name: { ja: '石神井公園駅（東京都練馬区）', en: 'Shakujii-koen Station (Nerima, Tokyo)' }, lat: 35.7437, lon: 139.606, note: { ja: '公園のそばの住宅街', en: 'residential area near a park' } },
      { name: { ja: '荻窪駅（東京都杉並区）', en: 'Ogikubo Station (Suginami, Tokyo)' }, lat: 35.7044, lon: 139.6202, note: { ja: '駅の周りに住宅が広がる', en: 'houses spread around the station' } },
    ],
  },
  {
    id: 'futuristic',
    kind: 'town',
    label: { ja: '高層ビル街', en: 'High-rise district' },
    approximation: { ja: '超高層ビルと、新しい建物の多さで近似', en: 'approximated by high-rises and the share of new buildings' },
    metrics: ['tall60', 'avgHeight', 'new', 'tall31'],
    places: [
      { name: { ja: '都庁前駅（西新宿の高層ビル街）', en: 'Tochomae Station (Nishi-Shinjuku towers)' }, lat: 35.6904, lon: 139.6924, note: { ja: '超高層ビルが集まる', en: 'cluster of skyscrapers' } },
      { name: { ja: '汐留駅（東京都港区）', en: 'Shiodome Station (Minato, Tokyo)' }, lat: 35.663, lon: 139.7603, note: { ja: '再開発の高層ビル群', en: 'redeveloped high-rise cluster' } },
      { name: { ja: 'みなとみらい駅（横浜市）', en: 'Minatomirai Station (Yokohama)' }, lat: 35.4582, lon: 139.6319, note: { ja: '海沿いの新しい高層ビル街', en: 'new waterfront high-rise district' } },
    ],
  },
];

/** 選んだシチュエーションの根拠の数値（大事な順） */
export function situationEvidence(s: Situation, c: AreaCharacter): Evidence[] {
  return s.metrics.map((m) => evidenceOf(c, m));
}
