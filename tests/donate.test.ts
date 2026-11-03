import { describe, expect, it } from 'vitest';
import { donateLinks } from '../src/web/donate.js';
import { DONATE_CONFIG } from '../src/web/donate-config.js';
import { t, type Lang } from '../src/web/i18n/index.js';

const label = (l: Lang) => (s: 'ofuse' | 'githubSponsors') => t(s === 'ofuse' ? 'donate.ofuse' : 'donate.githubSponsors', {}, l);

const both = { ofuse: 'https://ofuse.me/example', githubSponsors: 'https://github.com/sponsors/example' };

describe('寄付ボタン', () => {
  it('URL が空なら出さない', () => {
    expect(donateLinks({ ofuse: '', githubSponsors: '' }, 'ja', label('ja'))).toEqual([]);
  });

  it('同梱の設定：OFUSE だけが入っていて、GitHub Sponsors はまだ空', () => {
    expect(DONATE_CONFIG.ofuse).toBe('https://ofuse.me/yukimichi');
    expect(donateLinks(DONATE_CONFIG, 'ja', label('ja')).map((l) => l.service)).toEqual(['ofuse']);
  });

  it('URL があるものだけを出す', () => {
    const links = donateLinks({ ofuse: '', githubSponsors: both.githubSponsors }, 'ja', label('ja'));
    expect(links.map((l) => l.service)).toEqual(['githubSponsors']);
    expect(links[0]!.url).toBe(both.githubSponsors);
  });

  it('日本語では OFUSE が先、英語では GitHub Sponsors が先', () => {
    expect(donateLinks(both, 'ja', label('ja')).map((l) => l.service)).toEqual(['ofuse', 'githubSponsors']);
    expect(donateLinks(both, 'en', label('en')).map((l) => l.service)).toEqual(['githubSponsors', 'ofuse']);
    expect(donateLinks(both, 'en-US', label('en'))[0]!.label).toBe('Sponsor on GitHub');
    expect(donateLinks(both, 'ja', label('ja'))[0]!.label).toBe('OFUSEで応援を送る');
  });

  it('https 以外の URL は使わない', () => {
    expect(donateLinks({ ofuse: 'javascript:alert(1)', githubSponsors: 'http://example.com' }, 'ja', label('ja'))).toEqual([]);
    expect(donateLinks({ ofuse: 'ofuse.me/x', githubSponsors: ' ' }, 'ja', label('ja'))).toEqual([]);
  });
});
