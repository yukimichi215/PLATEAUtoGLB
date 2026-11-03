// 3Dプリンタ用：建物の柱・道路の板・台座を、重なりやすき間のない1つの立体にまとめる（ブーリアンの和）。
// 計算は Manifold（manifold-3d。Apache-2.0）で行う。結果は必ず「閉じていて、どの辺もちょうど2つの面が共有する」形になる。
import Module, { type ManifoldToplevel } from 'manifold-3d';
import type { Solid } from './solid.js';

let wasmUrl: string | undefined;
let loading: Promise<ManifoldToplevel> | null = null;

/** 画面（ブラウザ）では、Vite が配る manifold.wasm の場所を先に教える。Node.js では不要 */
export function setManifoldWasmUrl(url: string): void {
  wasmUrl = url;
}

function manifold(): Promise<ManifoldToplevel> {
  loading ??= Module(wasmUrl ? { locateFile: () => wasmUrl! } : undefined).then((m) => {
    m.setup();
    return m;
  });
  return loading;
}

export interface UnionGroup<K extends string> {
  key: K;
  solids: Solid[];
}

/** まとめた結果。key ごとに、その key の立体に由来する三角形（頂点は共有した番号）を返す */
export type UnionResult<K extends string> = { positions: Float32Array; indices: Record<K, Uint32Array> };

/**
 * 立体をすべて1つにまとめる。どの三角形がどの key（建物・道路・台座）から来たかは残す（色分けのため）。
 * 重なった部分は内側になって消え、接している面は1つにつながる。
 * clip（閉じた形）を指定すると、その外を切り落とす（切り口も閉じた面になる）。
 * 体積が minVolume より小さいかけら（計算の誤差でできる薄い殻）は除き、tolerance 以内の細かな凹凸はならす。
 */
export async function unionSolids<K extends string>(
  groups: UnionGroup<K>[],
  {
    minVolume = 0,
    tolerance = 0,
    clip,
  }: {
    minVolume?: number;
    tolerance?: number;
    /** 指定すると、この閉じた形（範囲の柱）の外を切り落とす */
    clip?: Solid;
  } = {},
): Promise<UnionResult<K>> {
  const m = await manifold();
  const toDelete: { delete(): void }[] = [];
  try {
    let clipCache: InstanceType<typeof m.Manifold> | null = null;
    const toManifold = (s: Solid) => {
      const mesh = new m.Mesh({
        numProp: 3,
        vertProperties: Float32Array.from(s.positions),
        triVerts: Uint32Array.from(s.indices),
      });
      mesh.merge();
      const man = new m.Manifold(mesh);
      toDelete.push(man);
      return man;
    };
    const clipManifold = () => (clipCache ??= toManifold(clip!));
    const idToKey = new Map<number, K>();
    const parts = [];
    for (const g of groups) {
      if (g.solids.length === 0) continue;
      const pieces = g.solids.map(toManifold);
      let joined = m.Manifold.union(pieces);
      toDelete.push(joined);
      if (clip) {
        // 範囲の柱（高さは十分に大きく）と重なる部分だけ残す。切り口の面もこの key の色にする
        joined = joined.intersect(clipManifold());
        toDelete.push(joined);
      }
      joined = joined.asOriginal();
      toDelete.push(joined);
      idToKey.set(joined.originalID(), g.key);
      parts.push(joined);
    }
    const merged = m.Manifold.union(parts);
    toDelete.push(merged);
    // 計算の誤差でできる、ごく小さなかけら（体積がほぼ 0 の薄い殻）を除く
    const shells = merged.decompose();
    toDelete.push(...shells);
    const kept = shells.filter((p) => Math.abs(p.volume()) >= minVolume);
    const composed = m.Manifold.compose(kept);
    toDelete.push(composed);
    // 形がほとんど変わらない範囲（tolerance 以内）で、細かすぎる三角形をまとめて減らす
    const all = tolerance > 0 ? composed.simplify(tolerance) : composed;
    if (all !== composed) toDelete.push(all);
    const mesh = all.getMesh();
    const positions = new Float32Array(mesh.numVert * 3);
    for (let i = 0; i < mesh.numVert; i++) {
      for (let k = 0; k < 3; k++) positions[i * 3 + k] = mesh.vertProperties[i * mesh.numProp + k]!;
    }
    const lists = new Map<K, number[]>();
    for (const g of groups) lists.set(g.key, []);
    for (let r = 0; r < mesh.runOriginalID.length; r++) {
      const key = idToKey.get(mesh.runOriginalID[r]!);
      if (key === undefined) continue;
      const list = lists.get(key)!;
      for (let i = mesh.runIndex[r]!; i < mesh.runIndex[r + 1]!; i++) list.push(mesh.triVerts[i]!);
    }
    const indices = {} as Record<K, Uint32Array>;
    for (const [k, list] of lists) indices[k] = Uint32Array.from(list);
    return { positions, indices };
  } finally {
    for (const d of toDelete) d.delete();
  }
}
