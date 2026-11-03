import { createReadStream, readdirSync, readFileSync } from 'node:fs';
import { describe, expect, it } from 'vitest';
import type { SourceFile } from '../src/core/catalog.js';
import { generateFromPlan, validateRequest, type AreaPlan, type OpenText } from '../src/core/pipeline.js';
import { validatePrint } from '../src/core/print.js';
import { translateCore } from '../src/web/i18n/core-messages.js';
import { en } from '../src/web/i18n/en.js';
import { initialLang, t } from '../src/web/i18n/index.js';
import { ja, type MessageKey } from '../src/web/i18n/ja.js';

const JP = /[぀-ヿ一-鿿]/;
const read = (path: string) => readFileSync(new URL(`../${path}`, import.meta.url), 'utf8');
const params = (s: string) => [...s.matchAll(/\{(\w+)\}/g)].map((m) => m[1]).sort();

/** 英語の文に日本語が入っていてよいもの（日本語の住所の例と、地図の出典。国土地理院は「地理院タイル」などの表記を求めている） */
const EN_MAY_HAVE_JAPANESE = new Set<MessageKey>(['search.placeholder', 'search.notFound', 'map.attribution']);

/** ソースの、コメントを除いた文字列（'…'・"…"・`…`）の一覧 */
function stringLiterals(source: string): string[] {
  const out: string[] = [];
  for (const line of source.split('\n')) {
    const tline = line.trim();
    if (tline.startsWith('//') || tline.startsWith('*') || tline.startsWith('/*')) continue;
    const code = line.replace(/\/\/.*$/, '');
    for (const m of code.matchAll(/'(?:[^'\\]|\\.)*'|"(?:[^"\\]|\\.)*"|`(?:[^`\\]|\\.)*`/g)) out.push(m[0]);
  }
  return out;
}

describe('日本語・英語の切り替え', () => {
  it('日本語と英語の辞書に同じ項目があり、差し込む値の名前も同じ', () => {
    expect(Object.keys(en).sort()).toEqual(Object.keys(ja).sort());
    for (const key of Object.keys(ja) as MessageKey[]) {
      expect(ja[key].length, key).toBeGreaterThan(0);
      expect(en[key].length, key).toBeGreaterThan(0);
      expect(params(en[key]), key).toEqual(params(ja[key]));
      if (!EN_MAY_HAVE_JAPANESE.has(key)) expect(en[key], key).not.toMatch(JP);
    }
  });

  it('HTML に直接書いた文言がない（日本語の文はすべて辞書のキーを持ち、辞書と同じ）', () => {
    let html = read('index.html').replace(/<!--[\s\S]*?-->/g, '');
    // data-i18n を持つ要素の中身は辞書と同じであること
    const keyed = /<(\w+)([^>]*?)\sdata-i18n="([\w.]+)"([^>]*)>([^<]*)<\/\1>/g;
    let count = 0;
    for (const m of html.matchAll(keyed)) {
      const key = m[3] as MessageKey;
      expect(key in ja, key).toBe(true);
      const n = /data-i18n-n="([^"]*)"/.exec(m[2]! + m[4]!)?.[1];
      expect(m[5]!.trim(), key).toBe(t(key, n === undefined ? {} : { n }, 'ja'));
      count++;
    }
    expect(count).toBeGreaterThan(40);
    html = html.replace(keyed, '');
    // 残った文字に日本語がない（言語の選択肢「日本語」は、どの言語でもそのまま出す）
    const texts = [...html.matchAll(/>([^<]+)</g)].map((m) => m[1]!.trim()).filter((s) => s !== '' && s !== '日本語');
    for (const s of texts) expect(s).not.toMatch(JP);
    // 日本語の属性は data-i18n-attr で辞書から入れる
    for (const tag of html.matchAll(/<[^>]+>/g)) {
      for (const a of tag[0].matchAll(/\s([\w-]+)="([^"]*)"/g)) {
        if (!JP.test(a[2]!)) continue;
        const attrMap = /data-i18n-attr="([^"]*)"/.exec(tag[0])?.[1] ?? '';
        const entry = attrMap.split(';').find((p) => p.split(':')[0] === a[1]);
        expect(entry, `${a[1]}="${a[2]}"`).toBeDefined();
        expect(a[2]).toBe(t(entry!.split(':')[1] as MessageKey, {}, 'ja'));
      }
    }
  });

  it('画面の処理（src/web）に日本語の文言を直接書いていない', () => {
    const dir = new URL('../src/web/', import.meta.url);
    // worker.ts は中身の処理と同じく日本語の知らせを出し、画面の側（translateCore）で訳す（次のテストで確かめる）
    const files = readdirSync(dir).filter((f) => f.endsWith('.ts') && f !== 'worker.ts');
    expect(files.length).toBeGreaterThan(5);
    for (const f of files) {
      for (const lit of stringLiterals(readFileSync(new URL(f, dir), 'utf8'))) expect(lit, f).not.toMatch(JP);
    }
  });

  it('中身の処理のエラー・進み具合・注意の文は、すべて英語にできる', async () => {
    // ソースに書かれた文（${…} は 1 にして）を英語にすると、日本語が残らない
    const sources = ['src/core/pipeline.ts', 'src/core/print.ts', 'src/core/scene.ts', 'src/core/citygml.ts', 'src/web/worker.ts'];
    let n = 0;
    for (const file of sources) {
      const src = read(file);
      for (const m of src.matchAll(/(?:new Error\(|message: |warnings\.push\()\s*(['`])((?:[^'`\\]|\\.)*?)\1/g)) {
        const sample = m[2]!.replace(/\$\{[^}]*\}/g, '1');
        if (!JP.test(sample)) continue;
        expect(translateCore(sample), `${file}: ${sample}`).not.toMatch(JP);
        n++;
      }
    }
    expect(n).toBeGreaterThan(15);

    // 実際の入力でも確かめる
    const errorOf = (fn: () => void) => {
      try {
        fn();
      } catch (e) {
        return (e as Error).message;
      }
      throw new Error('エラーにならなかった');
    };
    const base = { center: { lat: 35.6812, lon: 139.7671 }, size: 300, lod: 1 as const, includeRoads: true, includeGround: true };
    const real = [
      errorOf(() => validateRequest({ ...base, center: { lat: 0, lon: 0 } })),
      errorOf(() => validateRequest({ ...base, size: 5 })),
      errorOf(() => validateRequest({ ...base, heightScale: 9 })),
      errorOf(() => validatePrint({ scaleDenominator: 7, baseMm: 3 })),
      errorOf(() => validatePrint({ fitSideMm: 1, baseMm: 3 })),
      errorOf(() => validatePrint({ scaleDenominator: 1000, baseMm: 99 })),
      errorOf(() => validatePrint({ scaleDenominator: 1000, baseMm: 3, minFeatureMm: 99 })),
    ];
    // 進み具合の知らせ（見本データで作る）
    const file: SourceFile = {
      type: 'bldg',
      mesh: '53394611',
      url: 'https://assets.cms.plateau.reearth.io/test/13101/bldg.gml',
      fileSize: 1000,
      maxLod: 2,
      cities: [{ code: '13101', name: '千代田区', year: 2025, url: 'https://assets.cms.plateau.reearth.io/test/13101/bldg.gml' }],
    };
    const plan: AreaPlan = { request: { ...base, includeRoads: false }, meshes: [], files: [file], totalBytes: 1000, unknownSizeFiles: 0 };
    const openText: OpenText = async (_f, onBytes) => {
      onBytes(1e6);
      return createReadStream(new URL('./fixtures/bldg_tokyo_station.gml', import.meta.url), { encoding: 'utf8' }) as AsyncIterable<string>;
    };
    await generateFromPlan(plan, openText, (p) => real.push(p.message));
    expect(real.length).toBeGreaterThan(8);
    for (const msg of real) expect(translateCore(msg), msg).not.toMatch(JP);
    expect(translateCore('2/3 道路データ（メッシュ 53394611） を読み込み中… 5 / 38 MB')).toBe('Reading 2/3 road data (mesh 53394611)… 5 / 38 MB');
  });

  it('最初の言語はブラウザの言語に合わせ、選んだものを覚えていればそちら', () => {
    expect(initialLang(null, ['ja-JP', 'en-US'])).toBe('ja');
    expect(initialLang(null, ['en-US', 'fr'])).toBe('en');
    expect(initialLang(null, ['fr-FR'])).toBe('en');
    expect(initialLang('ja', ['en-US'])).toBe('ja');
    expect(initialLang('en', ['ja'])).toBe('en');
    expect(initialLang('xx', ['ja'])).toBe('ja');
  });

  it('出典は日本語の原文を残し、英訳を併記する', async () => {
    const res = await import('../src/core/credit.js').then(({ buildCredit }) =>
      buildCredit(
        [
          {
            file: {
              type: 'bldg',
              mesh: '1',
              url: 'u',
              fileSize: 1,
              maxLod: 1,
              cities: [{ code: '13101', name: '千代田区', year: 2025, url: 'https://example.com/a' }],
            },
            cityCodes: new Set(['13101']),
          },
        ],
        { description: { ja: '説明', en: 'Description' }, createdAt: '2026-11-03', processing: [{ ja: '加工', en: 'Processed' }] },
      ),
    );
    const [jaPart, enPart] = res.text.split('----');
    expect(jaPart).toContain('「3D都市モデル（Project PLATEAU）千代田区（2025年度）」（国土交通省）を加工して作成');
    expect(jaPart).toContain('・加工');
    expect(enPart).toContain('English translation for reference');
    expect(enPart).toContain('"3D City Model (Project PLATEAU) 千代田区 (FY2025)"');
    expect(enPart).toContain('- Description');
    expect(enPart).toContain('- Processed');
  });
});
