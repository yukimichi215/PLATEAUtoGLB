import { describe, expect, it } from 'vitest';
import { LocalProjector, meshCode3, meshCodesForBox, metersPerDegree } from '../src/core/geo.js';

describe('geo', () => {
  it('東京駅の3次メッシュ番号は 53394611', () => {
    expect(meshCode3(35.6812, 139.7671)).toBe('53394611');
  });

  it('緯度35度の1度あたりの長さが、よく知られた値（約110.95km・約91.29km）と合う', () => {
    const m = metersPerDegree(35);
    expect(m.lat).toBeCloseTo(110_950, -2);
    expect(m.lon).toBeCloseTo(91_290, -2);
  });

  it('メッシュの境目をまたぐ範囲では、重なるメッシュをすべて返す', () => {
    // 53394611 の南西の角（北緯35°40'30"・東経139°45'45"）
    const p = new LocalProjector({ lat: 35 + 40.5 / 60, lon: 139.7625 });
    const codes = meshCodesForBox(p.boxAround(100));
    expect(codes).toEqual(['53394600', '53394601', '53394610', '53394611']);
  });

  it('メッシュの内側の小さな範囲は1つだけ', () => {
    const p = new LocalProjector({ lat: 35.6788, lon: 139.7688 });
    expect(meshCodesForBox(p.boxAround(150))).toEqual(['53394611']);
  });

  it('東が +X、北が -Z になる', () => {
    const p = new LocalProjector({ lat: 35.68, lon: 139.76 });
    const [x, z] = p.toXZ(35.681, 139.761);
    expect(x).toBeGreaterThan(80);
    expect(z).toBeLessThan(-100);
  });
});
