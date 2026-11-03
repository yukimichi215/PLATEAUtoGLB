// 建物・道路を、切り出した範囲の中心を原点にした三角形の集まりにする。
import type { Building, Lod3Kind, Polygon, Road } from './citygml.js';
import { LocalProjector } from './geo.js';
import earcut from 'earcut';
import { clipPolygonByRing, clipRingToSquare, pointInRing, triangulatePolygon } from './geometry.js';
import { extrudeDown, footprintArea, MIN_FOOTPRINT_M2, type Solid } from './solid.js';
import { knownUsageCode, usageName } from './usage.js';

export type PartName = 'wall' | 'roof' | 'detail' | 'window' | 'door' | 'road' | 'ground';
export type Parts = Record<PartName, MeshPart>;

/** 出力の部品のまとまり（GLB のノード名・OBJ の o の名前） */
export type GroupName = 'Buildings' | 'Roads' | 'Ground';

/**
 * 出力する1つの部品（GLB のノード・OBJ の o）。parts のうち、group に属する種類（建物なら壁・屋根など）だけを使う。
 * 建物をまとめるときは name が group と同じ1つ、1棟ずつ分けるときは建物ごとに1つ。
 */
export interface ModelPiece {
  name: string;
  group: GroupName;
  parts: Parts;
  /** GLB のノードの extras に入れる情報（建物を1棟ずつ分けたときの、建物の名前・用途など） */
  extras?: Record<string, unknown>;
}

/** 1種類の材質で描く三角形の集まり。法線は面ごと（角ばったローポリの見た目） */
export class MeshPart {
  positions: number[] = [];
  normals: number[] = [];
  indices: number[] = [];
  get vertexCount(): number {
    return this.positions.length / 3;
  }
  get triangleCount(): number {
    return this.indices.length / 3;
  }

  addTriangles(positions: number[], indices: number[], normal: [number, number, number]): void {
    const base = this.vertexCount;
    for (let i = 0; i < positions.length; i += 3) {
      this.positions.push(positions[i]!, positions[i + 1]!, positions[i + 2]!);
      this.normals.push(normal[0], normal[1], normal[2]);
    }
    for (const idx of indices) this.indices.push(base + idx);
  }

  /**
   * 三角形を、三角形ごとに別の頂点として足す（法線は面ごと＝角ばった見た目）。
   * positions は共有された頂点、indices はその番号。
   */
  addFlatTriangles(positions: ArrayLike<number>, indices: ArrayLike<number>): void {
    const p = positions;
    for (let t = 0; t < indices.length; t += 3) {
      const [a, b, c] = [indices[t]! * 3, indices[t + 1]! * 3, indices[t + 2]! * 3];
      const e1 = [p[b]! - p[a]!, p[b + 1]! - p[a + 1]!, p[b + 2]! - p[a + 2]!];
      const e2 = [p[c]! - p[a]!, p[c + 1]! - p[a + 1]!, p[c + 2]! - p[a + 2]!];
      let nx = e1[1]! * e2[2]! - e1[2]! * e2[1]!;
      let ny = e1[2]! * e2[0]! - e1[0]! * e2[2]!;
      let nz = e1[0]! * e2[1]! - e1[1]! * e2[0]!;
      const len = Math.hypot(nx, ny, nz);
      if (len > 1e-12) {
        nx /= len; ny /= len; nz /= len;
      } else {
        nx = 0; ny = 1; nz = 0;
      }
      for (const v of [a, b, c]) {
        this.indices.push(this.vertexCount);
        this.positions.push(p[v]!, p[v + 1]!, p[v + 2]!);
        this.normals.push(nx, ny, nz);
      }
    }
  }
}

/**
 * 閉じた形の柱の下の端の仮の高さ。台座の厚さは縮尺が決まるまで分からないので、
 * いったんこの値で作り、あとで（print.ts で）本当の高さに置き換える。
 */
export const SOLID_BOTTOM = -1e6;
/** 閉じた形の道路の上の面の仮の高さ（同じく、あとで置き換える） */
export const SOLID_ROAD_TOP = -2e6;

export interface SceneOptions {
  /** 中心 */
  projector: LocalProjector;
  /** 切り出す正方形の一辺の半分（m） */
  half: number;
  /** 1 = 箱型（軽い）、2 = 屋根の形あり、3 = 窓・扉まで（LOD3 のない建物は LOD2 → LOD1 で代用） */
  lod: 1 | 2 | 3;
  /** ベランダなどの付属物を入れる（LOD2・LOD3 のとき） */
  installations?: boolean;
  /**
   * 3Dプリンタ向けの閉じた形にする。建物は屋根の面を真下へ押し出した柱、道路は薄い板にする。
   * 窓・扉・付属物は細かすぎて印刷できないので入れない。
   */
  solid?: boolean;
  /** 建物の高さだけを何倍にするか（高さの強調。1 でそのまま）。幅・奥行き・道路・台座は変えない */
  heightScale?: number;
  /** 建物を1棟ずつ別の部品にする（編集ソフトで1棟ずつ選べるように）。閉じた形（solid）のときは使えない */
  separate?: boolean;
  /**
   * 囲んだ範囲（ローカル座標の多角形 [x, z, x, z, ...]。上から見て正方形 half の中）。
   * 指定すると、中心がこの中にある建物だけを入れ、道路・地面はこの形で切る。指定しないときは正方形 half
   */
  clip?: number[];
}

export interface BuildingInfo {
  id: string;
  buildingId?: string;
  /** 用途のコード（PLATEAU のコードリスト。例：431。「不明」（461）のときはなし。表にないコードもそのまま） */
  usage?: string;
  /** 用途の名前（例：運輸倉庫施設。「不明」・知らないコードのときはなし） */
  usageName?: string;
  measuredHeight?: number;
  /** GLB の中での高さ（m） */
  modelHeight: number;
  storeys?: number;
  yearOfConstruction?: number;
  /** 構造の種類のコード（601 = 木造・土蔵造 など。データにないときはなし） */
  structureType?: string;
  name?: string;
  city?: string;
  /** 上から見た建物の大きさ（建築面積に近い値、m²）。シチュエーションの根拠の数値に使う */
  footprintM2: number;
  /** 中心から見た位置（m） */
  x: number;
  z: number;
  lodUsed: 1 | 2 | 3;
  /** 入れた付属物の面の数 */
  installationFaces: number;
}

/** 窓・扉を壁から外側へ浮かせる距離（m） */
export const OPENING_OFFSET = 0.04;

/**
 * 面を、建物の中心から離れる向き（水平方向）へ距離 d だけ動かす。
 * 元データの面の表裏の向きはそろっていないことがあるので、法線の向きではなく建物の中心を基準にする。
 */
function offsetOutward(positions: number[], normal: [number, number, number], bx: number, bz: number, d: number): void {
  let nx = normal[0];
  let nz = normal[2];
  const len = Math.hypot(nx, nz);
  if (len < 0.3) return; // ほぼ水平な面（天窓など）は動かさない
  nx /= len;
  nz /= len;
  let fx = 0;
  let fz = 0;
  const n = positions.length / 3;
  for (let i = 0; i < positions.length; i += 3) {
    fx += positions[i]!;
    fz += positions[i + 2]!;
  }
  fx = fx / n - bx;
  fz = fz / n - bz;
  if (fx * nx + fz * nz < 0) {
    nx = -nx;
    nz = -nz;
  }
  for (let i = 0; i < positions.length; i += 3) {
    positions[i]! += nx * d;
    positions[i + 2]! += nz * d;
  }
}

/** 道路を地面よりわずかに上に置く高さ（m）。地面とちらつかないため */
export const ROAD_HEIGHT = 0.15;

/** 種類ごとの空の部品 */
export function newParts(): Parts {
  return {
    wall: new MeshPart(),
    roof: new MeshPart(),
    detail: new MeshPart(),
    window: new MeshPart(),
    door: new MeshPart(),
    road: new MeshPart(),
    ground: new MeshPart(),
  };
}

export class SceneBuilder {
  /** 建物（まとめるとき）・道路・地面の三角形。建物を1棟ずつ分けるときは道路・地面だけが入る */
  readonly parts: Parts;
  /** 3Dプリンタ用（solid）のとき：まとめる前の閉じた形（建物ごとの柱の集まり・道路の板） */
  readonly solids: { buildings: Solid[][]; roads: Solid[] } = { buildings: [], roads: [] };
  readonly buildings: BuildingInfo[] = [];
  readonly cities = new Set<string>();
  private readonly seen = new Set<string>();
  roadCount = 0;
  /** 3Dプリンタ用：solids.roads の板が、何番目に入れた道路のものか（1本の道路が複数の板になることがある） */
  private readonly solidRoadOf: number[] = [];
  /** 範囲内の建物のうち、形が読めずに省いた数 */
  skippedBuildings = 0;

  /** 付属物を入れた建物の数 */
  buildingsWithInstallations = 0;
  /** 3Dプリンタ用：形がくずれていて閉じた形にできず、入れられなかった屋根の面・道路の数 */
  droppedFaces = 0;
  /** 窓・扉まである形（LOD3）で入れた建物の数 */
  lod3Buildings = 0;

  /** 建物を1棟ずつ分けるとき（separate）の、建物ごとの部品（入れた順） */
  private readonly buildingPieces: ModelPiece[] = [];
  private readonly pieceNames = new Set<string>();

  constructor(private readonly opt: SceneOptions) {
    if (opt.separate && opt.solid) throw new Error('閉じた形（3Dプリンタ用）では建物を1棟ずつ分けられません');
    this.parts = newParts();
  }

  /** 出力する部品の一覧。建物（まとめて1つ、または1棟ずつ）→ 道路 → 地面の順 */
  pieces(): ModelPiece[] {
    const buildings: ModelPiece[] = this.opt.separate
      ? this.buildingPieces
      : [{ name: 'Buildings', group: 'Buildings', parts: this.parts }];
    return [
      ...buildings,
      { name: 'Roads', group: 'Roads', parts: this.parts },
      { name: 'Ground', group: 'Ground', parts: this.parts },
    ];
  }

  /**
   * 建物の部品の名前。PLATEAU の建物 ID（なければ元データの ID）。名前のある建物は「名前_ID」。
   * 重なったら番号を付ける
   */
  private pieceName(info: BuildingInfo): string {
    const id = info.buildingId || info.id || 'building';
    const base = info.name ? `${info.name}_${id}` : id;
    let name = base;
    for (let i = 2; this.pieceNames.has(name); i++) name = `${base}_${i}`;
    this.pieceNames.add(name);
    return name;
  }

  /**
   * 3Dプリンタ用：keep[i] が false の建物を一覧（buildings）から除く。
   * solids.buildings と buildings は同じ順に1棟ずつ入れている（addBuilding）ので、番号で対応させる
   */
  keepBuildings(keep: boolean[]): void {
    if (keep.length !== this.buildings.length) throw new Error('建物の形と一覧の数が合いません');
    const kept = this.buildings.filter((_, i) => keep[i]);
    for (const [i, b] of this.buildings.entries()) if (!keep[i] && b.lodUsed === 3) this.lod3Buildings--;
    this.buildings.splice(0, this.buildings.length, ...kept);
  }

  /** 3Dプリンタ用：keep[i] が false の道路の板を外したあとの、道路の本数にする（板が1枚でも残れば数える） */
  keepRoads(keep: boolean[]): void {
    if (keep.length !== this.solidRoadOf.length) throw new Error('道路の形と一覧の数が合いません');
    this.roadCount = new Set(this.solidRoadOf.filter((_, i) => keep[i])).size;
  }

  /**
   * 建物の部品の extras。データにある項目だけを入れる（ない項目は作らない）。
   * 高さは PLATEAU の計測値（measuredHeight）と、この 3D モデルでの高さ（modelHeight。高さの強調をかけたあと）の両方
   */
  private pieceExtras(info: BuildingInfo): Record<string, unknown> {
    const all: Record<string, unknown> = {
      plateauId: info.id,
      buildingId: info.buildingId,
      name: info.name,
      usage: info.usage,
      usageName: info.usageName,
      yearOfConstruction: info.yearOfConstruction,
      storeysAboveGround: info.storeys,
      measuredHeight: info.measuredHeight,
      modelHeight: info.modelHeight,
      heightScale: this.heightScale !== 1 ? this.heightScale : undefined,
      cityCode: info.city,
      lodUsed: info.lodUsed,
    };
    return Object.fromEntries(Object.entries(all).filter(([, v]) => v !== undefined && v !== ''));
  }

  /** 緯度経度の多角形をローカル座標（x, 標高, z）にする */
  private toLocal(coords: number[]): number[] {
    const out: number[] = new Array(coords.length);
    for (let i = 0; i < coords.length; i += 3) {
      const [x, z] = this.opt.projector.toXZ(coords[i]!, coords[i + 1]!);
      out[i] = x;
      out[i + 1] = coords[i + 2]!;
      out[i + 2] = z;
    }
    return out;
  }

  /** 範囲内なら追加して true を返す */
  addBuilding(b: Building): boolean {
    if (this.seen.has(b.id)) return false;
    const footprint = b.lod1.length > 0 ? b.lod1 : b.lod2.map((s) => s.polygon);
    if (footprint.length === 0) return false;

    // 建物の中心（全頂点の平均）が範囲内のものだけ使う
    let sumLat = 0;
    let sumLon = 0;
    let n = 0;
    for (const p of footprint) {
      for (let i = 0; i < p.exterior.length; i += 3) {
        sumLat += p.exterior[i]!;
        sumLon += p.exterior[i + 1]!;
        n++;
      }
    }
    const [cx, cz] = this.opt.projector.toXZ(sumLat / n, sumLon / n);
    if (Math.abs(cx) > this.opt.half || Math.abs(cz) > this.opt.half) return false;
    if (this.opt.clip && !pointInRing(cx, cz, this.opt.clip)) return false;
    this.seen.add(b.id);

    const useLod3 = this.opt.lod === 3 && b.lod3.length > 0;
    const useLod2 = !useLod3 && this.opt.lod >= 2 && b.lod2.length > 0;
    const surfaces: { kind: Lod3Kind; polygon: Polygon }[] = useLod3
      ? b.lod3
      : useLod2
        ? b.lod2
        : b.lod1.map((polygon) => ({ kind: 'other' as Lod3Kind, polygon }));

    // 地面（建物のいちばん低い点）を高さ 0 にそろえる。地形はまだ入れないので、坂の町でも平らに並べる
    const local = surfaces.map((s) => ({
      kind: s.kind,
      exterior: this.toLocal(s.polygon.exterior),
      interiors: s.polygon.interiors.map((r) => this.toLocal(r)),
    }));
    let minY = Infinity;
    let maxY = -Infinity;
    for (const s of local) {
      for (let i = 1; i < s.exterior.length; i += 3) {
        minY = Math.min(minY, s.exterior[i]!);
        maxY = Math.max(maxY, s.exterior[i]!);
      }
    }
    if (!Number.isFinite(minY)) return false;

    if (this.opt.solid) {
      const lodUsed = this.addSolidBuilding(b, local, useLod3 ? 3 : useLod2 ? 2 : 1, minY);
      if (lodUsed === 0) {
        this.skippedBuildings++;
        return false;
      }
      this.recordBuilding(b, cx, cz, (maxY - minY) * this.heightScale, lodUsed, 0);
      if (lodUsed === 3) this.lod3Buildings++;
      return true;
    }

    // 建物の中心（ローカル座標）。窓・扉を外側へ少し浮かせる向きを決めるのに使う
    const [bx, bz] = [cx, cz];
    // 1棟ずつ分けるときは、この建物だけの部品に入れる
    const target = this.opt.separate ? newParts() : this.parts;
    let added = 0;
    for (const s of local) {
      // 底の面は見えないので入れない（三角形を減らす）
      if (s.kind === 'ground') continue;
      this.lift(s.exterior, minY);
      for (const r of s.interiors) this.lift(r, minY);
      const tri = triangulatePolygon(s.exterior, s.interiors);
      if (!tri) continue;
      if (s.kind === 'window' || s.kind === 'door') {
        // 窓・扉は壁と同じ面に重なっていることが多く、そのままだとちらつくので外側へ少し浮かせる
        offsetOutward(tri.positions, tri.normal, bx, bz, OPENING_OFFSET);
        target[s.kind].addTriangles(tri.positions, tri.indices, tri.normal);
        added++;
        continue;
      }
      if (s.kind === 'other' && tri.normal[1] < -0.9) continue; // 下向きの面＝底
      const isRoof = s.kind === 'roof' || (s.kind === 'other' && tri.normal[1] > 0.3);
      (isRoof ? target.roof : target.wall).addTriangles(tri.positions, tri.indices, tri.normal);
      added++;
    }
    if (added === 0) {
      this.skippedBuildings++;
      return false;
    }

    // 付属物（ベランダ・ひさし・屋上の設備など）。本体と同じ高さだけずらす
    let installationFaces = 0;
    if ((useLod2 || useLod3) && this.opt.installations) {
      for (const p of useLod3 ? b.installations3 : b.installations) {
        const ext = this.toLocal(p.exterior);
        const holes = p.interiors.map((r) => this.toLocal(r));
        this.lift(ext, minY);
        for (const r of holes) this.lift(r, minY);
        const tri = triangulatePolygon(ext, holes);
        if (!tri) continue;
        target.detail.addTriangles(tri.positions, tri.indices, tri.normal);
        installationFaces++;
      }
      if (installationFaces > 0) this.buildingsWithInstallations++;
    }

    if (useLod3) this.lod3Buildings++;
    this.recordBuilding(b, cx, cz, (maxY - minY) * this.heightScale, useLod3 ? 3 : useLod2 ? 2 : 1, installationFaces);
    if (this.opt.separate) {
      const info = this.buildings[this.buildings.length - 1]!;
      this.buildingPieces.push({ name: this.pieceName(info), group: 'Buildings', parts: target, extras: this.pieceExtras(info) });
    }
    return true;
  }

  private get heightScale(): number {
    return this.opt.heightScale ?? 1;
  }

  /**
   * 建物の多角形（x, 高さ, z の並び）の高さを、建物のいちばん低い点 minY が 0 になるようにずらし、
   * 高さの強調の倍率をかける（その場で書き換えて、同じ配列を返す）
   */
  private lift(ring: number[], minY: number): number[] {
    const k = this.heightScale;
    for (let i = 1; i < ring.length; i += 3) ring[i] = (ring[i]! - minY) * k;
    return ring;
  }

  private recordBuilding(b: Building, cx: number, cz: number, height: number, lodUsed: 1 | 2 | 3, installationFaces: number): void {
    if (b.attrs.city) this.cities.add(b.attrs.city);
    this.buildings.push({
      id: b.id,
      buildingId: b.attrs.buildingId,
      usage: knownUsageCode(b.attrs.usage),
      usageName: usageName(b.attrs.usage),
      measuredHeight: b.attrs.measuredHeight,
      modelHeight: Math.round(height * 100) / 100,
      storeys: b.attrs.storeysAboveGround,
      yearOfConstruction: b.attrs.yearOfConstruction,
      structureType: b.attrs.structureType,
      name: b.attrs.name,
      city: b.attrs.city,
      footprintM2: Math.round(this.footprintOf(b)),
      x: Math.round(cx * 10) / 10,
      z: Math.round(cz * 10) / 10,
      lodUsed,
      installationFaces,
    });
  }

  /**
   * 上から見た建物の大きさ（m²）。閉じた形は、上を向いた面と下を向いた面を真上から見た広さが同じなので、
   * すべての面を真上から見た広さの合計の半分にする（面の表裏の向きがそろっていなくても数えられる）。
   */
  private footprintOf(b: Building): number {
    const faces = b.lod1.length > 0 ? b.lod1 : b.lod2.map((s) => s.polygon);
    let sum = 0;
    for (const p of faces) sum += footprintArea(this.toLocal(p.exterior));
    return sum / 2;
  }

  /**
   * 閉じた形の建物を足す。上を向いた面（屋根。箱型なら上の面）を、それぞれ真下へ押し出した柱にする。
   * 選んだ細かさに屋根の面がなければ、屋根の形（LOD2）→ 箱型（LOD1）の順に代わりを使う。
   * 使った細かさを返す（どれでも作れなければ 0）。
   */
  private addSolidBuilding(
    b: Building,
    local: { kind: Lod3Kind; exterior: number[]; interiors: number[][] }[],
    lod: 1 | 2 | 3,
    minY: number,
  ): 0 | 1 | 2 | 3 {
    const candidates: { lod: 1 | 2 | 3; surfaces: typeof local }[] = [{ lod, surfaces: local }];
    if (lod > 2 && b.lod2.length > 0) candidates.push({ lod: 2, surfaces: b.lod2.map((s) => this.localSurface(s.kind, s.polygon)) });
    if (lod > 1 && b.lod1.length > 0) candidates.push({ lod: 1, surfaces: b.lod1.map((p) => this.localSurface('other', p)) });
    for (const { lod: candidateLod, surfaces } of candidates) {
      const solids: Solid[] = [];
      let failed = 0;
      for (const s of surfaces) {
        if (s.kind !== 'roof' && s.kind !== 'other') continue;
        // 上か下を向いた面だけ使う（壁は使わない）。元データの面の表裏はそろっていないことがあるので、向きの符号は見ない
        const tri = triangulatePolygon(s.exterior, s.interiors);
        if (!tri || Math.abs(tri.normal[1]) < (s.kind === 'roof' ? 0.05 : 0.3)) continue;
        // 範囲からはみ出した部分は、柱にしてから立体として切り落とす（print.ts）。
        // 多角形のまま切ると、へこんだ形で幅 0 の橋ができて閉じた形にならないことがあるため
        const ext = this.lift([...s.exterior], minY);
        const holes = s.interiors.map((r) => this.lift([...r], minY));
        // 地面の高さにある面（建物の底）は使わない
        let top = -Infinity;
        for (let i = 1; i < ext.length; i += 3) top = Math.max(top, ext[i]!);
        if (top < 0.05) continue;
        // 上から見てごく小さな面（壁に近い面・小さな飾り）は、印刷では見えないので数えずに省く
        if (footprintArea(ext) < MIN_FOOTPRINT_M2) continue;
        const solid = extrudeDown(ext, holes, SOLID_BOTTOM);
        if (solid) solids.push(solid);
        else failed++;
      }
      if (solids.length > 0) {
        this.solids.buildings.push(solids);
        this.droppedFaces += failed;
        return candidateLod;
      }
    }
    return 0;
  }

  private localSurface(kind: Lod3Kind, polygon: Polygon) {
    return { kind, exterior: this.toLocal(polygon.exterior), interiors: polygon.interiors.map((r) => this.toLocal(r)) };
  }

  /** 道路を範囲で切り取り、平らにして追加する */
  addRoad(r: Road): boolean {
    if (this.seen.has(r.id)) return false;
    let added = false;
    for (const p of r.polygons) {
      const toXZ = (coords: number[]) => {
        const out: number[] = [];
        for (let i = 0; i < coords.length; i += 3) {
          const [x, z] = this.opt.projector.toXZ(coords[i]!, coords[i + 1]!);
          out.push(x, z);
        }
        return out;
      };
      if (this.opt.clip) {
        // 囲んだ範囲（へこんでいてもよい）で切り取る。囲んだ形にかからない道路は入れない（本数にも数えない）。
        // 3Dプリンタ用は、下で切らない板を作り、あとで立体として切り落とす
        const cut = clipPolygonByRing(toXZ(p.exterior), p.interiors.map(toXZ), this.opt.clip);
        if (cut.indices.length === 0) continue;
        if (!this.opt.solid) {
          this.addUpward(this.parts.road, cut.points, cut.indices, ROAD_HEIGHT);
          added = true;
          continue;
        }
      }
      const ext = clipRingToSquare(toXZ(p.exterior), this.opt.half);
      if (ext.length < 6) continue;
      const holes = p.interiors
        .map((h) => clipRingToSquare(toXZ(h), this.opt.half))
        .filter((h) => h.length >= 6);
      const to3 = (ring: number[]) => {
        const out: number[] = [];
        for (let i = 0; i < ring.length; i += 2) out.push(ring[i]!, ROAD_HEIGHT, ring[i + 1]!);
        return out;
      };
      if (this.opt.solid) {
        // 3Dプリンタ用は切らずに板を作り、範囲の外はあとで立体として切り落とす（print.ts）。
        // 多角形のまま切ると、へこんだ形で幅 0 の橋ができて閉じた形にならないことがあるため
        const ring = to3(toXZ(p.exterior));
        if (footprintArea(ring) < MIN_FOOTPRINT_M2) continue;
        const solid = extrudeDown(ring, p.interiors.map((h) => to3(toXZ(h))), SOLID_BOTTOM);
        if (!solid) {
          this.droppedFaces++;
          continue;
        }
        for (let i = 1; i < solid.positions.length; i += 3) {
          if (solid.positions[i] === ROAD_HEIGHT) solid.positions[i] = SOLID_ROAD_TOP;
        }
        this.solids.roads.push(solid);
        this.solidRoadOf.push(this.roadCount); // この道路が入ったときの番号
        added = true;
        continue;
      }
      const tri = triangulatePolygon(to3(ext), holes.map(to3));
      if (!tri) continue;
      // 道路は必ず上向きにする
      if (tri.normal[1] < 0) {
        for (let i = 0; i < tri.indices.length; i += 3) {
          const t = tri.indices[i + 1]!;
          tri.indices[i + 1] = tri.indices[i + 2]!;
          tri.indices[i + 2] = t;
        }
      }
      this.parts.road.addTriangles(tri.positions, tri.indices, [0, 1, 0]);
      added = true;
    }
    if (added) {
      this.seen.add(r.id);
      this.roadCount++;
    }
    return added;
  }

  /** 囲んだ範囲（3Dプリンタ用で台座・切り落としに使う）。指定がなければ undefined */
  get clipRing(): number[] | undefined {
    return this.opt.clip;
  }

  /** 平らな三角形（2次元の頂点 [x, z, ...]）を高さ y に置き、上向きにそろえて足す */
  private addUpward(part: MeshPart, points: number[], indices: ArrayLike<number>, y: number): void {
    const positions: number[] = [];
    for (let i = 0; i < points.length; i += 2) positions.push(points[i]!, y, points[i + 1]!);
    const idx = Array.from(indices);
    for (let t = 0; t < idx.length; t += 3) {
      const a = idx[t]!, b = idx[t + 1]!, c = idx[t + 2]!;
      // 上から見た向き（+Y を向くなら正）。逆なら並びを入れ替える
      const cy = (points[b * 2 + 1]! - points[a * 2 + 1]!) * (points[c * 2]! - points[a * 2]!) -
        (points[b * 2]! - points[a * 2]!) * (points[c * 2 + 1]! - points[a * 2 + 1]!);
      if (cy < 0) [idx[t + 1], idx[t + 2]] = [c, b];
    }
    part.addTriangles(positions, idx, [0, 1, 0]);
  }

  /** 範囲全体に、薄い地面の板（2枚の三角形）を敷く */
  addGround(): void {
    if (this.opt.clip) {
      // 囲んだ範囲の形の地面
      const ring = this.opt.clip;
      this.addUpward(this.parts.ground, ring, earcut(ring, undefined, 2), 0);
      return;
    }
    const h = this.opt.half;
    this.parts.ground.addTriangles(
      [-h, 0, -h, -h, 0, h, h, 0, h, h, 0, -h],
      [0, 1, 2, 0, 2, 3],
      [0, 1, 0],
    );
  }
}
