import { describe, expect, it } from 'vitest';
import { GSI_ADDRESS_SEARCH, parseLatLon, searchPlace } from '../src/core/geocode.js';

describe('場所の検索', () => {
  it('緯度・経度の直接入力を読む（全角の読点・逆順も）', () => {
    expect(parseLatLon('35.6812, 139.7671')).toEqual({ lat: 35.6812, lon: 139.7671 });
    expect(parseLatLon('35.6812、139.7671')).toEqual({ lat: 35.6812, lon: 139.7671 });
    expect(parseLatLon('139.7671 35.6812')).toEqual({ lat: 35.6812, lon: 139.7671 });
    expect(parseLatLon('東京駅')).toBeNull();
    expect(parseLatLon('0, 0')).toBeNull();
  });

  it('国土地理院の住所検索の答えを候補にする', async () => {
    let asked = '';
    const places = await searchPlace('東京都千代田区丸の内', async (url) => {
      asked = url;
      return [
        { geometry: { coordinates: [139.7643, 35.6814], type: 'Point' }, type: 'Feature', properties: { title: '東京都千代田区丸の内一丁目' } },
        { geometry: { coordinates: [139.7618, 35.6797], type: 'Point' }, type: 'Feature', properties: { title: '東京都千代田区丸の内二丁目' } },
      ];
    });
    expect(asked.startsWith(`${GSI_ADDRESS_SEARCH}?q=`)).toBe(true);
    expect(places).toHaveLength(2);
    expect(places[0]).toEqual({ lat: 35.6814, lon: 139.7643, title: '東京都千代田区丸の内一丁目' });
  });

  it('駅名では、入力の地名を含む候補を先に出す', async () => {
    const f = (title: string, lon: number, lat: number) => ({ geometry: { coordinates: [lon, lat] }, properties: { title } });
    const places = await searchPlace('東京駅', async () => [
      f('北海道札幌市東区', 141.36, 43.07),
      f('北海道東神楽町東', 142.43, 43.68),
      f('東京都千代田区丸の内一丁目', 139.7672, 35.6816),
    ]);
    expect(places[0]!.title).toBe('東京都千代田区丸の内一丁目');
    expect(places).toHaveLength(3);
  });
});
