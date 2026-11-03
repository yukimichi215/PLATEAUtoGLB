import { readFileSync } from 'node:fs';
import { describe, expect, it } from 'vitest';
import { ALLOWED_LICENSES, licenseText, packageOf, readPackageLicense } from '../scripts/lib/licenses.js';

const pkg = JSON.parse(readFileSync(new URL('../package.json', import.meta.url), 'utf8')) as { dependencies: Record<string, string> };

describe('組み込んだ部品のライセンス一覧', () => {
  it('ファイルの場所からパッケージの名前を取り出す', () => {
    expect(packageOf('/a/node_modules/three/build/three.module.js')).toBe('three');
    expect(packageOf('/a/node_modules/@gltf-transform/core/dist/index.js')).toBe('@gltf-transform/core');
    expect(packageOf('C:\\a\\node_modules\\sax\\lib\\sax.js')).toBe('sax');
    expect(packageOf('/a/node_modules/x/node_modules/property-graph/dist/a.js')).toBe('property-graph');
    expect(packageOf('/a/src/web/main.ts')).toBeNull();
  });

  it('使う部品（dependencies）はどれも許したライセンスで、本文がある', () => {
    for (const name of Object.keys(pkg.dependencies)) {
      const p = readPackageLicense(name);
      expect(ALLOWED_LICENSES, `${name} ${p.license}`).toContain(p.license);
      expect(p.texts.length, name).toBeGreaterThan(0);
    }
  });

  it('一覧には名前・版・ライセンスの本文が入り、許していないものは止める', () => {
    const text = licenseText(['three', 'earcut']);
    const three = readPackageLicense('three');
    expect(text).toContain(`- three ${three.version} (MIT)`);
    expect(text).toContain(three.texts[0]!.text.split('\n')[0]!);
    expect(text).toContain('- earcut');
    expect(() => licenseText(['three'], '/nonexistent')).toThrow();
  });
});
