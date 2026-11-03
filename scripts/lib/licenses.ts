// 公開用のファイル（dist）に入れた部品（npm のパッケージ）のライセンス一覧を作る。
// vite.config.ts が、実際に組み込んだパッケージの名前を集めてこれを呼ぶ。
import { existsSync, readdirSync, readFileSync } from 'node:fs';
import { join } from 'node:path';

/** 一覧に入れてよいライセンス（これ以外の部品が組み込まれたら、作るのを止めて人が確かめる） */
export const ALLOWED_LICENSES = ['MIT', 'ISC', 'Apache-2.0', 'Apache-2.0 OR MIT', 'BSD-2-Clause', 'BSD-3-Clause', 'BlueOak-1.0.0', '0BSD'];

/** ファイルの場所（…/node_modules/@scope/name/… や …/node_modules/name/…）からパッケージの名前を取り出す */
export function packageOf(id: string): string | null {
  const m = /[\\/]node_modules[\\/](?:\.pnpm[\\/][^\\/]+[\\/]node_modules[\\/])?((?:@[^\\/]+[\\/])?[^\\/]+)/.exec(
    id.slice(id.lastIndexOf('node_modules') - 1),
  );
  return m ? m[1]!.replace(/\\/g, '/') : null;
}

export interface PackageLicense {
  name: string;
  version: string;
  license: string;
  homepage?: string;
  texts: { file: string; text: string }[];
}

export function readPackageLicense(name: string, root = process.cwd()): PackageLicense {
  const dir = join(root, 'node_modules', name);
  const pkg = JSON.parse(readFileSync(join(dir, 'package.json'), 'utf8')) as {
    version: string;
    license?: string;
    homepage?: string;
    repository?: string | { url?: string };
  };
  const repo = typeof pkg.repository === 'string' ? pkg.repository : pkg.repository?.url;
  const files = existsSync(dir) ? readdirSync(dir).filter((f) => /^(licen[cs]e|copying)/i.test(f)).sort() : [];
  return {
    name,
    version: pkg.version,
    license: pkg.license ?? 'UNKNOWN',
    homepage: pkg.homepage ?? repo,
    texts: files.map((f) => ({ file: f, text: readFileSync(join(dir, f), 'utf8').trim() })),
  };
}

/** ライセンス一覧の文章。許されていないライセンス・本文のないものがあればエラーにする */
export function licenseText(names: Iterable<string>, root = process.cwd()): string {
  const list = [...new Set(names)].sort().map((n) => readPackageLicense(n, root));
  const bad = list.filter((p) => !ALLOWED_LICENSES.includes(p.license) || p.texts.length === 0);
  if (bad.length > 0) {
    throw new Error(`ライセンスを確かめてください: ${bad.map((p) => `${p.name}（${p.license}、本文 ${p.texts.length} 件）`).join('、')}`);
  }
  const out = [
    'PLATEAUtoGLB に組み込んでいる部品のライセンス / Licenses of the third-party packages bundled in PLATEAUtoGLB',
    '',
    ...list.map((p) => `- ${p.name} ${p.version} (${p.license})${p.homepage ? ` ${p.homepage}` : ''}`),
    '',
  ];
  for (const p of list) {
    out.push('='.repeat(72), `${p.name} ${p.version} (${p.license})`, '='.repeat(72));
    for (const t of p.texts) out.push(`[${t.file}]`, t.text, '');
  }
  return out.join('\n') + '\n';
}
