// 画面の操作。重い処理は worker.ts に任せる。
import { searchPlace, type Place } from '../core/geocode.js';
import type { AreaPlan, AreaRequest, DownloadFile, DownloadKind } from '../core/pipeline.js';
import { isDesktop, saveWithDialog } from './desktop.js';
import { Preview } from './preview.js';
import type { WorkerRequest, WorkerResponse } from './worker.js';

const $ = <T extends HTMLElement>(id: string) => document.getElementById(id) as T;

const searchForm = $<HTMLFormElement>('search-form');
const searchInput = $<HTMLInputElement>('search-input');
const searchBtn = $<HTMLButtonElement>('search-btn');
const candidatesEl = $<HTMLUListElement>('candidates');
const placeEl = $<HTMLParagraphElement>('place');
const sizeEl = $<HTMLSelectElement>('size');
const roadsEl = $<HTMLInputElement>('roads');
const groundEl = $<HTMLInputElement>('ground');
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

/** 取得量がこれを超えるときは、作る前に確認する（MB） */
const CONFIRM_MB = 300;

let selected: Place | null = null;
let busy = false;
let preview: Preview | null = null;
const objectUrls: string[] = [];
/** デスクトップ版で保存するための、できあがったファイルの中身 */
let lastFiles: Record<DownloadKind, DownloadFile> | null = null;

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

function showMessage(text: string, isError = false): void {
  messageEl.textContent = text;
  messageEl.classList.toggle('error', isError);
}

function setBusy(b: boolean): void {
  busy = b;
  makeBtn.disabled = b || !selected;
  searchBtn.disabled = b;
}

function mb(bytes: number): string {
  return bytes >= 1e6 ? `${(bytes / 1e6).toFixed(1)} MB` : `${Math.max(1, Math.round(bytes / 1e3))} KB`;
}

function selectPlace(p: Place): void {
  selected = p;
  candidatesEl.hidden = true;
  placeEl.hidden = false;
  placeEl.textContent = `選んだ場所：${p.title}（緯度 ${p.lat.toFixed(5)}・経度 ${p.lon.toFixed(5)}）`;
  makeBtn.disabled = busy;
  showMessage('');
}

async function fetchJson(url: string): Promise<unknown> {
  const res = await fetch(url);
  if (!res.ok) throw new Error(`検索に失敗しました（${res.status}）`);
  return res.json();
}

searchForm.addEventListener('submit', async (ev) => {
  ev.preventDefault();
  setBusy(true);
  showMessage('検索中…');
  candidatesEl.replaceChildren();
  try {
    const places = await searchPlace(searchInput.value, fetchJson);
    if (places.length === 0) {
      showMessage('見つかりませんでした。書き方を変えてみてください（例：「東京都千代田区丸の内1丁目」）。', true);
    } else if (places.length === 1) {
      selectPlace(places[0]!);
    } else {
      showMessage('候補から選んでください。');
      for (const p of places) {
        const li = document.createElement('li');
        const b = document.createElement('button');
        b.type = 'button';
        b.textContent = p.title;
        b.addEventListener('click', () => selectPlace(p));
        li.appendChild(b);
        candidatesEl.appendChild(li);
      }
      candidatesEl.hidden = false;
    }
  } catch (e) {
    showMessage(
      `住所の検索ができませんでした：${e instanceof Error ? e.message : e}\n「35.6812, 139.7671」のように緯度・経度で入れることもできます。`,
      true,
    );
  } finally {
    setBusy(false);
  }
});

function currentRequest(): AreaRequest {
  const detail = document.querySelector<HTMLInputElement>('input[name="detail"]:checked')?.value ?? 'box';
  return {
    center: { lat: selected!.lat, lon: selected!.lon },
    size: Number(sizeEl.value),
    lod: detail === 'box' ? 1 : 2,
    installations: detail === 'roofPlus',
    includeRoads: roadsEl.checked,
    includeGround: groundEl.checked,
    placeName: selected!.title,
  };
}

function setProgress(ratio: number, text: string): void {
  progressEl.hidden = false;
  progressFill.style.width = `${Math.round(ratio * 100)}%`;
  progressText.textContent = text;
}

function addStat(label: string, value: string): void {
  const dt = document.createElement('dt');
  dt.textContent = label;
  const dd = document.createElement('dd');
  dd.textContent = value;
  statsEl.append(dt, dd);
}

makeBtn.addEventListener('click', async () => {
  if (!selected || busy) return;
  setBusy(true);
  showMessage('');
  setProgress(0, 'この場所の PLATEAU データを調べています…');
  try {
    const planRes = await call({ type: 'plan', req: currentRequest() });
    if (planRes.type !== 'plan') throw new Error('予期しない応答');
    const plan: AreaPlan = planRes.plan;
    const toDownload = plan.files.filter((f) => !planRes.cachedUrls.includes(f.url));
    const dlBytes = toDownload.reduce((s, f) => s + f.fileSize, 0);
    if (plan.files.every((f) => f.type !== 'bldg')) {
      throw new Error('この場所には PLATEAU の建物データがありません（まだ整備されていない地域の可能性があります）。');
    }
    const unknown = toDownload.filter((f) => !(f.fileSize > 0)).length;
    if (dlBytes > CONFIRM_MB * 1e6) {
      const ok = window.confirm(
        `この場所のデータは約 ${mb(dlBytes)}${unknown > 0 ? `＋大きさ不明のファイル ${unknown} 件` : ''} あります（通信は圧縮されるので、実際の通信量はこの1〜2割程度です）。\n読み込みに時間がかかることがあります。続けますか？`,
      );
      if (!ok) {
        progressEl.hidden = true;
        showMessage('中止しました。');
        return;
      }
    }
    const res = await call({ type: 'generate', plan }, (r, m) => setProgress(r, m));
    if (res.type !== 'done') throw new Error('予期しない応答');
    setProgress(1, '完成しました');

    // ダウンロード用のリンク
    for (const u of objectUrls.splice(0)) URL.revokeObjectURL(u);
    for (const kind of DOWNLOAD_KINDS) {
      const f = res.files[kind];
      const url = URL.createObjectURL(new Blob([f.data as BlobPart], { type: f.mime }));
      objectUrls.push(url);
      dlLinks[kind].href = url;
      dlLinks[kind].download = f.name;
    }
    lastFiles = res.files;
    creditEl.textContent = res.credit;

    const s = res.stats;
    statsEl.replaceChildren();
    addStat('建物', `${s.buildings.toLocaleString()} 棟`);
    if (plan.request.installations) {
      addStat(
        'ベランダなどのある建物',
        s.buildingsWithInstallations > 0
          ? `${s.buildingsWithInstallations.toLocaleString()} 棟`
          : 'なし（この地域のデータには入っていません）',
      );
    }
    if (plan.request.includeRoads) addStat('道路', `${s.roads.toLocaleString()} 本`);
    addStat('三角形の数', s.triangles.toLocaleString());
    addStat('ファイルの大きさ', mb(s.glbBytes));
    addStat('外形（幅×奥行き×高さ）', `${s.width} × ${s.depth} × ${s.height} m`);
    resultEl.hidden = false;
    preview ??= new Preview($('preview'));
    await preview.show(res.glb);
    resultEl.scrollIntoView({ behavior: 'smooth', block: 'start' });
  } catch (e) {
    showMessage(e instanceof Error ? e.message : String(e), true);
    progressEl.hidden = true;
  } finally {
    setBusy(false);
  }
});

// デスクトップ版では、ダウンロードの代わりに「名前を付けて保存」の窓で保存する
for (const key of DOWNLOAD_KINDS) {
  dlLinks[key].addEventListener('click', async (ev) => {
    if (!isDesktop() || !lastFiles) return;
    ev.preventDefault();
    const f = lastFiles[key];
    try {
      const saved = await saveWithDialog(f.name, f.data);
      if (saved) showMessage(`${f.name} を保存しました。`);
    } catch (e) {
      showMessage(`保存できませんでした：${e instanceof Error ? e.message : String(e)}`, true);
    }
  });
}

clearCacheBtn.addEventListener('click', async () => {
  await call({ type: 'clearCache' });
  showMessage('保存していた PLATEAU データを消しました。');
});
