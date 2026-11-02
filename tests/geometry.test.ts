import { describe, expect, it } from 'vitest';
import { clipRingToSquare, triangulatePolygon } from '../src/core/geometry.js';

function triArea(pos: number[], idx: number[]): number {
  let a = 0;
  for (let i = 0; i < idx.length; i += 3) {
    const [p, q, r] = [idx[i]!, idx[i + 1]!, idx[i + 2]!];
    const ux = pos[q * 3]! - pos[p * 3]!, uy = pos[q * 3 + 1]! - pos[p * 3 + 1]!, uz = pos[q * 3 + 2]! - pos[p * 3 + 2]!;
    const vx = pos[r * 3]! - pos[p * 3]!, vy = pos[r * 3 + 1]! - pos[p * 3 + 1]!, vz = pos[r * 3 + 2]! - pos[p * 3 + 2]!;
    a += Math.hypot(uy * vz - uz * vy, uz * vx - ux * vz, ux * vy - uy * vx) / 2;
  }
  return a;
}

describe('triangulatePolygon', () => {
  it('穴あきの床（10m四方に4m四方の穴）を正しい面積で分ける', () => {
    const ext = [0, 0, 0, 0, 0, 10, 10, 0, 10, 10, 0, 0];
    const hole = [3, 0, 3, 7, 0, 3, 7, 0, 7, 3, 0, 7];
    const t = triangulatePolygon(ext, [hole])!;
    expect(triArea(t.positions, t.indices)).toBeCloseTo(84, 5);
    expect(Math.abs(t.normal[1])).toBeCloseTo(1, 5);
  });

  it('壁（縦の面）も分けられ、三角形の向きが面の向きにそろう', () => {
    const wall = [0, 0, 0, 5, 0, 0, 5, 3, 0, 0, 3, 0];
    const t = triangulatePolygon(wall)!;
    expect(t.indices.length).toBe(6);
    expect(t.normal[2]).toBeCloseTo(1, 5);
    expect(triArea(t.positions, t.indices)).toBeCloseTo(15, 5);
  });

  it('つぶれた多角形は捨てる', () => {
    expect(triangulatePolygon([0, 0, 0, 1, 0, 0, 2, 0, 0])).toBeNull();
  });
});

describe('clipRingToSquare', () => {
  it('はみ出した部分を切り取る', () => {
    const ring = [-20, -5, 20, -5, 20, 5, -20, 5];
    const out = clipRingToSquare(ring, 10);
    const xs = out.filter((_, i) => i % 2 === 0);
    expect(Math.min(...xs)).toBe(-10);
    expect(Math.max(...xs)).toBe(10);
  });

  it('範囲の外の多角形は空になる', () => {
    expect(clipRingToSquare([20, 20, 30, 20, 30, 30], 10)).toEqual([]);
  });
});
