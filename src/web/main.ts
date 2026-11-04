// 画面の操作。重い処理は worker.ts に任せる。
import { areaOfPolygon, MAX_SIZE, meshCodesForArea } from '../core/area.js';
import { fetchCatalogJson } from '../core/catalog.js';
import { CoverageIndex, type AreaCoverage } from '../core/coverage.js';
import type { LatLonBox } from '../core/geo.js';
import { isLatLonTitle, searchPlace, type Place } from '../core/geocode.js';
import type { AreaPlan, AreaRequest, DownloadKind, GenerateStats } from '../core/pipeline.js';
import type { PrintOptions } from '../core/print.js';
import { AreaMap, type AreaMode, type DrawState } from './area-map.js';
import { situationEvidence, SITUATIONS, type Situation, type Text } from '../core/situation.js';
import { Preview, type ViewName } from './preview.js';
import { CityListView } from './city-list-view.js';
import { pickable, setPicked } from './pick.js';
import type { CityEntry } from './city-list.js';
import { evidenceText } from './evidence-text.js';
import { applyStatic, lang, onLangChange, setLang, t, type Lang } from './i18n/index.js';
import { translateCore } from './i18n/core-messages.js';
import { DONATE_CONFIG } from './donate-config.js';
import { donateLinks, renderDonate } from './donate.js';
import type { WorkerRequest, WorkerResponse } from './worker.js';

const $ = <T extends HTMLElement>(id: string) => document.getElementById(id) as T;

const searchForm = $<HTMLFormElement>('search-form');
const searchInput = $<HTMLInputElement>('search-input');
const searchBtn = $<HTMLButtonElement>('search-btn');
const candidatesEl = $<HTMLUListElement>('candidates');
const placeEl = $<HTMLParagraphElement>('place');
const sizeEl = $<HTMLSelectElement>('size');
const heightScaleEl = $<HTMLSelectElement>('height-scale');
const roadsEl = $<HTMLInputElement>('roads');
const printOptionsEl = $<HTMLDivElement>('print-options');
const printHintEl = $<HTMLParagraphElement>('print-hint');
const printMoreEl = $<HTMLDetailsElement>('print-more');
const scaleEl = $<HTMLSelectElement>('scale');
const fitLabel = $<HTMLLabelElement>('fit-label');
const fitMmEl = $<HTMLInputElement>('fit-mm');
const baseMmEl = $<HTMLInputElement>('base-mm');
const minMmEl = $<HTMLInputElement>('min-mm');
const overhangHint = $<HTMLSpanElement>('overhang-hint');
const groundEl = $<HTMLInputElement>('ground');
const modelOptionsEl = $<HTMLDivElement>('model-options');
const separateEl = $<HTMLInputElement>('separate');
const makeBtn = $<HTMLButtonElement>('make-btn');
const progressEl = $<HTMLDivElement>('progress');
const progressFill = $<HTMLDivElement>('progress-fill');
const progressText = $<HTMLParagraphElement>('progress-text');
const messageEl = $<HTMLParagraphElement>('message');
const resultEl = $<HTMLElement>('result');
const statsEl = $<HTMLDListElement>('stats');
const creditEl = $<HTMLPreElement>('credit');
/** 保存のボタン（形式ごと） */
const DOWNLOAD_KINDS: DownloadKind[] = ['glb', 'obj', 'stl', 'all', 'credit'];
const dlLinks = Object.fromEntries(
  DOWNLOAD_KINDS.map((k) => [k, $<HTMLAnchorElement>(`dl-${k}`)]),
) as Record<DownloadKind, HTMLAnchorElement>;
const clearCacheBtn = $<HTMLButtonElement>('clear-cache');
const sizeLabel = $<HTMLLabelElement>('size-label');
const sizeLabelText = $<HTMLSpanElement>('size-label-text');
const sizeHLabel = $<HTMLLabelElement>('size-h-label');
const sizeHEl = $<HTMLSelectElement>('size-h');
const mapWrap = $<HTMLDivElement>('map-wrap');
const mapNeedPlace = $<HTMLParagraphElement>('map-need-place');
const mapTools = $<HTMLDivElement>('map-tools');
const mapUndo = $<HTMLButtonElement>('map-undo');
const mapFinish = $<HTMLButtonElement>('map-finish');
const mapHint = $<HTMLParagraphElement>('map-hint');
const coverageNote = $<HTMLParagraphElement>('coverage-note');
const mapLegend = $<HTMLSpanElement>('map-legend');
const situationSelect = $<HTMLSelectElement>('situation-select');
const situationNote = $<HTMLParagraphElement>('situation-note');
const situationPlaces = $<HTMLUListElement>('situation-places');
const evidenceEl = $<HTMLDivElement>('situation-evidence');
const evidenceTitle = $<HTMLHeadingElement>('situation-evidence-title');
const evidenceNote = $<HTMLParagraphElement>('situation-evidence-note');
const evidenceList = $<HTMLDListElement>('situation-evidence-list');
const langSelect = $<HTMLSelectElement>('lang-select');

/** 取得量がこれを超えるときは、作る前に確認する（MB） */
const CONFIRM_MB = 300;

let selected: Place | null = null;
/** シチュエーションの候補から選んだときの、そのシチュエーション（住所の検索で選んだときはなし） */
let selectedSituation: Situation | null = null;
/** シチュエーションの候補の名前（言語ごと） */
let selectedName: Text | null = null;
/** 地図で正方形・四角を動かして、選んだ場所から中心がずれたか */
let movedFrom = false;
/** 緯度・経度で探した場所か（動かしたあとも、名前の代わりに緯度・経度だけを出すため） */
let selectedIsLatLon = false;
/** できあがりの表示に使ったもの（言語を変えたときに出し直す） */
let lastResult: { stats: GenerateStats; request: AreaRequest; situation: Situation | null } | null = null;
let busy = false;
let preview: Preview | null = null;
/** 範囲を選ぶ地図（場所を選んだときに作る。それまでは地図のタイルを読み込まない） */
let areaMap: AreaMap | null = null;
let draw: DrawState = { mode: 'square', drawingPoints: 0 };
const objectUrls: string[] = [];

const worker = new Worker(new URL('./worker.ts', import.meta.url), { type: 'module' });

function call(msg: WorkerRequest, onProgress?: (r: number, m: string) => void): Promise<WorkerResponse> {
  return new Promise((resolve, reject) => {
    const handler = (ev: MessageEvent<WorkerResponse>) => {
      const res = ev.data;
      if (res.type === 'progress') {
        onProgress?.(res.ratio, res.message);
        return;
      }
      worker.removeEventListener('message', handler);
      if (res.type === 'error') reject(new Error(res.message));
      else resolve(res);
    };
    worker.addEventListener('message', handler);
    worker.postMessage(msg);
  });
}

/** 中身の処理（日本語）の文を、画面の言語にする */
const coreText = (text: string) => (lang() === 'en' ? translateCore(text) : text);

function showMessage(text: string, isError = false): void {
  messageEl.textContent = coreText(text);
  messageEl.classList.toggle('error', isError);
}

/** 作れる状態か（場所を選んでいて、地図で囲むときは問題なく囲み終えている） */
function canMake(): boolean {
  if (!selected) return false;
  if (draw.mode === 'square') return true;
  return draw.polygon !== undefined && draw.issue === undefined;
}

function setBusy(b: boolean): void {
  busy = b;
  makeBtn.disabled = b || !canMake();
  searchBtn.disabled = b;
}

function mb(bytes: number): string {
  return bytes >= 1e6 ? `${(bytes / 1e6).toFixed(1)} MB` : `${Math.max(1, Math.round(bytes / 1e3))} KB`;
}

function selectPlace(p: Place, situation: Situation | null = null, name: Text | null = null): void {
  selected = p;
  movedFrom = false;
  selectedIsLatLon = isLatLonTitle(p);
  selectedSituation = situation;
  selectedName = name;
  candidatesEl.hidden = true;
  placeEl.hidden = false;
  renderPlace();
  mapWrap.hidden = false;
  mapNeedPlace.hidden = true;
  if (!areaMap) {
    areaMap = new AreaMap($('map'), onDrawChange, t('map.attribution'));
    areaMap.onViewChange(showCoverageOnMap);
    areaMap.onCenterChange(moveSelected);
    areaMap.setRectSize(Number(sizeEl.value), Number(sizeHEl.value));
  }
  areaMap.setMode(currentAreaMode());
  areaMap.show({ lat: p.lat, lon: p.lon }, Number(sizeEl.value));
  setBusy(busy);
  showMessage('');
  void checkCoverage();
}

/** 地図で正方形・四角を動かしたとき：選んだ場所（中心）をその位置にする */
function moveSelected(c: { lat: number; lon: number }): void {
  if (!selected) return;
  selected = { ...selected, lat: c.lat, lon: c.lon };
  movedFrom = true;
  renderPlace();
  void checkCoverage();
}

/** 選んだ場所の表示（シチュエーションの候補なら、その言語の名前） */
function renderPlace(): void {
  if (!selected) return;
  const lat = selected.lat.toFixed(5);
  const lon = selected.lon.toFixed(5);
  // 緯度・経度で探したときは、名前も緯度・経度なので2回出さない
  if (!selectedName && selectedIsLatLon) {
    placeEl.textContent = t('place.selectedLatLon', { lat, lon });
    return;
  }
  const title = selectedName ? selectedName[lang()] : coreText(selected.title);
  // 地図で動かしたあとは、名前の場所そのものではないので「の近く」と出す
  placeEl.textContent = t(movedFrom ? 'place.moved' : 'place.selected', { title, lat, lon });
}

const currentAreaMode = () =>
  (document.querySelector<HTMLInputElement>('input[name="area"]:checked')?.value ?? 'square') as AreaMode;

/** 地図で描いた範囲が変わったとき：説明・ボタン・印刷の大きさの目安を更新する */
function onDrawChange(s: DrawState): void {
  draw = s;
  sizeLabel.hidden = s.mode === 'polygon';
  sizeHLabel.hidden = s.mode !== 'rect';
  // 四角のときは、1つ目の選択を「横の長さ」として使う
  sizeLabelText.dataset.i18n = s.mode === 'rect' ? 'size.width' : 'size.label';
  sizeLabelText.textContent = t(s.mode === 'rect' ? 'size.width' : 'size.label');
  mapTools.hidden = s.mode !== 'polygon';
  mapUndo.hidden = s.mode !== 'polygon';
  mapFinish.hidden = s.mode !== 'polygon';
  mapUndo.disabled = s.drawingPoints === 0;
  mapFinish.disabled = s.drawingPoints < 3;
  renderMapHint();
  setBusy(busy);
  updatePrintUi();
  if (s.polygon || s.mode === 'square') void checkCoverage();
}

function renderMapHint(): void {
  mapHint.classList.toggle('error', draw.issue !== undefined);
  mapHint.textContent = drawHint(draw);
}

function drawHint(s: DrawState): string {
  if (s.issue === 'tooSmall') return t('map.hint.tooSmall');
  if (s.issue === 'crossing') return t('map.hint.crossing');
  if (s.issue === 'tooLarge') return t('map.hint.tooLarge', { max: MAX_SIZE, size: s.size ?? 0 });
  if (s.mode === 'rect') return t('map.hint.rect');
  if (s.polygon) return t('map.hint.done', { size: s.size ?? 0, n: s.polygon.length });
  if (s.mode === 'polygon') {
    if (s.drawingPoints === 0) return t('map.hint.polygonStart');
    return s.drawingPoints === 1 ? t('map.hint.polygonStart') : t('map.hint.polygonMore', { n: s.drawingPoints, size: s.size ?? 0 });
  }
  return t('map.hint.square');
}

for (const el of document.querySelectorAll<HTMLInputElement>('input[name="area"]')) {
  el.addEventListener('change', () => {
    if (areaMap) areaMap.setMode(currentAreaMode());
    else onDrawChange({ mode: currentAreaMode(), drawingPoints: 0 });
  });
}
mapUndo.addEventListener('click', () => areaMap?.undoPoint());
mapFinish.addEventListener('click', () => areaMap?.finishPolygon());
$<HTMLButtonElement>('map-clear').addEventListener('click', () => areaMap?.clearDrawing());
sizeEl.addEventListener('change', () => {
  areaMap?.setSize(Number(sizeEl.value));
  areaMap?.setRectSize(Number(sizeEl.value), Number(sizeHEl.value));
  void checkCoverage();
});
sizeHEl.addEventListener('change', () => {
  areaMap?.setRectSize(Number(sizeEl.value), Number(sizeHEl.value));
  updatePrintUi();
});

// PLATEAU の建物データがある場所か（データカタログ API。約10km 四方ごとに1回だけ問い合わせて覚える）
const coverage = new CoverageIndex(fetchCatalogJson);
type CoverageState = { kind: 'checking' } | { kind: 'failed' } | { kind: 'done'; result: AreaCoverage };
let coverageState: CoverageState | null = null;
let coverageToken = 0;
/** 地図の枠：null は「広く表示しているので出さない」 */
let legendZoomedOut = false;

/** 今の切り出す範囲に重なる3次メッシュ（作るときと同じ数え方。正方形か、囲み終えた形） */
function currentAreaMeshes(): string[] | null {
  if (!selected) return null;
  if (draw.mode === 'square') return meshCodesForArea({ center: selected, size: Number(sizeEl.value) });
  return draw.polygon && !draw.issue ? meshCodesForArea({ center: selected, size: 0, polygon: draw.polygon }) : null;
}

async function checkCoverage(): Promise<void> {
  const meshes = currentAreaMeshes();
  const token = ++coverageToken;
  if (!meshes) {
    coverageState = null;
    renderCoverage();
    return;
  }
  coverageState = { kind: 'checking' };
  renderCoverage();
  try {
    const result = await coverage.areaCoverage(meshes);
    if (token !== coverageToken) return;
    coverageState = { kind: 'done', result };
  } catch {
    if (token !== coverageToken) return;
    coverageState = { kind: 'failed' };
  }
  renderCoverage();
}

function renderCoverage(): void {
  const s = coverageState;
  let text = '';
  let error = false;
  if (s?.kind === 'checking') text = t('coverage.checking');
  else if (s?.kind === 'failed') text = t('coverage.failed');
  else if (s?.kind === 'done' && s.result.covered === 0) {
    text = t('coverage.none');
    error = true;
  } else if (s?.kind === 'done' && s.result.covered < s.result.total) {
    text = t('coverage.partial', { covered: s.result.covered, total: s.result.total });
  }
  coverageNote.textContent = text;
  coverageNote.hidden = text === '';
  coverageNote.classList.toggle('error', error);
  mapLegend.textContent = t(legendZoomedOut ? 'map.legend.zoomOut' : 'map.legend');
}

/** 地図に見えている範囲の、データのある所の枠を出す（広く表示しすぎているときは出さない） */
async function showCoverageOnMap(view: LatLonBox): Promise<void> {
  try {
    const cells = await coverage.cells(view);
    legendZoomedOut = cells === null;
    // 地図が動くたびに呼ばれる。問い合わせた結果は覚えているので、2回目からはすぐ出る
    areaMap?.setCoverage(cells);
  } catch {
    areaMap?.setCoverage(null);
  }
  renderCoverage();
}

async function fetchJson(url: string): Promise<unknown> {
  const res = await fetch(url);
  if (!res.ok) throw new Error(t('search.failedStatus', { status: res.status }));
  return res.json();
}

searchForm.addEventListener('submit', async (ev) => {
  ev.preventDefault();
  setBusy(true);
  showMessage(t('search.searching'));
  candidatesEl.replaceChildren();
  try {
    const places = await searchPlace(searchInput.value, fetchJson);
    if (places.length === 0) {
      showMessage(t('search.notFound'), true);
    } else if (places.length === 1) {
      setPicked(null);
      selectPlace(places[0]!);
    } else {
      showMessage(t('search.choose'));
      setPicked(null);
      for (const p of places) {
        const li = document.createElement('li');
        const b = document.createElement('button');
        b.type = 'button';
        b.textContent = coreText(p.title);
        pickable(b, `search:${places.indexOf(p)}`);
        b.addEventListener('click', () => {
          setPicked(`search:${places.indexOf(p)}`);
          selectPlace(p);
        });
        li.appendChild(b);
        candidatesEl.appendChild(li);
      }
      candidatesEl.hidden = false;
    }
  } catch (e) {
    showMessage(t('search.failed', { error: e instanceof Error ? e.message : String(e) }), true);
  } finally {
    setBusy(false);
  }
});

// シチュエーションから探す：条件を選ぶと、向いた地域の候補（手で選んだ見本）を出す
function renderSituationSelect(): void {
  const value = situationSelect.value;
  situationSelect.replaceChildren();
  const none = document.createElement('option');
  none.value = '';
  none.textContent = t('situation.choose');
  situationSelect.append(none);
  for (const kind of ['station', 'town'] as const) {
    const group = document.createElement('optgroup');
    group.label = t(kind === 'station' ? 'situation.group.station' : 'situation.group.town');
    for (const s of SITUATIONS.filter((x) => x.kind === kind)) {
      const o = document.createElement('option');
      o.value = s.id;
      o.textContent = s.label[lang()];
      group.append(o);
    }
    situationSelect.append(group);
  }
  situationSelect.value = value;
  renderSituationPlaces();
}

function renderSituationPlaces(): void {
  const s = SITUATIONS.find((x) => x.id === situationSelect.value);
  situationPlaces.replaceChildren();
  situationNote.textContent = s ? t('situation.note', { approximation: s.approximation[lang()] }) : '';
  if (!s) return;
  s.places.forEach((p, i) => {
    const li = document.createElement('li');
    const b = document.createElement('button');
    b.type = 'button';
    b.textContent = t('situation.place', { name: p.name[lang()], note: p.note[lang()] });
    const key = `situation:${s.id}:${i}`;
    pickable(b, key);
    b.addEventListener('click', () => {
      setPicked(key);
      selectPlace({ lat: p.lat, lon: p.lon, title: p.name.ja }, s, p.name);
    });
    li.appendChild(b);
    situationPlaces.appendChild(li);
  });
}
situationSelect.addEventListener('change', renderSituationPlaces);

// 対応地域の一覧から探す：自治体は住所の検索で場所を調べ、LOD3 の場所はその区画の中心を選ぶ
async function selectCity(c: CityEntry): Promise<void> {
  const full = `${c.pref}${c.name}`;
  setBusy(true);
  showMessage(t('cities.searching', { city: full }));
  try {
    const places = await searchPlace(full, fetchJson);
    if (places.length === 0) showMessage(t('search.notFound'), true);
    else selectPlace(places[0]!, null, { ja: full, en: full });
  } catch (e) {
    showMessage(t('search.failed', { error: e instanceof Error ? e.message : String(e) }), true);
  } finally {
    setBusy(false);
  }
}

const cityListView = new CityListView(
  $('city-list-summary'),
  $('city-count'),
  $('city-source'),
  $('city-groups'),
  document.querySelectorAll<HTMLInputElement>('input[name="lod-filter"]'),
  {
    onCity: (c) => void selectCity(c),
    onLod3Place: (c, p, i) => {
      const title = (l: Lang) => t('cities.lod3Title', { city: `${c.pref}${c.name}`, i: i + 1 }, l);
      selectPlace({ lat: p.lat, lon: p.lon, title: title('ja') }, null, { ja: title('ja'), en: title('en') });
      // LOD3 を選んだので、建物の細かさも「窓・扉まで」にする（変えたことは知らせる）
      const lod3 = document.querySelector<HTMLInputElement>('input[name="detail"][value="lod3"]');
      if (lod3 && !lod3.checked) {
        lod3.checked = true;
        lod3.dispatchEvent(new Event('change', { bubbles: true }));
      }
      showMessage(t('cities.lod3Selected'));
    },
  },
);

/** できあがりに、選んだシチュエーションの根拠の数値を出す */
function showEvidence(situation: Situation | null, character: GenerateStats['character']): void {
  evidenceEl.hidden = situation === null;
  evidenceList.replaceChildren();
  if (!situation) return;
  evidenceTitle.textContent = t('evidence.title', { label: situation.label[lang()] });
  evidenceNote.textContent = t('evidence.note', { approximation: situation.approximation[lang()] });
  for (const e of situationEvidence(situation, character)) {
    const { label, value } = evidenceText(e);
    const dt = document.createElement('dt');
    dt.textContent = label;
    const dd = document.createElement('dd');
    dd.textContent = value;
    evidenceList.append(dt, dd);
  }
}

const isPrint = () => document.querySelector<HTMLInputElement>('input[name="use"]:checked')?.value === 'print';

function currentPrint(): PrintOptions | undefined {
  if (!isPrint()) return undefined;
  const baseMm = Number(baseMmEl.value);
  const minFeatureMm = Number(minMmEl.value);
  return scaleEl.value === 'fit'
    ? { fitSideMm: Number(fitMmEl.value), baseMm, minFeatureMm }
    : { scaleDenominator: Number(scaleEl.value), baseMm, minFeatureMm };
}

/** 3Dプリンタ用の設定の表示と、印刷したときの大きさの目安 */
function updatePrintUi(): void {
  const print = isPrint();
  printOptionsEl.hidden = !print;
  printHintEl.hidden = !print;
  printMoreEl.hidden = !print;
  fitLabel.hidden = scaleEl.value !== 'fit';
  // 3Dプリンタ用では台座が地面の代わりになり、範囲からはみ出した部分は切り落とす
  groundEl.disabled = print;
  // 3Dプリンタ用は1つの立体にまとめるので、建物を分ける選択は出さない
  modelOptionsEl.hidden = print;
  // 3D プリンタ用では付属物・窓・扉は細かすぎて入れないので、屋根の形と同じになることを添える
  for (const el of document.querySelectorAll<HTMLElement>('.print-same')) el.hidden = !print;
  overhangHint.hidden = print;
  if (!print) return;
  const size = currentSize();
  const p = currentPrint()!;
  const side = p.fitSideMm ?? (size * 1000) / p.scaleDenominator!;
  const scale = p.fitSideMm ? t('print.hint.scale', { d: Math.round((size * 1000) / p.fitSideMm) }) : '';
  // 詳しい説明（print.hint.rest）は畳んだ「詳しく」に置く
  if (draw.mode === 'rect' && draw.polygon) {
    // 四角は横・縦をそのまま出す（size は長いほうの辺なので、その比で割り振る）
    const { width, height } = rectSize();
    printHintEl.textContent = t('print.hint.sizeRect', { w: ((side * width) / size).toFixed(0), h: ((side * height) / size).toFixed(0), scale });
    return;
  }
  const sizeKey = draw.mode !== 'square' && draw.polygon ? 'print.hint.sizeArea' : 'print.hint.size';
  printHintEl.textContent = t(sizeKey, { w: side.toFixed(0), scale });
}
for (const el of [...document.querySelectorAll('input[name="use"]'), scaleEl, fitMmEl, baseMmEl, sizeEl]) {
  el.addEventListener('input', updatePrintUi);
  el.addEventListener('change', updatePrintUi);
}
updatePrintUi();

/** 四角の横・縦の長さ（m） */
function rectSize(): { width: number; height: number } {
  return { width: Number(sizeEl.value), height: Number(sizeHEl.value) };
}

/** 切り出す正方形の一辺（地図で囲んだときは、囲んだ範囲がちょうど入る正方形） */
function currentSize(): number {
  return draw.mode !== 'square' && draw.size !== undefined ? draw.size : Number(sizeEl.value);
}

function currentRequest(): AreaRequest {
  const detail = document.querySelector<HTMLInputElement>('input[name="detail"]:checked')?.value ?? 'box';
  const area =
    draw.mode !== 'square' && draw.polygon
      ? { ...areaOfPolygon(draw.polygon), polygon: draw.polygon, ...(draw.mode === 'rect' ? { rect: rectSize() } : {}) }
      : { center: { lat: selected!.lat, lon: selected!.lon }, size: Number(sizeEl.value) };
  return {
    ...area,
    lod: detail === 'box' ? 1 : detail === 'lod3' ? 3 : 2,
    // 窓・扉まで（LOD3）にも付属物を入れる。LOD3 のない建物は「屋根の形＋付属物」で代わりに作るので、それより粗くならない
    installations: detail === 'roofPlus' || detail === 'lod3',
    includeRoads: roadsEl.checked,
    includeGround: groundEl.checked,
    placeName: selected!.title,
    print: currentPrint(),
    heightScale: Number(heightScaleEl.value),
    separateBuildings: separateEl.checked,
  };
}

function setProgress(ratio: number, text: string): void {
  progressEl.hidden = false;
  progressFill.style.width = `${Math.round(ratio * 100)}%`;
  progressText.textContent = coreText(text);
}

function addStat(label: string, value: string): void {
  const dt = document.createElement('dt');
  dt.textContent = label;
  const dd = document.createElement('dd');
  dd.textContent = value;
  statsEl.append(dt, dd);
}

/** できあがりの数値の表示（言語を変えたときも出し直す） */
function renderResultTexts(): void {
  if (!lastResult) return;
  const { stats: s, request, situation } = lastResult;
  const num = (n: number) => n.toLocaleString(lang() === 'en' ? 'en-US' : 'ja-JP');
  statsEl.replaceChildren();
  addStat(t('stats.buildings'), t('stats.count', { n: num(s.buildings) }));
  if (request.rect) addStat(t('stats.area'), t('stats.area.rect', { w: request.rect.width, h: request.rect.height }));
  else if (request.polygon) addStat(t('stats.area'), t('stats.area.value', { n: request.polygon.length, size: request.size }));
  if (request.separateBuildings && !s.print) addStat(t('stats.parts'), t('stats.parts.value', { n: num(s.buildings) }));
  if (request.installations) {
    addStat(
      t('stats.installations'),
      s.buildingsWithInstallations > 0 ? t('stats.count', { n: num(s.buildingsWithInstallations) }) : t('stats.installations.none'),
    );
  }
  // 選んだ細かさのデータがなく、粗い形で代わりに作った建物
  const fallback = ([3, 2, 1] as const).filter((l) => l < request.lod && s.lodUsed[l] > 0);
  if (fallback.length > 0) {
    const n = fallback.reduce((sum, l) => sum + s.lodUsed[l], 0);
    const list = fallback.map((l) => `${t(`stats.lod.${l}`)} ${num(s.lodUsed[l])}`).join(t('stats.listSep'));
    addStat(t('stats.fallback'), t('stats.fallback.value', { n: num(n), list }));
  }
  if (request.includeRoads) addStat(t('stats.roads'), t('stats.roads.value', { n: num(s.roads) }));
  addStat(t('stats.triangles'), num(s.triangles));
  addStat(t('stats.fileSize'), mb(s.glbBytes));
  if (request.heightScale && request.heightScale !== 1) addStat(t('stats.heightScale'), t('stats.heightScale.value', { n: request.heightScale }));
  if (s.print) {
    addStat(t('stats.scale'), coreText(s.print.scaleLabel));
    addStat(t('stats.printSize'), `${s.print.widthMm} × ${s.print.depthMm} × ${s.print.heightMm} mm`);
    addStat(t('stats.base'), s.print.baseMm > 0 ? `${s.print.baseMm} mm` : t('stats.base.none'));
    if (s.print.droppedFaces > 0) addStat(t('stats.dropped'), t('stats.dropped.value', { n: s.print.droppedFaces }));
    if (s.print.minFeatureMm > 0) {
      addStat(
        t('stats.removed', { mm: s.print.minFeatureMm }),
        t('stats.removed.value', { b: s.print.removedBuildings, r: s.print.removedRoads }),
      );
    }
  } else {
    addStat(t('stats.size'), `${s.width} × ${s.depth} × ${s.height} m`);
  }
  showEvidence(situation, s.character);
}

makeBtn.addEventListener('click', async () => {
  if (!canMake() || busy) return;
  setBusy(true);
  showMessage('');
  setProgress(0, t('make.checking'));
  // 作り始めたときの場所がシチュエーションの候補なら、できあがりに根拠の数値を出す
  const situationOfRequest = selectedSituation;
  try {
    const planRes = await call({ type: 'plan', req: currentRequest() });
    if (planRes.type !== 'plan') throw new Error(t('make.unexpected'));
    const plan: AreaPlan = planRes.plan;
    const toDownload = plan.files.filter((f) => !planRes.cachedUrls.includes(f.url));
    const dlBytes = toDownload.reduce((s, f) => s + f.fileSize, 0);
    if (plan.files.every((f) => f.type !== 'bldg')) {
      throw new Error(t('make.noData'));
    }
    const unknown = toDownload.filter((f) => !(f.fileSize > 0)).length;
    if (dlBytes > CONFIRM_MB * 1e6) {
      const ok = window.confirm(
        t('make.confirmLarge', { size: mb(dlBytes), unknown: unknown > 0 ? t('make.confirmUnknown', { n: unknown }) : '' }),
      );
      if (!ok) {
        progressEl.hidden = true;
        showMessage(t('make.aborted'));
        return;
      }
    }
    const res = await call({ type: 'generate', plan }, (r, m) => setProgress(r, m));
    if (res.type !== 'done') throw new Error(t('make.unexpected'));
    setProgress(1, t('make.done'));
    // 注意があれば、できあがりと一緒に目立つように出す
    if (res.stats.warnings.length > 0) showMessage(res.stats.warnings.join('\n'), true);

    // ダウンロード用のリンク
    for (const u of objectUrls.splice(0)) URL.revokeObjectURL(u);
    for (const kind of DOWNLOAD_KINDS) {
      const f = res.files[kind];
      const url = URL.createObjectURL(new Blob([f.data as BlobPart], { type: f.mime }));
      objectUrls.push(url);
      dlLinks[kind].href = url;
      dlLinks[kind].download = f.name;
    }
    creditEl.textContent = res.credit;

    lastResult = { stats: res.stats, request: plan.request, situation: situationOfRequest };
    renderResultTexts();
    resultEl.hidden = false;
    preview ??= new Preview($('preview'));
    await preview.show(res.glb, { print: res.stats.print !== undefined });
    resultEl.scrollIntoView({ behavior: 'smooth', block: 'start' });
  } catch (e) {
    showMessage(e instanceof Error ? e.message : String(e), true);
    progressEl.hidden = true;
  } finally {
    setBusy(false);
  }
});

// 寄付（応援）ボタン
const renderDonateButtons = () =>
  renderDonate($('donate'), donateLinks(DONATE_CONFIG, () => t('donate.ofuse')));

// プレビューの見る向き
for (const btn of document.querySelectorAll<HTMLButtonElement>('.view-buttons button')) {
  btn.addEventListener('click', () => preview?.setView(btn.dataset.view as ViewName));
}

clearCacheBtn.addEventListener('click', async () => {
  await call({ type: 'clearCache' });
  showMessage(t('cacheCleared'));
});

// 言語の切り替え（最初はブラウザの言語。選んだものを覚える）
function renderDynamicTexts(): void {
  renderSituationSelect();
  cityListView.render();
  renderPlace();
  renderMapHint();
  renderCoverage();
  areaMap?.setAttributionLabel(t('map.attribution'));
  updatePrintUi();
  renderDonateButtons();
  renderResultTexts();
  preview?.relabel();
  // 前の言語の知らせは消す（中身が古い言語のままになるため）
  showMessage('');
  if (progressEl.hidden === false && !busy) progressEl.hidden = true;
}
langSelect.value = lang();
langSelect.addEventListener('change', () => setLang(langSelect.value as Lang));
onLangChange(renderDynamicTexts);
applyStatic(document);
renderDynamicTexts();
