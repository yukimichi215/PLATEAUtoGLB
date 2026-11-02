import { inflateSync } from 'node:zlib';
import { describe, expect, it } from 'vitest';
import { encodePngRgb } from '../src/core/png.js';
import { DEFAULT_STOREY_HEIGHT, storeyHeight, WINDOW_BAY_WIDTH, wallUvs, windowTexturePng } from '../src/core/windows.js';

describe('窓の模様', () => {
  it('PNG：署名・大きさ・画素が正しく入る', () => {
    const rgb = new Uint8Array([255, 0, 0, 0, 255, 0, 0, 0, 255, 10, 20, 30]);
    const png = encodePngRgb(2, 2, rgb);
    expect([...png.slice(0, 8)]).toEqual([0x89, 0x50, 0x4e, 0x47, 0x0d, 0x0a, 0x1a, 0x0a]);
    const view = new DataView(png.buffer);
    expect(view.getUint32(16)).toBe(2);
    expect(view.getUint32(20)).toBe(2);
    // IDAT の中身を展開して、元の画素と同じか確かめる
    const idatLen = view.getUint32(33);
    const raw = inflateSync(png.slice(41, 41 + idatLen));
    expect([...raw]).toEqual([0, 255, 0, 0, 0, 255, 0, 0, 0, 0, 255, 10, 20, 30]);
  });

  it('窓の模様の画像は 128px の PNG で、一辺 2048px 以下', () => {
    const png = windowTexturePng();
    const view = new DataView(png.buffer);
    expect(view.getUint32(16)).toBe(128);
    expect(png.byteLength).toBeLessThan(100_000);
  });

  it('1階分の高さ：階数から求め、おかしな値なら標準にする', () => {
    expect(storeyHeight(30, 10)).toBeCloseTo(3);
    expect(storeyHeight(30, undefined)).toBe(DEFAULT_STOREY_HEIGHT);
    expect(storeyHeight(100, 2)).toBe(DEFAULT_STOREY_HEIGHT); // 1階50mはおかしい
    expect(storeyHeight(3, 9)).toBe(DEFAULT_STOREY_HEIGHT);
  });

  it('壁の模様の位置：横は壁に沿った距離、高さ1階分で v が 1 進む', () => {
    // 南向き（+Z）の壁。x 0〜7.2 m、高さ 0〜6 m
    const pos = [0, 0, 0, 7.2, 0, 0, 7.2, 6, 0, 0, 6, 0];
    const uv = wallUvs(pos, [0, 0, 1], 3);
    const us = [uv[0], uv[2], uv[4], uv[6]].map((u) => Math.abs(u!));
    expect(Math.max(...us) - Math.min(...us)).toBeCloseTo(7.2 / WINDOW_BAY_WIDTH);
    expect(uv[5]).toBeCloseTo(-2); // 6 m = 2階分
  });
});
