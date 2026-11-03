// 対応地域の一覧から探す：都道府県ごとに畳んだ一覧と、LOD2・LOD3 での絞り込み。
// 自治体名・都道府県名は日本語の原文のまま出す（英語の画面でも同じ）。
import listJson from './city-list.json';
import { groupByPref, type CityEntry, type CityList, type Lod3Place, type LodFilter } from './city-list.js';
import { t } from './i18n/index.js';

export const CITY_LIST = listJson as CityList;

export interface CityListHandlers {
  /** 自治体を選んだ（その場所を住所の検索で調べる） */
  onCity: (city: CityEntry) => void;
  /** LOD3 のある場所（約1km 四方）を選んだ */
  onLod3Place: (city: CityEntry, place: Lod3Place, index: number) => void;
}

export class CityListView {
  private filter: LodFilter = 'all';
  /** 開いている都道府県（絞り込み・言語の切り替えで描き直しても、開いたままにする） */
  private open = new Set<string>();

  constructor(
    private summaryEl: HTMLElement,
    private countEl: HTMLElement,
    private sourceEl: HTMLElement,
    private groupsEl: HTMLElement,
    filterInputs: NodeListOf<HTMLInputElement>,
    private handlers: CityListHandlers,
  ) {
    for (const input of filterInputs) {
      input.addEventListener('change', () => {
        if (!input.checked) return;
        this.filter = input.value as LodFilter;
        this.render();
      });
    }
  }

  render(): void {
    this.summaryEl.textContent = t('cities.summary', { n: CITY_LIST.cityCount });
    const groups = groupByPref(CITY_LIST.cities, this.filter);
    const shown = groups.reduce((s, g) => s + g.cities.length, 0);
    this.countEl.textContent = t('cities.count', { n: shown, prefs: groups.length });
    this.sourceEl.textContent = t('cities.source', { date: CITY_LIST.createdAt.slice(0, 10) });
    this.groupsEl.replaceChildren();
    for (const g of groups) {
      const d = document.createElement('details');
      d.className = 'pref';
      d.open = this.open.has(g.prefCode);
      d.addEventListener('toggle', () => (d.open ? this.open.add(g.prefCode) : this.open.delete(g.prefCode)));
      const s = document.createElement('summary');
      s.textContent = t('cities.pref', { pref: g.pref, n: g.cities.length });
      const ul = document.createElement('ul');
      ul.className = 'city-items';
      for (const c of g.cities) ul.appendChild(this.cityItem(c));
      d.append(s, ul);
      this.groupsEl.appendChild(d);
    }
  }

  private cityItem(c: CityEntry): HTMLLIElement {
    const li = document.createElement('li');
    const b = document.createElement('button');
    b.type = 'button';
    b.className = 'city';
    const name = document.createElement('span');
    name.textContent = c.name;
    b.appendChild(name);
    if (c.lod2) b.appendChild(badge('LOD2', t('cities.badge.lod2')));
    if (c.lod3) b.appendChild(badge('LOD3', t('cities.badge.lod3')));
    b.addEventListener('click', () => this.handlers.onCity(c));
    li.appendChild(b);
    // LOD3 の場所は、LOD3 で絞り込んだときだけ出す（一覧を長くしないため）
    if (this.filter === 'lod3') {
      const places = c.lod3Places ?? [];
      const sub = document.createElement('ul');
      sub.className = 'lod3-places';
      places.forEach((p, i) => {
        const pli = document.createElement('li');
        const pb = document.createElement('button');
        pb.type = 'button';
        pb.textContent = t('cities.lod3Place', { i: i + 1, mb: Math.max(1, p.mb) });
        pb.addEventListener('click', () => this.handlers.onLod3Place(c, p, i));
        pli.appendChild(pb);
        sub.appendChild(pli);
      });
      if (places.length === 0) {
        const note = document.createElement('li');
        note.className = 'hint';
        note.textContent = t('cities.lod3None');
        sub.appendChild(note);
      }
      li.appendChild(sub);
    }
    return li;
  }
}

function badge(text: string, title: string): HTMLSpanElement {
  const s = document.createElement('span');
  s.className = `lod-badge ${text.toLowerCase()}`;
  s.textContent = text;
  s.title = title;
  return s;
}
