// 操作できる部品（ボタン・ドロップダウン・入力欄など）が背景に溶け込まないことを、色の値で確かめる。
// 部品の枠は、周りの色（ページ・カード・畳む欄の中）と部品自身の背景に対して 3:1 以上（WCAG の操作部品の目安）。
import { readFileSync } from 'node:fs';
import { describe, expect, it } from 'vitest';

const css = readFileSync(new URL('../src/web/style.css', import.meta.url), 'utf8');

function vars(block: string): Record<string, string> {
  const out: Record<string, string> = {};
  for (const m of block.matchAll(/--([\w-]+):\s*(#[0-9a-fA-F]{6})\s*;/g)) out[m[1]!] = m[2]!;
  return out;
}
const light = vars(css.slice(css.indexOf(':root {'), css.indexOf('}', css.indexOf(':root {'))));
const darkStart = css.indexOf(':root', css.indexOf('@media (prefers-color-scheme: dark)'));
const dark = { ...light, ...vars(css.slice(darkStart, css.indexOf('}', darkStart))) };

function luminance(hex: string): number {
  const c = [1, 3, 5].map((i) => parseInt(hex.slice(i, i + 2), 16) / 255).map((v) => (v <= 0.03928 ? v / 12.92 : ((v + 0.055) / 1.055) ** 2.4));
  return 0.2126 * c[0]! + 0.7152 * c[1]! + 0.0722 * c[2]!;
}
export function contrast(a: string, b: string): number {
  const [x, y] = [luminance(a), luminance(b)].sort((p, q) => q - p);
  return (x! + 0.05) / (y! + 0.05);
}

describe('操作できる部品の枠が背景に溶け込まない', () => {
  for (const [name, v] of [['ライト', light], ['ダーク', dark]] as const) {
    for (const around of ['bg', 'card', 'panel-bg', 'control-bg', 'button-bg']) {
      it(`${name}：部品の枠と ${around} の色の差が 3:1 以上`, () => {
        expect(v['control-border'], 'control-border').toBeTruthy();
        expect(v[around], around).toBeTruthy();
        expect(contrast(v['control-border']!, v[around]!)).toBeGreaterThanOrEqual(3);
      });
    }
  }
  it('計算の確かめ：白と黒は 21:1', () => {
    expect(contrast('#ffffff', '#000000')).toBeCloseTo(21, 5);
  });
});
