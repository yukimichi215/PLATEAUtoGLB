import { describe, expect, it } from 'vitest';
import { donateLinks } from '../src/web/donate.js';
import { DONATE_CONFIG } from '../src/web/donate-config.js';
import { t, type Lang } from '../src/web/i18n/index.js';

const label = (l: Lang) => () => t('donate.ofuse', {}, l);

describe('寄付ボタン', () => {
  it('URL が空なら出さない', () => {
    expect(donateLinks({ ofuse: '' }, label('ja'))).toEqual([]);
  });

  it('同梱の設定：OFUSE のリンク1つだけ', () => {
    expect(DONATE_CONFIG.ofuse).toBe('https://ofuse.me/yukimichi');
    expect(donateLinks(DONATE_CONFIG, label('ja')).map((l) => l.service)).toEqual(['ofuse']);
  });

  it('日本語・英語とも同じリンクで、文言だけが変わる', () => {
    const ja = donateLinks(DONATE_CONFIG, label('ja'));
    const en = donateLinks(DONATE_CONFIG, label('en'));
    expect(ja[0]!.url).toBe(en[0]!.url);
    expect(ja[0]!.label).toBe('OFUSEで応援を送る');
    expect(en[0]!.label).toBe(t('donate.ofuse', {}, 'en'));
  });

  it('https 以外の URL は使わない', () => {
    expect(donateLinks({ ofuse: 'javascript:alert(1)' }, label('ja'))).toEqual([]);
    expect(donateLinks({ ofuse: 'ofuse.me/x' }, label('ja'))).toEqual([]);
  });
});
