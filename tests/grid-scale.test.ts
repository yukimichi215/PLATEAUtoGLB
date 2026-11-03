import { describe, expect, it } from 'vitest';
import { formatLength, niceGridStep } from '../src/web/grid-scale.js';

describe('プレビューのマス目', () => {
  it('きりのよい長さで、だいたい10マスに区切る', () => {
    expect(niceGridStep(300)).toBe(50); // 300 m 四方 → 50 m（6マス）
    expect(niceGridStep(100)).toBe(10);
    expect(niceGridStep(1000)).toBe(100);
    expect(niceGridStep(150)).toBe(20);
    expect(niceGridStep(0.15)).toBeCloseTo(0.02, 12); // 3Dプリンタ用 15cm → 2cm
    expect(niceGridStep(0.1)).toBeCloseTo(0.01, 12);
    for (const e of [0.03, 0.7, 7, 70, 333, 2500]) {
      const n = e / niceGridStep(e);
      expect(n).toBeGreaterThanOrEqual(4);
      expect(n).toBeLessThanOrEqual(10.01);
    }
    expect(niceGridStep(0)).toBe(1);
  });

  it('実物は m・km、印刷したときの大きさは mm・cm で書く', () => {
    expect(formatLength(50, false)).toBe('50 m');
    expect(formatLength(2000, false)).toBe('2 km');
    expect(formatLength(0.02, true)).toBe('2 cm');
    expect(formatLength(0.005, true)).toBe('5 mm');
    expect(formatLength(0.001, true)).toBe('1 mm');
  });
});
