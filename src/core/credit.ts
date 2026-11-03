// 出典（クレジット）の文を作る。PlotBlock の素材のクレジット欄にそのまま貼れる形にする。
import type { FeatureType, SourceFile } from './catalog.js';
import type { Text } from './situation.js';

export const DATASET_NAMES: Record<FeatureType, string> = {
  bldg: '建築物モデル',
  tran: '道路モデル',
};
const DATASET_NAMES_EN: Record<string, string> = { 建築物モデル: 'building model', 道路モデル: 'road model' };

/** PLATEAU のデータの利用条件（2026-11 時点。公式サイトポリシーで要確認） */
export const LICENSE_TEXT = '公共データ利用規約（第1.0版）（CC BY 4.0 互換）';
export const LICENSE_TEXT_EN = 'Public Data License (Version 1.0) (compatible with CC BY 4.0)';
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
  /** short の英訳（参考。GLB の extras 用） */
  shortEn: string;
  /** クレジットの文章ファイルの中身 */
  text: string;
}

export interface UsedFile {
  file: SourceFile;
  /** このファイルから使った建物の自治体コード（分かるときだけ） */
  cityCodes: Set<string>;
}

export function buildCredit(
  used: UsedFile[],
  area: { description: Text; createdAt: string; /** 追加の加工の内容（3Dプリンタ用など） */ processing?: Text[] },
): CreditInfo {
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
  const titlesEn = sources.map(
    (s) => `"3D City Model (Project PLATEAU) ${s.cityName} (FY${s.year})" (Ministry of Land, Infrastructure, Transport and Tourism)`,
  );
  const shortEn = `Processed from ${titlesEn.join(', ')} (${LICENSE_TEXT_EN})`;

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
  lines.push(`・${area.description.ja}`);
  lines.push('・形を軽くする（建物の底面を省く、面の細かな情報や PLATEAU の写真の模様は使わない）');
  lines.push('・建物の地面の高さを 0 にそろえて並べ直す（地形は含まない）');
  if (used.some((u) => u.file.type === 'tran')) lines.push('・道路は範囲の形に切り取り、平らな板にする');
  for (const p of area.processing ?? []) lines.push(`・${p.ja}`);
  lines.push('');
  lines.push('このファイルは、上記のデータをもとに PLATEAUtoGLB で加工して作成したものです。');
  lines.push('GLB・OBJ・STL のどの形式で使うときも、また 3D プリントした物や画像・映像にして使うときも、この出典を表示してください。');
  lines.push('国土交通省・各自治体が作成したものではありません。');
  lines.push(`利用条件の詳細：${SITE_POLICY_URL}`);
  lines.push(`作成日：${area.createdAt}`);

  // 英訳（参考）。正式な出典は上の日本語の原文
  const hasRoads = used.some((u) => u.file.type === 'tran');
  lines.push('');
  lines.push('----');
  lines.push('[English translation for reference. The Japanese text above is the original.]');
  lines.push('Source:');
  lines.push(`Processed from ${titlesEn.join(', ')}`);
  for (const s of sources) {
    lines.push(`- ${s.cityName} (municipality code ${s.cityCode}, FY${s.year})`);
    lines.push(`  Data used: ${s.datasets.map((d) => DATASET_NAMES_EN[d] ?? d).join(', ')}`);
    lines.push(`  License: ${LICENSE_TEXT_EN}`);
    for (const u of s.urls) lines.push(`  Source URL: ${u}`);
  }
  lines.push('Processing:');
  lines.push(`- ${area.description.en}`);
  lines.push('- Simplified shapes (no building bottoms, no detailed surface data, no PLATEAU photo textures)');
  lines.push('- Placed buildings with their ground level at height 0 (terrain not included)');
  if (hasRoads) lines.push('- Clipped roads to the area and made them flat plates');
  for (const p of area.processing ?? []) lines.push(`- ${p.en}`);
  lines.push('This file was made by processing the data above with PLATEAUtoGLB.');
  lines.push('Show this attribution whenever you use the result, in any format (GLB, OBJ, STL) and also for 3D prints, images and videos.');
  lines.push('This was not created by the Ministry of Land, Infrastructure, Transport and Tourism or any municipality.');
  lines.push(`Terms of use: ${SITE_POLICY_URL}`);
  lines.push(`Created: ${area.createdAt}`);
  return { sources, short, shortEn, text: lines.join('\n') + '\n' };
}
