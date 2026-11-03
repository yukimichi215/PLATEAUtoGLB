// シチュエーション検索：「都会の駅前」や町並み（戸建て住宅地・団地など）から、向いた地域の候補を出す。
// 候補の地域は手で選んだ一覧。選んだ地域が本当に向いているかは、切り出した建物の「見た目でわかる特徴」
// （高さ・上から見た大きさ・密度・高さのばらつき）から出した「根拠の数値」で示す。
// PLATEAU の形からは木造かどうか・古さ・町の雰囲気はわからないので、それで選ぶ条件は作らない。
// 作品のジャンル（ホラーなど）の名前も付けない（建物の細かさが足りず、ジャンル向けとしては機能しないため。2026-11-03 利用者）。
// 一般に公開するので、実在の町を悪く言う名前・説明にしない（候補は「データ上の特徴が近い例」として出す）。
import type { LatLon } from './geo.js';

/** 根拠の数値の計算に使う、建物1棟の特徴（BuildingInfo の一部） */
export interface CharacterInput {
  measuredHeight?: number;
  /** 上から見た大きさ（m²） */
  footprintM2?: number;
}

/** 小さな建物（戸建ての家くらい）・大きな建物（工場・倉庫・大きなビルくらい）の、上から見た大きさの境（m²） */
export const SMALL_M2 = 150;
export const LARGE_M2 = 1000;

/** 切り出した範囲の建物の特徴（根拠の数値） */
export interface AreaCharacter {
  buildings: number;
  /** 範囲の広さ（ha） */
  areaHa: number;
  /** 1 ha あたりの棟数 */
  density: number;
  /** 高さが分かる棟数と、その平均・ばらつき（標準偏差）（m） */
  heightKnown: number;
  avgHeight?: number;
  heightSd?: number;
  /** 高さ 31m 以上（おおむね 10 階建て以上）・60m 以上（超高層）の棟数 */
  tall31: number;
  tall60: number;
  /** 上から見た大きさが分かる棟数と、その平均（m²）。SMALL_M2 未満・LARGE_M2 以上の棟数 */
  footprintKnown: number;
  avgFootprint?: number;
  small: number;
  large: number;
}

export function areaCharacter(buildings: CharacterInput[], areaM2: number): AreaCharacter {
  const c: AreaCharacter = {
    buildings: buildings.length,
    areaHa: areaM2 / 10000,
    density: areaM2 > 0 ? buildings.length / (areaM2 / 10000) : 0,
    heightKnown: 0,
    tall31: 0,
    tall60: 0,
    footprintKnown: 0,
    small: 0,
    large: 0,
  };
  let heightSum = 0;
  let heightSq = 0;
  let footSum = 0;
  for (const b of buildings) {
    if (b.measuredHeight !== undefined) {
      c.heightKnown++;
      heightSum += b.measuredHeight;
      heightSq += b.measuredHeight ** 2;
      if (b.measuredHeight >= 31) c.tall31++;
      if (b.measuredHeight >= 60) c.tall60++;
    }
    if (b.footprintM2 !== undefined && b.footprintM2 > 0) {
      c.footprintKnown++;
      footSum += b.footprintM2;
      if (b.footprintM2 < SMALL_M2) c.small++;
      if (b.footprintM2 >= LARGE_M2) c.large++;
    }
  }
  if (c.heightKnown > 0) {
    c.avgHeight = heightSum / c.heightKnown;
    c.heightSd = Math.sqrt(Math.max(0, heightSq / c.heightKnown - c.avgHeight ** 2));
  }
  if (c.footprintKnown > 0) c.avgFootprint = footSum / c.footprintKnown;
  return c;
}

/** 根拠の数値の種類 */
export type Metric = 'density' | 'avgHeight' | 'heightSd' | 'tall31' | 'tall60' | 'avgFootprint' | 'small' | 'large';

/** 割合の母数の種類（「高さが分かる N 棟のうち」など） */
export type Basis = 'all' | 'height' | 'footprint';

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
  /** 密度（棟/ha）・平均の高さ（m）・高さのばらつき（m）・平均の大きさ（m²）のときの値 */
  value?: number;
  /** 密度のときの範囲の広さ（ha） */
  areaHa?: number;
}

const BASIS: Record<Metric, Basis> = {
  density: 'all',
  avgHeight: 'height',
  heightSd: 'height',
  tall31: 'height',
  tall60: 'height',
  avgFootprint: 'footprint',
  small: 'footprint',
  large: 'footprint',
};

export function evidenceOf(c: AreaCharacter, metric: Metric): Evidence {
  const basis = BASIS[metric];
  const of = { all: c.buildings, height: c.heightKnown, footprint: c.footprintKnown }[basis];
  const n = {
    density: c.buildings,
    avgHeight: c.heightKnown,
    heightSd: c.heightKnown,
    tall31: c.tall31,
    tall60: c.tall60,
    avgFootprint: c.footprintKnown,
    small: c.small,
    large: c.large,
  }[metric];
  const e: Evidence = { metric, basis, known: basis === 'all' || of > 0, n, of, pct: of > 0 ? Math.round((n / of) * 100) : 0 };
  if (metric === 'density') {
    e.value = c.density;
    e.areaHa = c.areaHa;
  }
  const value = { avgHeight: c.avgHeight, heightSd: c.heightSd, avgFootprint: c.avgFootprint }[metric as 'avgHeight'];
  if (value !== undefined) e.value = value;
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
  /** 'station'：駅前、'town'：町並み */
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
// 駅前・戸建て住宅地の座標は国土地理院の住所検索で駅名・地名を調べた位置（2026-11-03）。
// 工場・倉庫街とまばらな集落は、PLATEAU のデータで 300m 四方ずつ数えて特徴が合う所を選んだ位置（地名は CityGML の住所。2026-11-03）。
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
    approximation: { ja: '中くらいの高さの建物が多く、小さな家も混ざる所', en: 'mostly mid-rise buildings mixed with small houses' },
    metrics: ['avgHeight', 'tall31', 'small', 'density'],
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
      ja: '低く小さな建物が中心の所（地方都市の駅前は大きな建物が多いので、1 ha あたりの棟数は田舎の駅前のほうが多く出ることがある）',
      en: 'mostly low, small buildings (regional-city stations have many large buildings, so the number of buildings per ha can come out higher at a countryside station)',
    },
    metrics: ['avgHeight', 'small', 'density'],
    places: [
      { name: { ja: '大聖寺駅（石川県加賀市）', en: 'Daishoji Station (Kaga, Ishikawa)' }, lat: 36.3003, lon: 136.3143, note: { ja: '小さな町の駅前', en: 'small-town station' } },
      { name: { ja: '茅野駅（長野県茅野市）', en: 'Chino Station (Nagano)' }, lat: 35.995, lon: 138.1522, note: { ja: '高原の町の駅前', en: 'highland town station' } },
      { name: { ja: '伊豆急下田駅（静岡県下田市）', en: 'Izukyu-Shimoda Station (Shizuoka)' }, lat: 34.68, lon: 138.9404, note: { ja: '海辺の小さな町', en: 'small seaside town' } },
    ],
  },
  {
    id: 'detached-houses',
    kind: 'town',
    label: { ja: '戸建て住宅地', en: 'Detached-house neighborhood' },
    approximation: { ja: '上から見て小さく、低い建物（家）が多く、密集している所', en: 'many small, low buildings (houses) packed closely together' },
    metrics: ['small', 'avgHeight', 'density', 'avgFootprint'],
    places: [
      { name: { ja: '成城学園前駅（東京都世田谷区）', en: 'Seijogakuen-mae Station (Setagaya, Tokyo)' }, lat: 35.64, lon: 139.5989, note: { ja: '低い戸建てが並ぶ住宅街', en: 'streets of low detached houses' } },
      { name: { ja: '石神井公園駅（東京都練馬区）', en: 'Shakujii-koen Station (Nerima, Tokyo)' }, lat: 35.7437, lon: 139.606, note: { ja: '公園のそばの住宅街', en: 'residential area near a park' } },
      { name: { ja: '荻窪駅（東京都杉並区）', en: 'Ogikubo Station (Suginami, Tokyo)' }, lat: 35.7044, lon: 139.6202, note: { ja: '駅の周りに住宅が広がる', en: 'houses spread around the station' } },
    ],
  },
  {
    id: 'industrial',
    kind: 'town',
    label: { ja: '工場・倉庫街', en: 'Factories and warehouses' },
    approximation: { ja: '上から見て大きく、高さの低い（平たい）建物が多い所', en: 'many large, low (flat) buildings' },
    metrics: ['large', 'avgFootprint', 'avgHeight', 'density'],
    places: [
      { name: { ja: '東海三丁目（東京都大田区）', en: 'Tokai 3-chome (Ota, Tokyo)' }, lat: 35.5811, lon: 139.7634, note: { ja: '大きな倉庫が並ぶ', en: 'rows of large warehouses' } },
      { name: { ja: '平和島二丁目（東京都大田区）', en: 'Heiwajima 2-chome (Ota, Tokyo)' }, lat: 35.5869, lon: 139.7463, note: { ja: '大きな物流の建物', en: 'large logistics buildings' } },
      { name: { ja: '東海二丁目（東京都大田区）', en: 'Tokai 2-chome (Ota, Tokyo)' }, lat: 35.5798, lon: 139.7568, note: { ja: '埋め立て地の倉庫と工場', en: 'warehouses and factories on reclaimed land' } },
    ],
  },
  {
    id: 'sparse-village',
    kind: 'town',
    label: { ja: 'まばらな集落', en: 'Scattered village' },
    approximation: { ja: '低い建物が、とてもまばらにある所', en: 'low buildings spread very thinly' },
    metrics: ['density', 'avgHeight', 'small'],
    places: [
      { name: { ja: '更別村の郊外・南（北海道）', en: 'Outskirts of Sarabetsu, south (Hokkaido)' }, lat: 42.619, lon: 143.2188, note: { ja: '畑の中に家が点在する', en: 'houses dotted among fields' } },
      { name: { ja: '更別村の郊外・北（北海道）', en: 'Outskirts of Sarabetsu, north (Hokkaido)' }, lat: 42.6311, lon: 143.2151, note: { ja: '広い畑と農家', en: 'wide fields and farmhouses' } },
      { name: { ja: '浮羽町小塩（福岡県うきは市）', en: 'Ukiha-machi Koshio (Ukiha, Fukuoka)' }, lat: 33.3063, lon: 130.8445, note: { ja: '山あいの小さな集落', en: 'small mountain hamlet' } },
    ],
  },
];

/** 選んだシチュエーションの根拠の数値（大事な順） */
export function situationEvidence(s: Situation, c: AreaCharacter): Evidence[] {
  return s.metrics.map((m) => evidenceOf(c, m));
}
