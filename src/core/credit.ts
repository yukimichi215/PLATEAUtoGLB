// 出典（クレジット）の文を作る。PlotBlock の素材のクレジット欄にそのまま貼れる形にする。
import type { FeatureType, SourceFile } from './catalog.js';

export const DATASET_NAMES: Record<FeatureType, string> = {
  bldg: '建築物モデル',
  tran: '道路モデル',
};

/** PLATEAU のデータの利用条件（2026-11 時点。公式サイトポリシーで要確認） */
export const LICENSE_TEXT = '公共データ利用規約（第1.0版）（CC BY 4.0 互換）';
export const SITE_POLICY_URL = 'https://www.mlit.go.jp/plateau/site-policy/';

export interface CreditSource {
  cityCode: string;
  cityName: string;
  year: number;
  datasets: string[];
  urls: string[];
}

export interface CreditInfo {
  sources: CreditSource[];
  /** 1行で書いた出典（asset.copyright 用） */
  short: string;
  /** クレジットの文章ファイルの中身 */
  text: string;
}

export interface UsedFile {
  file: SourceFile;
  /** このファイルから使った建物の自治体コード（分かるときだけ） */
  cityCodes: Set<string>;
}

export function buildCredit(used: UsedFile[], area: { description: string; createdAt: string }): CreditInfo {
  const byCity = new Map<string, CreditSource>();
  for (const { file, cityCodes } of used) {
    // 建物に自治体コードが書いてあれば、その自治体だけを出典にする。なければ配布元の全自治体
    const matching = file.cities.filter((c) => cityCodes.has(c.code));
    const cities = matching.length > 0 ? matching : file.cities;
    for (const c of cities) {
      const key = `${c.code}/${c.year}`;
      let s = byCity.get(key);
      if (!s) {
        s = { cityCode: c.code, cityName: c.name, year: c.year, datasets: [], urls: [] };
        byCity.set(key, s);
      }
      const ds = DATASET_NAMES[file.type];
      if (!s.datasets.includes(ds)) s.datasets.push(ds);
      if (!s.urls.includes(c.url)) s.urls.push(c.url);
    }
  }
  const sources = [...byCity.values()].sort((a, b) => a.cityCode.localeCompare(b.cityCode));

  const titles = sources.map(
    (s) => `「3D都市モデル（Project PLATEAU）${s.cityName}（${s.year}年度）」（国土交通省）`,
  );
  const short = `${titles.join('、')}を加工して作成（${LICENSE_TEXT}）`;

  const lines: string[] = [];
  lines.push('【出典】');
  lines.push(`${titles.join('、')}を加工して作成`);
  lines.push('');
  for (const s of sources) {
    lines.push(`■ ${s.cityName}（自治体コード ${s.cityCode}・${s.year}年度）`);
    lines.push(`  使用データ：${s.datasets.join('、')}`);
    lines.push(`  ライセンス：${LICENSE_TEXT}`);
    lines.push('  入手先（PLATEAU データカタログ）：');
    for (const u of s.urls) lines.push(`    ${u}`);
  }
  lines.push('');
  lines.push('【加工の内容】');
  lines.push(`・${area.description}`);
  lines.push('・形を軽くする（建物の底面を省く、面の細かな情報や PLATEAU の写真の模様は使わない）');
  lines.push('・建物の地面の高さを 0 にそろえて並べ直す（地形は含まない）');
  if (used.some((u) => u.file.type === 'tran')) lines.push('・道路は範囲の形に切り取り、平らな板にする');
  lines.push('');
  lines.push('このファイルは、上記のデータをもとに PLATEAUtoGLB で加工して作成したものです。');
  lines.push('国土交通省・各自治体が作成したものではありません。');
  lines.push(`利用条件の詳細：${SITE_POLICY_URL}`);
  lines.push(`作成日：${area.createdAt}`);
  return { sources, short, text: lines.join('\n') + '\n' };
}
