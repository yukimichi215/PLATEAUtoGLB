// PLATEAU データカタログ API から、メッシュごとのデータファイルの一覧を取る。
// 説明：https://docs.plateauview.mlit.go.jp/api/rest/operations/datacatalogcitygmlconditions/

export const CATALOG_API = 'https://api.plateauview.mlit.go.jp/datacatalog/citygml';

export type FeatureType = 'bldg' | 'tran';

export interface SourceFile {
  type: FeatureType;
  /** 3次メッシュ番号 */
  mesh: string;
  url: string;
  /** 展開後の大きさ（バイト）。API の値 */
  fileSize: number;
  maxLod: number;
  /** このファイルを配布している自治体（同じファイルを複数の自治体が配布していることがある） */
  cities: { code: string; name: string; year: number; url: string }[];
}

interface CatalogFile {
  code: string;
  maxLod?: number;
  url: string;
  fileSize?: number;
}
interface CatalogCity {
  cityCode: string;
  cityName: string;
  year: number;
  files: Partial<Record<string, CatalogFile[]>>;
}
interface CatalogResponse {
  cities?: CatalogCity[];
}

export type FetchJson = (url: string) => Promise<unknown>;

export function catalogUrl(mesh: string, types: FeatureType[]): string {
  return `${CATALOG_API}/m:${mesh}?types=${types.join(',')}`;
}

/** URL の最後の部分（ファイル名） */
function baseName(url: string): string {
  return url.slice(url.lastIndexOf('/') + 1);
}

/**
 * API の答えをファイルの一覧にまとめる。
 * 東京都のデータのように、同じ中身のファイル（同じ名前・同じ大きさ）を複数の区が
 * 別の URL で配布していることがあるので、1つにまとめて配布元の自治体を並べる。
 * 指定したメッシュと違う番号のファイル（2次メッシュ単位のものなど）は除く。
 */
export function parseCatalog(json: unknown, mesh: string, types: FeatureType[]): SourceFile[] {
  const res = json as CatalogResponse;
  const out = new Map<string, SourceFile>();
  for (const city of res.cities ?? []) {
    for (const type of types) {
      for (const f of city.files?.[type] ?? []) {
        if (f.code !== mesh) continue;
        const key = `${type}/${baseName(f.url)}/${f.fileSize ?? ''}`;
        const cityInfo = { code: city.cityCode, name: city.cityName, year: city.year, url: f.url };
        const found = out.get(key);
        if (found) {
          found.cities.push(cityInfo);
        } else {
          out.set(key, {
            type,
            mesh,
            url: f.url,
            fileSize: f.fileSize ?? 0,
            maxLod: f.maxLod ?? 0,
            cities: [cityInfo],
          });
        }
      }
    }
  }
  return [...out.values()];
}

/** 複数のメッシュのファイル一覧を、1件ずつ順番に問い合わせて集める */
export async function findSourceFiles(
  meshes: string[],
  types: FeatureType[],
  fetchJson: FetchJson,
): Promise<SourceFile[]> {
  const all: SourceFile[] = [];
  for (const mesh of meshes) {
    const json = await fetchJson(catalogUrl(mesh, types));
    all.push(...parseCatalog(json, mesh, types));
  }
  return all;
}
