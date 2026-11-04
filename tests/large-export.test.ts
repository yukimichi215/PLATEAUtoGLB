import { describe, expect, it } from 'vitest';
import { toObj } from '../src/core/export.js';
import { MeshPart, type ModelPiece, type PartName, type Parts } from '../src/core/scene.js';

// 1000m 四方など大きな範囲で、OBJ の行数が数十万になっても止まらないこと
// （以前は push(...行の一覧) が引数の数の上限を超え「Maximum call stack size exceeded」になった）
describe('大きな範囲の書き出し', () => {
  it('頂点 30 万個の OBJ を作れる', () => {
    const names: PartName[] = ['wall', 'roof', 'detail', 'window', 'door', 'road', 'ground'];
    const parts = Object.fromEntries(names.map((n) => [n, new MeshPart()])) as Parts;
    const wall = parts.wall;
    const n = 100_000;
    for (let i = 0; i < n; i++) {
      wall.addTriangles([i, 0, 0, i, 1, 0, i, 0, 1], [0, 1, 2], [1, 0, 0]);
    }
    const pieces: ModelPiece[] = [{ name: 'Buildings', group: 'Buildings', parts }];
    const obj = toObj(pieces, 'test', 'a.mtl');
    const lines = obj.split('\n');
    expect(lines.filter((l) => l.startsWith('v ')).length).toBe(n * 3);
    expect(lines.filter((l) => l.startsWith('f ')).length).toBe(n);
  });
});
