// PLATEAU の建物データがある場所（3次メッシュ単位）を、データカタログ API で調べる。
// 2次メッシュ（約10km四方）ごとに1回だけ問い合わせて、その中の建物データのあるメッシュと最大の LOD を覚える。
// 1回の答えは数KB〜60KB 程度（東京の中心部のように多くの区が同じファイルを配る所がいちばん大きい）。
import { CATALOG_API, type FetchJson } from './catalog.js';
import { meshBox, meshCode3, meshCodesForBox, type LatLonBox } from './geo.js';

/** 建物データのあるメッシュの番号 → その中の最大の LOD。番号は 8桁（3次）が基本。6桁・4桁は中のメッシュ全部 */
export type Coverage = Map<string, number>;

export function coverageUrl(mesh2: string): string {
  return `${CATALOG_API}/m:${mesh2}?types=bldg`;
}

interface CatalogResponse {
  cities?: { files?: { bldg?: { code: string; maxLod?: number }[] } }[];
}

/** 2次メッシュの問い合わせの答えから、建物データのあるメッシュを集める */
export function parseCoverage(json: unknown, mesh2: string): Coverage {
  const out: Coverage = new Map();
  for (const city of (json as CatalogResponse).cities ?? []) {
    for (const f of city.files?.bldg ?? []) {
      // 2次メッシュの外のファイル（隣のメッシュ・上の階層の番号）は、その中に関係する分だけ
      const inside = f.code.startsWith(mesh2) || mesh2.startsWith(f.code);
      if (!inside) continue;
      const lod = f.maxLod ?? 1;
      out.set(f.code, Math.max(out.get(f.code) ?? 0, lod));
    }
  }
  return out;
}

/** 3次メッシュ（8桁）に建物データがあれば、その最大の LOD。なければ undefined */
export function lodOfMesh(cov: Coverage, mesh3: string): number | undefined {
  return cov.get(mesh3) ?? cov.get(mesh3.slice(0, 6)) ?? cov.get(mesh3.slice(0, 4));
}

/** 地図に出す枠（建物データのある3次メッシュ） */
export interface CoverageCell {
  code: string;
  box: LatLonBox;
  lod: number;
}

export interface AreaCoverage {
  /** 範囲に重なる3次メッシュの数 */
  total: number;
  /** そのうち建物データのあるメッシュの数 */
  covered: number;
}

/** 範囲に重なる2次メッシュ（6桁）の番号 */
export function mesh2CodesForBox(box: LatLonBox): string[] {
  return [...new Set(meshCodesForBox(box).map((c) => c.slice(0, 6)))].sort();
}

/**
 * 問い合わせの結果を覚えておき、同じ2次メッシュを何度も問い合わせない。
 * 問い合わせは1件ずつ順番に行う（同時に何本も送らない）。
 */
export class CoverageIndex {
  private cache = new Map<string, Coverage>();
  private queue: Promise<unknown> = Promise.resolve();

  constructor(private fetchJson: FetchJson) {}

  /** 2次メッシュの建物データのあるメッシュ */
  forMesh2(mesh2: string): Promise<Coverage> {
    const hit = this.cache.get(mesh2);
    if (hit) return Promise.resolve(hit);
    const next = this.queue.then(async () => {
      const again = this.cache.get(mesh2);
      if (again) return again;
      const cov = parseCoverage(await this.fetchJson(coverageUrl(mesh2)), mesh2);
      this.cache.set(mesh2, cov);
      return cov;
    });
    // 失敗しても次の問い合わせは続けられるように
    this.queue = next.catch(() => undefined);
    return next;
  }

  /** 3次メッシュ（切り出す範囲に重なるもの。area.ts の meshCodesForArea）のうち、建物データのある数 */
  async areaCoverage(meshes: string[]): Promise<AreaCoverage> {
    let covered = 0;
    for (const m of meshes) {
      const cov = await this.forMesh2(m.slice(0, 6));
      if (lodOfMesh(cov, m) !== undefined) covered++;
    }
    return { total: meshes.length, covered };
  }

  /** 点の3次メッシュの建物データの最大の LOD（なければ undefined） */
  async lodAt(lat: number, lon: number): Promise<number | undefined> {
    const m = meshCode3(lat, lon);
    return lodOfMesh(await this.forMesh2(m.slice(0, 6)), m);
  }

  /** 範囲（地図に見えている所）の中の、建物データのある3次メッシュの枠。2次メッシュが maxMesh2 を超えるときは調べない */
  async cells(view: LatLonBox, maxMesh2 = 4): Promise<CoverageCell[] | null> {
    const m2s = mesh2CodesForBox(view);
    if (m2s.length > maxMesh2) return null;
    const out: CoverageCell[] = [];
    for (const m2 of m2s) {
      const cov = await this.forMesh2(m2);
      if (cov.size === 0) continue;
      // 6桁・4桁（広い範囲のファイル）もあるので、2次メッシュの中の3次メッシュ100個をそれぞれ調べる
      for (const code of meshCodesInMesh2(m2)) {
        const lod = lodOfMesh(cov, code);
        if (lod !== undefined) out.push({ code, box: meshBox(code), lod });
      }
    }
    return out;
  }
}

/** 2次メッシュの中の3次メッシュ（100個） */
function meshCodesInMesh2(mesh2: string): string[] {
  const out: string[] = [];
  for (let r = 0; r < 10; r++) for (let w = 0; w < 10; w++) out.push(`${mesh2}${r}${w}`);
  return out;
}
