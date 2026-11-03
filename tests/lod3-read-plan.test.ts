import { describe, expect, it } from 'vitest';
import { ReadBudget, roundRobin } from '../scripts/lod3-read-plan.js';

describe('LOD3 の区画を読む順と上限', () => {
  it('各自治体の1番目を先に、次に2番目を読む', () => {
    expect([...roundRobin([['a1', 'a2', 'a3'], ['b1'], ['c1', 'c2']])]).toEqual([
      [0, 'a1'], [1, 'b1'], [2, 'c1'], [0, 'a2'], [2, 'c2'], [0, 'a3'],
    ]);
    expect([...roundRobin([])]).toEqual([]);
  });

  it('1ファイルの上限を超えたらそのファイルだけ止め、次のファイルは読める', () => {
    const b = new ReadBudget(200, 1000);
    expect(b.add(150, 150)).toBe('ok');
    expect(b.add(60, 210)).toBe('fileTooLarge');
    expect(b.canStart()).toBe(true);
    expect(b.add(100, 100)).toBe('ok');
    expect(b.total).toBe(310);
  });

  it('合計の上限に達したら止め、次のファイルは読み始めない', () => {
    const b = new ReadBudget(200, 300);
    expect(b.add(200, 200)).toBe('ok');
    expect(b.add(150, 150)).toBe('totalReached');
    expect(b.canStart()).toBe(false);
  });
});
