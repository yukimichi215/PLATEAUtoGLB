/// <reference lib="webworker" />
// 重い処理（データの取得・読み取り・GLB 作成）を画面とは別の場所で動かし、画面が固まらないようにする。
import type { SourceFile } from '../core/catalog.js';
import {
  defaultFetchJson,
  generateFromPlan,
  planArea,
  responseText,
  type AreaPlan,
  type AreaRequest,
  type OpenText,
} from '../core/pipeline.js';

export type WorkerRequest =
  | { type: 'plan'; req: AreaRequest }
  | { type: 'generate'; plan: AreaPlan }
  | { type: 'clearCache' };

export type WorkerResponse =
  | { type: 'plan'; plan: AreaPlan; cachedUrls: string[] }
  | { type: 'progress'; ratio: number; message: string }
  | {
      type: 'done';
      glb: ArrayBuffer;
      credit: string;
      fileName: string;
      stats: Awaited<ReturnType<typeof generateFromPlan>>['stats'];
    }
  | { type: 'cacheCleared' }
  | { type: 'error'; message: string };

const CACHE_NAME = 'plateau-citygml-v1';
const ctx = self as unknown as DedicatedWorkerGlobalScope;

function post(msg: WorkerResponse, transfer: Transferable[] = []): void {
  ctx.postMessage(msg, transfer);
}

async function openCache(): Promise<Cache | null> {
  try {
    return await caches.open(CACHE_NAME);
  } catch {
    return null; // 保存できない環境（プライベートブラウズなど）では毎回取得する
  }
}

/** 一度取ったデータはブラウザに保存して使い回す。なければ取得しながら保存する */
const openText: OpenText = async (file: SourceFile, onBytes) => {
  const cache = await openCache();
  const cached = await cache?.match(file.url);
  if (cached) return responseText(cached, onBytes);

  const res = await fetch(file.url);
  if (!res.ok || !res.body) {
    throw new Error(`データの取得に失敗しました（${res.status}）。時間をおいてもう一度試してください。`);
  }
  if (!cache) return responseText(res, onBytes);
  const [forParse, forCache] = res.body.tee();
  const headers = new Headers({ 'content-type': 'application/xml' });
  // 保存は裏で進める（失敗しても作成は続ける）
  void cache.put(file.url, new Response(forCache, { headers })).catch(() => {});
  return responseText(new Response(forParse), onBytes);
};

ctx.onmessage = async (ev: MessageEvent<WorkerRequest>) => {
  const msg = ev.data;
  try {
    if (msg.type === 'plan') {
      const plan = await planArea(msg.req, defaultFetchJson);
      const cache = await openCache();
      const cachedUrls: string[] = [];
      for (const f of plan.files) if (await cache?.match(f.url)) cachedUrls.push(f.url);
      post({ type: 'plan', plan, cachedUrls });
    } else if (msg.type === 'generate') {
      const result = await generateFromPlan(msg.plan, openText, (p) =>
        post({ type: 'progress', ratio: p.ratio, message: p.message }),
      );
      const glb = result.glb.slice().buffer as ArrayBuffer;
      post({ type: 'done', glb, credit: result.credit, fileName: result.fileName, stats: result.stats }, [glb]);
    } else if (msg.type === 'clearCache') {
      try {
        await caches.delete(CACHE_NAME);
      } catch {
        /* 保存がない環境 */
      }
      post({ type: 'cacheCleared' });
    }
  } catch (e) {
    post({ type: 'error', message: e instanceof Error ? e.message : String(e) });
  }
};
