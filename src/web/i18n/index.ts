// 画面の言語（日本語・英語）の切り替え。
// 最初はブラウザの言語に合わせ、選んだものを覚える（覚えられない環境では毎回ブラウザの言語）。
import { en } from './en.js';
import { ja, type MessageKey } from './ja.js';

export type Lang = 'ja' | 'en';
export type { MessageKey };

const DICTS: Record<Lang, Record<MessageKey, string>> = { ja, en };
const STORAGE_KEY = 'plateautoglb.lang';

/** 覚えている言語、なければブラウザの言語（日本語以外は英語） */
export function initialLang(stored: string | null, browserLangs: readonly string[]): Lang {
  if (stored === 'ja' || stored === 'en') return stored;
  return browserLangs.some((l) => l.toLowerCase().startsWith('ja')) ? 'ja' : 'en';
}

function readStored(): string | null {
  try {
    return localStorage.getItem(STORAGE_KEY);
  } catch {
    return null;
  }
}

let current: Lang =
  typeof navigator === 'undefined' ? 'ja' : initialLang(readStored(), navigator.languages ?? [navigator.language]);

export const lang = (): Lang => current;

/** 文言を取り出し、{name} に値を差し込む */
export function t(key: MessageKey, params: Record<string, string | number> = {}, l: Lang = current): string {
  return DICTS[l][key].replace(/\{(\w+)\}/g, (m, name: string) => (name in params ? String(params[name]) : m));
}

const listeners: (() => void)[] = [];
/** 言語が変わったときに文言を作り直す処理を登録する */
export function onLangChange(fn: () => void): void {
  listeners.push(fn);
}

export function setLang(l: Lang): void {
  current = l;
  try {
    localStorage.setItem(STORAGE_KEY, l);
  } catch {
    /* 覚えられない環境 */
  }
  applyStatic(document);
  for (const fn of listeners) fn();
}

/**
 * HTML に書いた文言を、選んだ言語にする。
 * data-i18n="キー"：中身の文字。data-i18n-n="値"：{n} に差し込む値。
 * data-i18n-attr="属性:キー;属性:キー"：属性（placeholder・aria-label など）。
 */
export function applyStatic(root: ParentNode): void {
  if (root instanceof Document) root.documentElement.lang = current;
  for (const el of root.querySelectorAll<HTMLElement>('[data-i18n]')) {
    const n = el.dataset.i18nN;
    el.textContent = t(el.dataset.i18n as MessageKey, n === undefined ? {} : { n });
  }
  for (const el of root.querySelectorAll<HTMLElement>('[data-i18n-attr]')) {
    for (const pair of el.dataset.i18nAttr!.split(';')) {
      const [attr, key] = pair.split(':');
      if (attr && key) el.setAttribute(attr.trim(), t(key.trim() as MessageKey));
    }
  }
}
