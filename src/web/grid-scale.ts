// プレビューの床のマス目：大きさに合った区切りの長さと、その読み方。
// three.js に頼らない計算だけを置き、テストで確かめる。

/** 一辺 extent（m）を、だいたい target 個に区切る「きりのよい長さ」（1・2・5 × 10^n m） */
export function niceGridStep(extent: number, target = 10): number {
  if (!(extent > 0)) return 1;
  const raw = extent / target;
  const p = 10 ** Math.floor(Math.log10(raw));
  for (const m of [1, 2, 5, 10]) if (m * p >= raw * 0.999) return m * p;
  return 10 * p;
}

const trim = (v: number) => String(Number(v.toPrecision(6)));

/**
 * 長さ（m）を読みやすい単位で書く。
 * print（3Dプリンタ用）のときは、印刷したときの大きさなので mm・cm で書く。
 */
export function formatLength(m: number, print: boolean): string {
  if (print) {
    const mm = m * 1000;
    return mm >= 10 ? `${trim(mm / 10)} cm` : `${trim(mm)} mm`;
  }
  return m >= 1000 ? `${trim(m / 1000)} km` : `${trim(m)} m`;
}
