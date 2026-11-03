// シチュエーション検索の根拠の数値を、画面の言語の文にする。
import type { Evidence, Metric } from '../core/situation.js';
import { t, type Lang, type MessageKey } from './i18n/index.js';

const LABEL: Record<Metric, MessageKey> = {
  density: 'evidence.density',
  avgHeight: 'evidence.avgHeight',
  tall31: 'evidence.tall31',
  tall60: 'evidence.tall60',
  old: 'evidence.old',
  new: 'evidence.new',
  wooden: 'evidence.wooden',
  residential: 'evidence.residential',
};

const WHAT: Record<Evidence['basis'], MessageKey> = {
  all: 'evidence.what.height',
  height: 'evidence.what.height',
  year: 'evidence.what.year',
  structure: 'evidence.what.structure',
  usage: 'evidence.what.usage',
};

const SHARE: Record<Exclude<Evidence['basis'], 'all'>, MessageKey> = {
  height: 'evidence.share.height',
  year: 'evidence.share.year',
  structure: 'evidence.share.structure',
  usage: 'evidence.share.usage',
};

export function evidenceText(e: Evidence, l?: Lang): { label: string; value: string } {
  const label = t(LABEL[e.metric], {}, l);
  if (!e.known) return { label, value: t('evidence.noData', { what: t(WHAT[e.basis], {}, l) }, l) };
  if (e.metric === 'density') {
    return { label, value: t('evidence.density.value', { density: e.value!.toFixed(1), n: e.n, ha: e.areaHa!.toFixed(1) }, l) };
  }
  if (e.metric === 'avgHeight') return { label, value: t('evidence.avgHeight.value', { height: e.value!.toFixed(1), known: e.of }, l) };
  if (e.metric === 'tall60') return { label, value: t('evidence.tall60.value', { n: e.n, known: e.of, pct: e.pct }, l) };
  return { label, value: t(SHARE[e.basis as keyof typeof SHARE], { pct: e.pct, n: e.n, known: e.of }, l) };
}
