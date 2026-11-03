import { describe, expect, it } from 'vitest';
import { findLod3Spot } from '../src/core/lod3-spot.js';
import { LocalProjector } from '../src/core/geo.js';

describe('LOD3 の建物が集まっている場所', () => {
  it('離れた1棟より、集まっている所を選ぶ', () => {
    const base = { lat: 35.1, lon: 138.86 };
    // 集まり：基準から東へ 400m あたりに 5 棟（20m 間隔）、離れた 1 棟は基準の位置
    const box = new LocalProjector(base).boxAround(400);
    const cluster = [0, 1, 2, 3, 4].map((i) => ({ lat: base.lat + (i * 20) / 111000, lon: box.east }));
    const spot = findLod3Spot([base, ...cluster])!;
    expect(spot.count).toBe(5);
    expect(Math.abs(spot.lon - box.east)).toBeLessThan(1e-6);
    // 中心は集まりの平均（南北の真ん中）
    expect(Math.abs(spot.lat - (base.lat + 40 / 111000))).toBeLessThan(1e-6);
  });

  it('建物を中心にした正方形より多く入る位置があれば、そちらを選ぶ', () => {
    // 東西に 290m 離れた2棟：どちらかを中心にすると1棟しか入らないが、間に置けば2棟とも入る
    const a = { lat: 35.1, lon: 138.86 };
    const box = new LocalProjector(a).boxAround(290);
    const spot = findLod3Spot([a, { lat: a.lat, lon: box.east }])!;
    expect(spot.count).toBe(2);
  });

  it('建物がなければ null', () => {
    expect(findLod3Spot([])).toBeNull();
  });
});
