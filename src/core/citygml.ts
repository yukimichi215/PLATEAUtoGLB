// CityGML（PLATEAU の XML）を少しずつ読み、建物・道路の形と主な属性を取り出す。
// ファイル全体をメモリに読まず、読んだ端から1件ずつ呼び出し元へ渡す。
// sax は外部ファイル（外部実体・DTD）を読み込む機能を持たないので、XML 経由で
// 手元や外部のファイルを読まれる心配がない。
import sax from 'sax';

/** 多角形。座標は [緯度, 経度, 標高, 緯度, 経度, 標高, ...] */
export interface Polygon {
  exterior: number[];
  interiors: number[][];
}

export type SurfaceKind = 'roof' | 'wall' | 'ground' | 'other';

/** LOD3 の面の種類。壁・屋根などに加えて、窓・扉（開口部）がある */
export type Lod3Kind = SurfaceKind | 'window' | 'door';

export interface BuildingAttributes {
  measuredHeight?: number;
  storeysAboveGround?: number;
  usage?: string;
  class?: string;
  yearOfConstruction?: number;
  name?: string;
  buildingId?: string;
  /** 建物が属する自治体コード（uro:city） */
  city?: string;
}

export interface Building {
  id: string;
  attrs: BuildingAttributes;
  /** LOD1：箱型（屋根が平ら） */
  lod1: Polygon[];
  /** LOD2：屋根の形あり。面の種類つき */
  lod2: { kind: SurfaceKind; polygon: Polygon }[];
  /** ベランダ・ひさし・屋上の設備などの付属物（LOD2 の形。地域によってはない） */
  installations: Polygon[];
  /** LOD3：窓・扉まである細かい形。ごく一部の地域・建物にだけある */
  lod3: { kind: Lod3Kind; polygon: Polygon }[];
  /** LOD3 の付属物（LOD3 の建物にだけある） */
  installations3: Polygon[];
}

export interface Road {
  id: string;
  polygons: Polygon[];
}

export interface CityGmlHandlers {
  onBuilding?: (b: Building) => void;
  onRoad?: (r: Road) => void;
}

const SURFACE_KIND: Record<string, SurfaceKind> = {
  'bldg:RoofSurface': 'roof',
  'bldg:WallSurface': 'wall',
  'bldg:GroundSurface': 'ground',
  'bldg:OuterCeilingSurface': 'other',
  'bldg:OuterFloorSurface': 'other',
  'bldg:ClosureSurface': 'other',
};

/** 中身の文字を取り出したい属性のタグ名 → 保存先 */
const ATTR_TAGS: Record<string, keyof BuildingAttributes> = {
  'bldg:measuredHeight': 'measuredHeight',
  'bldg:storeysAboveGround': 'storeysAboveGround',
  'bldg:usage': 'usage',
  'bldg:class': 'class',
  'bldg:yearOfConstruction': 'yearOfConstruction',
  'gml:name': 'name',
  'uro:buildingID': 'buildingId',
  'uro:city': 'city',
};
const NUMERIC_ATTRS = new Set<keyof BuildingAttributes>([
  'measuredHeight',
  'storeysAboveGround',
  'yearOfConstruction',
]);

/**
 * PLATEAU で「分からない」を表す値（階数 9999、建てた年 0001、高さ -9999）は、値なしとして扱う
 * （データにない項目を、本当の値のように見せないため）
 * 根拠：2026-11-03 に実データ（練馬区・千代田区・新宿区 2025 年度、金沢市 2024 年度、茅野市 2023 年度の bldg）で、
 * 地上階数 9999 が 3,270 件・建てた年 0001 が 2,940 件・計測高さ -9999 が 888 件あった。
 */
function isKnownNumber(key: keyof BuildingAttributes, n: number): boolean {
  if (!Number.isFinite(n)) return false;
  if (key === 'storeysAboveGround') return n >= 0 && n < 9999;
  if (key === 'yearOfConstruction') return n > 1000 && n < 9999;
  if (key === 'measuredHeight') return n > 0 && n < 9999;
  return true;
}

function parseNumbers(text: string): number[] {
  const parts = text.trim().split(/\s+/);
  const out: number[] = [];
  for (const p of parts) {
    if (p === '') continue;
    const n = Number(p);
    if (Number.isFinite(n)) out.push(n);
  }
  return out;
}

/** 輪の最後の点が最初の点と同じなら取り除く（三角形分割で邪魔になるため） */
function dropClosingPoint(coords: number[]): number[] {
  const n = coords.length;
  if (
    n >= 6 &&
    coords[0] === coords[n - 3] &&
    coords[1] === coords[n - 2] &&
    coords[2] === coords[n - 1]
  ) {
    return coords.slice(0, n - 3);
  }
  return coords;
}

/**
 * CityGML の読み取り器。feed() に文字列を少しずつ渡し、最後に close() を呼ぶ。
 */
export class CityGmlReader {
  private readonly parser: sax.SAXParser;
  private readonly stack: string[] = [];
  private text = '';
  private collectingText = false;

  private building: Building | null = null;
  private buildingDepth = -1;
  private road: Road | null = null;
  private roadDepth = -1;

  private polygon: Polygon | null = null;
  private ring: number[] | null = null;
  private ringIsInterior = false;

  /** 今いる場所の手がかり（深さで管理） */
  private lod1Depth = -1;
  private lod2Depth = -1;
  private installationDepth = -1;
  /** 付属物の中の形（bldg:lod2Geometry） */
  private installationGeomDepth = -1;
  /** 付属物の中の LOD3 の形（bldg:lod3Geometry） */
  private installation3GeomDepth = -1;
  /** LOD3 の形（bldg:lod3MultiSurface） */
  private lod3Depth = -1;
  /** 窓・扉（bldg:Window / bldg:Door）の中 */
  private openingKind: 'window' | 'door' | null = null;
  private openingDepth = -1;
  /** 部屋の中（使わないので読み飛ばす） */
  private roomDepth = -1;
  private surfaceKind: SurfaceKind | null = null;
  private surfaceDepth = -1;
  private roadLod1Depth = -1;

  constructor(private readonly handlers: CityGmlHandlers) {
    // strict: true（XML の決まりどおりに読む）。名前空間の処理はしない（タグ名は "bldg:Building" のまま）
    this.parser = sax.parser(true, { trim: false, normalize: false, xmlns: false, position: false });
    this.parser.onopentag = (node) => this.open(node as sax.Tag);
    this.parser.onclosetag = (name) => this.close_(name);
    this.parser.ontext = (t) => {
      if (this.collectingText) this.text += t;
    };
    this.parser.oncdata = (t) => {
      if (this.collectingText) this.text += t;
    };
    this.parser.onerror = (e) => {
      throw new Error(`CityGML の読み取りに失敗しました: ${e.message}`);
    };
  }

  feed(chunk: string): void {
    this.parser.write(chunk);
  }

  close(): void {
    this.parser.close();
  }

  private open(node: sax.Tag): void {
    const name = node.name;
    this.stack.push(name);
    const depth = this.stack.length;

    if (name === 'bldg:Building' && !this.building) {
      const id = String(node.attributes['gml:id'] ?? '');
      this.building = { id, attrs: {}, lod1: [], lod2: [], installations: [], lod3: [], installations3: [] };
      this.buildingDepth = depth;
      return;
    }
    if (name === 'tran:Road' || name === 'tran:Square' || name === 'tran:Track') {
      if (!this.road) {
        this.road = { id: String(node.attributes['gml:id'] ?? ''), polygons: [] };
        this.roadDepth = depth;
      }
      return;
    }

    if (this.building) {
      if (name === 'bldg:lod1Solid') this.lod1Depth = depth;
      else if (name === 'bldg:interiorRoom') {
        if (this.roomDepth < 0) this.roomDepth = depth;
      } else if (name === 'bldg:outerBuildingInstallation') {
        if (this.installationDepth < 0) this.installationDepth = depth;
      } else if (
        this.installationDepth >= 0 &&
        (name === 'bldg:lod2Geometry' || name === 'bldg:lod2MultiSurface') &&
        this.installationGeomDepth < 0
      ) {
        this.installationGeomDepth = depth;
      } else if (this.installationDepth >= 0 && name === 'bldg:lod3Geometry' && this.installation3GeomDepth < 0) {
        this.installation3GeomDepth = depth;
      } else if ((name === 'bldg:Window' || name === 'bldg:Door') && this.openingDepth < 0) {
        this.openingKind = name === 'bldg:Window' ? 'window' : 'door';
        this.openingDepth = depth;
      } else if (name === 'bldg:lod3MultiSurface' && this.installationDepth < 0 && this.lod3Depth < 0) {
        this.lod3Depth = depth;
      } else if (name in SURFACE_KIND && this.surfaceDepth < 0) {
        this.surfaceKind = SURFACE_KIND[name] ?? 'other';
        this.surfaceDepth = depth;
      } else if (
        (name === 'bldg:lod2MultiSurface' || name === 'bldg:lod2Solid') &&
        this.lod2Depth < 0
      ) {
        this.lod2Depth = depth;
      } else if (
        name in ATTR_TAGS &&
        this.installationDepth < 0 &&
        this.roomDepth < 0 &&
        this.openingDepth < 0 &&
        this.surfaceDepth < 0
      ) {
        this.startText();
      }
    } else if (this.road) {
      if (name === 'tran:lod1MultiSurface') this.roadLod1Depth = depth;
    }

    if (this.wantsGeometry()) {
      if (name === 'gml:Polygon') {
        this.polygon = { exterior: [], interiors: [] };
      } else if (this.polygon && (name === 'gml:exterior' || name === 'gml:interior')) {
        this.ring = [];
        this.ringIsInterior = name === 'gml:interior';
      } else if (this.ring && (name === 'gml:posList' || name === 'gml:pos')) {
        this.startText();
      }
    }
  }

  /** 今の位置の多角形を集めるべきか */
  private wantsGeometry(): boolean {
    if (this.building) {
      if (this.roomDepth >= 0) return false;
      if (this.installationDepth >= 0) return this.installationGeomDepth >= 0 || this.installation3GeomDepth >= 0;
      return this.lod1Depth >= 0 || this.lod2Depth >= 0 || this.lod3Depth >= 0;
    }
    if (this.road) return this.roadLod1Depth >= 0;
    return false;
  }

  private startText(): void {
    this.collectingText = true;
    this.text = '';
  }

  private takeText(): string {
    const t = this.text;
    this.collectingText = false;
    this.text = '';
    return t;
  }

  private close_(name: string): void {
    const depth = this.stack.length;
    this.stack.pop();

    // 座標
    if ((name === 'gml:posList' || name === 'gml:pos') && this.ring && this.collectingText) {
      const nums = parseNumbers(this.takeText());
      for (const n of nums) this.ring.push(n);
      return;
    }
    if ((name === 'gml:exterior' || name === 'gml:interior') && this.ring && this.polygon) {
      const ring = dropClosingPoint(this.ring);
      if (ring.length >= 9 && ring.length % 3 === 0) {
        if (this.ringIsInterior) this.polygon.interiors.push(ring);
        else this.polygon.exterior = ring;
      }
      this.ring = null;
      return;
    }
    if (name === 'gml:Polygon' && this.polygon) {
      const poly = this.polygon;
      this.polygon = null;
      if (poly.exterior.length >= 9) this.addPolygon(poly);
      return;
    }

    // 属性
    if (this.building && name in ATTR_TAGS && this.collectingText) {
      const key = ATTR_TAGS[name]!;
      const raw = this.takeText().trim();
      if (raw !== '' && this.building.attrs[key] === undefined) {
        if (NUMERIC_ATTRS.has(key)) {
          const n = Number(raw);
          if (isKnownNumber(key, n)) (this.building.attrs as Record<string, unknown>)[key] = n;
        } else {
          (this.building.attrs as Record<string, unknown>)[key] = raw;
        }
      }
      return;
    }

    // 場所の手がかりを戻す
    if (depth === this.lod1Depth) this.lod1Depth = -1;
    if (depth === this.lod2Depth) this.lod2Depth = -1;
    if (depth === this.installationDepth) this.installationDepth = -1;
    if (depth === this.installationGeomDepth) this.installationGeomDepth = -1;
    if (depth === this.installation3GeomDepth) this.installation3GeomDepth = -1;
    if (depth === this.lod3Depth) this.lod3Depth = -1;
    if (depth === this.openingDepth) {
      this.openingDepth = -1;
      this.openingKind = null;
    }
    if (depth === this.roomDepth) this.roomDepth = -1;
    if (depth === this.surfaceDepth) {
      this.surfaceDepth = -1;
      this.surfaceKind = null;
    }
    if (depth === this.roadLod1Depth) this.roadLod1Depth = -1;

    if (depth === this.buildingDepth && this.building) {
      const b = this.building;
      this.building = null;
      this.buildingDepth = -1;
      this.handlers.onBuilding?.(b);
    } else if (depth === this.roadDepth && this.road) {
      const r = this.road;
      this.road = null;
      this.roadDepth = -1;
      if (r.polygons.length > 0) this.handlers.onRoad?.(r);
    }
  }

  private addPolygon(poly: Polygon): void {
    if (this.building) {
      if (this.installationDepth >= 0) {
        if (this.installationGeomDepth >= 0) this.building.installations.push(poly);
        else if (this.installation3GeomDepth >= 0) this.building.installations3.push(poly);
      } else if (this.lod3Depth >= 0) {
        this.building.lod3.push({ kind: this.openingKind ?? this.surfaceKind ?? 'other', polygon: poly });
      } else if (this.lod1Depth >= 0) {
        this.building.lod1.push(poly);
      } else if (this.lod2Depth >= 0) {
        this.building.lod2.push({ kind: this.surfaceKind ?? 'other', polygon: poly });
      }
    } else if (this.road) {
      this.road.polygons.push(poly);
    }
  }
}

/** 文字列の流れ（ReadableStream など）を最後まで読み、建物・道路を渡す */
export async function readCityGml(
  chunks: AsyncIterable<string>,
  handlers: CityGmlHandlers,
): Promise<void> {
  const reader = new CityGmlReader(handlers);
  for await (const chunk of chunks) reader.feed(chunk);
  reader.close();
}
