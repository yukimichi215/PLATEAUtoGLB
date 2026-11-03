// 緯度経度とメートルの変換、地域メッシュ番号の計算。
// PLATEAU の座標は JGD2011（EPSG:6697）の「緯度 経度 標高」の順。

export interface LatLon {
  lat: number;
  lon: number;
}

/** 緯度経度の四角い範囲（南西と北東） */
export interface LatLonBox {
  south: number;
  west: number;
  north: number;
  east: number;
}

// GRS80 楕円体（JGD2011 の基準）
const A = 6378137;
const F = 1 / 298.257222101;
const E2 = F * (2 - F);
const DEG = Math.PI / 180;

/** 緯度 lat での、緯度1度・経度1度あたりのメートル数 */
export function metersPerDegree(lat: number): { lat: number; lon: number } {
  const s = Math.sin(lat * DEG);
  const w = Math.sqrt(1 - E2 * s * s);
  const m = (A * (1 - E2)) / (w * w * w); // 子午線曲率半径
  const n = A / w; // 卯酉線曲率半径
  return { lat: m * DEG, lon: n * Math.cos(lat * DEG) * DEG };
}

/**
 * 中心を原点にした平面（メートル）へ写す。数km四方までなら誤差は数cm以下。
 * glTF の向きに合わせて、東 = +X、北 = -Z、上 = +Y。
 */
export class LocalProjector {
  readonly center: LatLon;
  private readonly mLat: number;
  private readonly mLon: number;

  constructor(center: LatLon) {
    this.center = center;
    const m = metersPerDegree(center.lat);
    this.mLat = m.lat;
    this.mLon = m.lon;
  }

  /** 東向き（m）, 南向き（m）を返す（glTF の X, Z） */
  toXZ(lat: number, lon: number): [number, number] {
    return [(lon - this.center.lon) * this.mLon, -(lat - this.center.lat) * this.mLat];
  }

  /** 中心から東西・南北に half メートルずつ広げた範囲 */
  boxAround(halfMeters: number): LatLonBox {
    const dLat = halfMeters / this.mLat;
    const dLon = halfMeters / this.mLon;
    return {
      south: this.center.lat - dLat,
      north: this.center.lat + dLat,
      west: this.center.lon - dLon,
      east: this.center.lon + dLon,
    };
  }
}

/** 3次メッシュ（約1km四方）の番号（8桁）。緯度30秒・経度45秒の区切り。 */
export function meshCode3(lat: number, lon: number): string {
  const p = Math.floor(lat * 1.5);
  const a = lat * 1.5 - p; // 1次メッシュ内の位置（0〜1）
  const u = Math.floor(lon - 100);
  const f = lon - 100 - u;
  const q = Math.floor(a * 8);
  const v = Math.floor(f * 8);
  const r = Math.floor((a * 8 - q) * 10);
  const w = Math.floor((f * 8 - v) * 10);
  return `${p}${u}${q}${v}${r}${w}`;
}

/** 範囲に重なる3次メッシュの番号をすべて返す */
export function meshCodesForBox(box: LatLonBox): string[] {
  const dLat = 30 / 3600;
  const dLon = 45 / 3600;
  const codes = new Set<string>();
  // メッシュの区切りに合わせて、南西から北東へ1メッシュずつ進む
  const lat0 = Math.floor(box.south / dLat) * dLat;
  const lon0 = Math.floor(box.west / dLon) * dLon;
  for (let lat = lat0; lat < box.north; lat += dLat) {
    for (let lon = lon0; lon < box.east; lon += dLon) {
      // 区切り線ちょうどの誤差を避けるため、メッシュの内側の点で番号を出す
      codes.add(meshCode3(Math.max(lat, box.south) + 1e-9, Math.max(lon, box.west) + 1e-9));
    }
  }
  return [...codes].sort();
}

/** 3次メッシュの番号（8桁）の範囲（南西・北東） */
export function meshBox(code: string): LatLonBox {
  const p = Number(code.slice(0, 2)), u = Number(code.slice(2, 4));
  const q = Number(code[4]), v = Number(code[5]), r = Number(code[6]), w = Number(code[7]);
  const south = p / 1.5 + q / 12 + r / 120;
  const west = 100 + u + v / 8 + w / 80;
  return { south, west, north: south + 1 / 120, east: west + 1 / 80 };
}
