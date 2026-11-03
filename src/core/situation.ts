// シチュエーション検索：「都会の駅前」や作品のジャンル（古い木造の町並みなど）から、向いた地域の候補を出す。
// 候補の地域は手で選んだ一覧。選んだ地域が本当に向いているかは、切り出した建物の属性
// （建てた年・構造・用途・高さ・建物の密度）から出した「根拠の数値」で示す。
// 町の雰囲気（「ほのぼの」など）は PLATEAU のデータにないので、属性での近似であることを画面に出す。
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

export interface Evidence {
  metric: Metric;
  label: string;
  /** 数値（データがないときは「データなし」の説明） */
  value: string;
  /** その数値が出せたか */
  known: boolean;
}

const pct = (n: number, d: number) => `${Math.round((n / d) * 100)}%`;
const noData = (what: string) => `データなし（この地域のデータには${what}が入っていません）`;

/** 根拠の数値を、画面に出す文にする */
export function evidenceOf(c: AreaCharacter, metric: Metric): Evidence {
  switch (metric) {
    case 'density':
      return {
        metric,
        label: '建物の密度',
        value: `1 ha（100m 四方）あたり ${c.density.toFixed(1)} 棟（${c.buildings} 棟 / ${c.areaHa.toFixed(1)} ha）`,
        known: true,
      };
    case 'avgHeight':
      return c.avgHeight === undefined
        ? { metric, label: '平均の高さ', value: noData('高さ'), known: false }
        : { metric, label: '平均の高さ', value: `${c.avgHeight.toFixed(1)} m（高さが分かる ${c.heightKnown} 棟）`, known: true };
    case 'tall31':
      return c.heightKnown === 0
        ? { metric, label: '高さ 31m 以上（10 階建てくらい以上）', value: noData('高さ'), known: false }
        : {
            metric,
            label: '高さ 31m 以上（10 階建てくらい以上）',
            value: `${pct(c.tall31, c.heightKnown)}（${c.tall31} 棟 / 高さが分かる ${c.heightKnown} 棟）`,
            known: true,
          };
    case 'tall60':
      return c.heightKnown === 0
        ? { metric, label: '高さ 60m 以上（超高層）', value: noData('高さ'), known: false }
        : {
            metric,
            label: '高さ 60m 以上（超高層）',
            value: `${c.tall60} 棟（高さが分かる ${c.heightKnown} 棟のうち ${pct(c.tall60, c.heightKnown)}）`,
            known: true,
          };
    case 'old':
      return c.yearKnown === 0
        ? { metric, label: '1970 年以前に建てた建物', value: noData('建てた年'), known: false }
        : {
            metric,
            label: '1970 年以前に建てた建物',
            value: `${pct(c.builtBy1970, c.yearKnown)}（${c.builtBy1970} 棟 / 建てた年が分かる ${c.yearKnown} 棟）`,
            known: true,
          };
    case 'new':
      return c.yearKnown === 0
        ? { metric, label: '2000 年以降に建てた建物', value: noData('建てた年'), known: false }
        : {
            metric,
            label: '2000 年以降に建てた建物',
            value: `${pct(c.builtFrom2000, c.yearKnown)}（${c.builtFrom2000} 棟 / 建てた年が分かる ${c.yearKnown} 棟）`,
            known: true,
          };
    case 'wooden':
      return c.structureKnown === 0
        ? { metric, label: '木造の建物', value: noData('構造'), known: false }
        : {
            metric,
            label: '木造の建物',
            value: `${pct(c.wooden, c.structureKnown)}（${c.wooden} 棟 / 構造が分かる ${c.structureKnown} 棟）`,
            known: true,
          };
    case 'residential':
      return c.usageKnown === 0
        ? { metric, label: '住宅（店舗などとの併用を含む）', value: noData('用途'), known: false }
        : {
            metric,
            label: '住宅（店舗などとの併用を含む）',
            value: `${pct(c.residential, c.usageKnown)}（${c.residential} 棟 / 用途が分かる ${c.usageKnown} 棟）`,
            known: true,
          };
  }
}

export interface SituationPlace extends LatLon {
  name: string;
  /** 選んだ理由（短く） */
  note: string;
}

export interface Situation {
  id: string;
  /** 'station'：駅前の雰囲気、'genre'：作品のジャンル */
  kind: 'station' | 'genre';
  label: string;
  /** どの属性で近似するか（画面に出す） */
  approximation: string;
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
    label: '都会の駅前',
    approximation: '高い建物が多く、平均の高さが高い所（大きなビルは1棟が大きいので、1 ha あたりの棟数はむしろ少なく出ることがある）',
    metrics: ['avgHeight', 'tall31', 'tall60', 'density'],
    places: [
      { name: '丸の内（東京駅の西側）', lat: 35.6815, lon: 139.7655, note: '東京駅と高層のオフィスビル' },
      { name: '新宿駅', lat: 35.6882, lon: 139.6988, note: '商業ビルが密集する' },
      { name: '渋谷駅', lat: 35.6583, lon: 139.6996, note: '再開発の高層ビルと繁華街' },
    ],
  },
  {
    id: 'regional-station',
    kind: 'station',
    label: '地方都市の駅前',
    approximation: '中くらいの高さの建物が多く、住宅も混ざる所',
    metrics: ['avgHeight', 'tall31', 'density', 'residential'],
    places: [
      { name: '沼津駅（静岡県沼津市）', lat: 35.1029, lon: 138.8606, note: '商店街と中層のビル' },
      { name: '金沢駅（石川県金沢市）', lat: 36.5781, lon: 136.6476, note: '駅前のホテル・オフィス街' },
      { name: '宇都宮駅（栃木県宇都宮市）', lat: 36.5598, lon: 139.8957, note: '県庁所在地の駅前' },
    ],
  },
  {
    id: 'rural-station',
    kind: 'station',
    label: '田舎の駅前',
    approximation:
      '低い建物と住宅が中心の所（地方都市の駅前は大きな建物が多いので、1 ha あたりの棟数は田舎の駅前のほうが多く出ることがある）',
    metrics: ['avgHeight', 'residential', 'wooden', 'density'],
    places: [
      { name: '大聖寺駅（石川県加賀市）', lat: 36.3003, lon: 136.3143, note: '小さな町の駅前' },
      { name: '茅野駅（長野県茅野市）', lat: 35.995, lon: 138.1522, note: '高原の町の駅前' },
      { name: '伊豆急下田駅（静岡県下田市）', lat: 34.68, lon: 138.9404, note: '海辺の小さな町' },
    ],
  },
  {
    id: 'horror',
    kind: 'genre',
    label: '古い木造の町並み（ホラー・時代もの向き）',
    approximation: '古い建物と木造の建物が多い所',
    metrics: ['old', 'wooden', 'avgHeight'],
    places: [
      { name: 'ひがし茶屋街（金沢市東山）', lat: 36.5714, lon: 136.6669, note: '古い木造の町並みが残る' },
      { name: 'ペリーロード付近（下田市三丁目）', lat: 34.6679, lon: 138.9451, note: '古い家が残る港町' },
      { name: '旧城下町（加賀市大聖寺）', lat: 36.3047, lon: 136.3125, note: '古い家と寺が多い' },
    ],
  },
  {
    id: 'calm-residential',
    kind: 'genre',
    label: 'ほのぼの（静かな住宅街）',
    approximation: '住宅が多く、低い建物が中心の所',
    metrics: ['residential', 'avgHeight', 'tall31', 'density'],
    places: [
      { name: '成城学園前駅（東京都世田谷区）', lat: 35.64, lon: 139.5989, note: '低い戸建てが並ぶ住宅街' },
      { name: '石神井公園駅（東京都練馬区）', lat: 35.7437, lon: 139.606, note: '公園のそばの住宅街' },
      { name: '荻窪駅（東京都杉並区）', lat: 35.7044, lon: 139.6202, note: '駅の周りに住宅が広がる' },
    ],
  },
  {
    id: 'futuristic',
    kind: 'genre',
    label: '近未来（高層ビル街）',
    approximation: '超高層ビルと、新しい建物の多さで近似',
    metrics: ['tall60', 'avgHeight', 'new', 'tall31'],
    places: [
      { name: '都庁前駅（西新宿の高層ビル街）', lat: 35.6904, lon: 139.6924, note: '超高層ビルが集まる' },
      { name: '汐留駅（東京都港区）', lat: 35.663, lon: 139.7603, note: '再開発の高層ビル群' },
      { name: 'みなとみらい駅（横浜市）', lat: 35.4582, lon: 139.6319, note: '海沿いの新しい高層ビル街' },
    ],
  },
];

/** 選んだシチュエーションの根拠の数値（大事な順） */
export function situationEvidence(s: Situation, c: AreaCharacter): Evidence[] {
  return s.metrics.map((m) => evidenceOf(c, m));
}
