import { defineConfig } from 'vitest/config';

export default defineConfig({
  // 相対パスで出力し、どこに置いても開けるようにする
  base: './',
  worker: { format: 'es' },
  build: { target: 'es2022', chunkSizeWarningLimit: 1500 },
  test: { include: ['tests/**/*.test.ts'], testTimeout: 60000 },
});
