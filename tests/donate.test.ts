import { describe, expect, it } from 'vitest';
import { donateLinks } from '../src/web/donate.js';
import { DONATE_CONFIG } from '../src/web/donate-config.js';

const both = { ofuse: 'https://ofuse.me/example', githubSponsors: 'https://github.com/sponsors/example' };

describe('寄付ボタン', () => {
  it('URL が空なら出さない（同梱の設定は空）', () => {
    expect(donateLinks({ ofuse: '', githubSponsors: '' }, 'ja')).toEqual([]);
    expect(donateLinks(DONATE_CONFIG, 'ja')).toEqual([]);
  });

  it('URL があるものだけを出す', () => {
    const links = donateLinks({ ofuse: '', githubSponsors: both.githubSponsors }, 'ja');
    expect(links.map((l) => l.service)).toEqual(['githubSponsors']);
    expect(links[0]!.url).toBe(both.githubSponsors);
  });

  it('日本語では OFUSE が先、英語では GitHub Sponsors が先', () => {
    expect(donateLinks(both, 'ja').map((l) => l.service)).toEqual(['ofuse', 'githubSponsors']);
    expect(donateLinks(both, 'en').map((l) => l.service)).toEqual(['githubSponsors', 'ofuse']);
    expect(donateLinks(both, 'en-US')[0]!.label).toBe('Sponsor on GitHub');
    expect(donateLinks(both, 'ja')[0]!.label).toBe('OFUSE で応援');
  });

  it('https 以外の URL は使わない', () => {
    expect(donateLinks({ ofuse: 'javascript:alert(1)', githubSponsors: 'http://example.com' }, 'ja')).toEqual([]);
    expect(donateLinks({ ofuse: 'ofuse.me/x', githubSponsors: ' ' }, 'ja')).toEqual([]);
  });
});
