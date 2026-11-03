// 寄付（応援）ボタン：設定した URL へのただのリンク。外部のスクリプト・画像・追跡は使わない。
import type { DONATE_CONFIG } from './donate-config.js';

export type DonateConfig = typeof DONATE_CONFIG;
export type DonateService = 'ofuse' | 'githubSponsors';

export interface DonateLink {
  service: DonateService;
  label: string;
  url: string;
}

/** 使う URL か（https のみ。空や別の形式は使わない） */
function usable(url: string): boolean {
  try {
    return new URL(url.trim()).protocol === 'https:';
  } catch {
    return false;
  }
}

/**
 * 表示するボタンの一覧。URL が空・不正なものは出さない。
 * 日本語の画面では OFUSE を先に、英語の画面では GitHub Sponsors を先に並べる。
 */
export function donateLinks(cfg: DonateConfig, lang: string, labelOf: (s: DonateService) => string): DonateLink[] {
  const en = lang.toLowerCase().startsWith('en');
  const order: DonateService[] = en ? ['githubSponsors', 'ofuse'] : ['ofuse', 'githubSponsors'];
  return order.filter((s) => usable(cfg[s])).map((s) => ({ service: s, label: labelOf(s), url: cfg[s].trim() }));
}

// GitHub Sponsors の絵はアプリに同梱する自作のハート（GitHub のロゴは使わない）
const SPONSORS_ICON =
  '<svg viewBox="0 0 24 24" width="18" height="18" aria-hidden="true"><path fill="currentColor" d="M12 21s-7.5-4.6-9.6-9.3C1 8.4 3 5 6.4 5c2 0 3.4 1 4.1 2.3h3C14.2 6 15.6 5 17.6 5 21 5 23 8.4 21.6 11.7 19.5 16.4 12 21 12 21z"/></svg>';
// OFUSE は公式アイコン（OFUSE KIT、© 株式会社Sozi）をそのまま同梱して使う。改変禁止・MIT の対象外（assets/ofuse/NOTICE.md）
const OFUSE_ICON_URL = new URL('./assets/ofuse/icon-blue.svg', import.meta.url).href;

/** ボタンを container に並べる。出すものがなければ container を隠す */
export function renderDonate(container: HTMLElement, links: DonateLink[]): void {
  container.replaceChildren();
  container.hidden = links.length === 0;
  for (const l of links) {
    const a = document.createElement('a');
    a.className = `donate-button donate-${l.service}`;
    a.href = l.url;
    a.target = '_blank';
    a.rel = 'noopener noreferrer';
    if (l.service === 'ofuse') {
      // 縦横比を保ったまま大きさだけを合わせる（公式素材の決まり）
      const img = document.createElement('img');
      img.src = OFUSE_ICON_URL;
      img.alt = '';
      img.className = 'donate-icon';
      a.append(img);
    } else {
      a.innerHTML = SPONSORS_ICON;
    }
    const label = document.createElement('span');
    label.textContent = l.label;
    a.append(label);
    container.append(a);
  }
}
