import type { Plugin } from 'vite';
import { defineConfig } from 'vitest/config';
import { licenseText, packageOf } from './scripts/lib/licenses.js';

/**
 * 実際に組み込んだ npm のパッケージを集め、ライセンス一覧（third-party-licenses.txt）を dist に入れる。
 * 画面の処理と worker の両方を数える（worker は別に組み立てるので、同じ入れ物を使う）。
 */
function thirdPartyLicenses(): { main: Plugin; worker: Plugin } {
  const used = new Set<string>();
  const collect = (id: string) => {
    const name = packageOf(id);
    if (name) used.add(name);
  };
  return {
    worker: { name: 'collect-packages-worker', apply: 'build', moduleParsed: (info) => collect(info.id) },
    main: {
      name: 'third-party-licenses',
      apply: 'build',
      moduleParsed: (info) => collect(info.id),
      generateBundle() {
        this.emitFile({ type: 'asset', fileName: 'third-party-licenses.txt', source: licenseText(used) });
      },
    },
  };
}

const licenses = thirdPartyLicenses();

export default defineConfig({
  // 相対パスで出力し、どこに置いても開けるようにする
  base: './',
  plugins: [licenses.main],
  worker: { format: 'es', plugins: () => [licenses.worker] },
  build: { target: 'es2022', chunkSizeWarningLimit: 1500 },
  test: { include: ['tests/**/*.test.ts'], testTimeout: 60000 },
});
