// 建物・道路を、切り出した範囲の中心を原点にした三角形の集まりにする。
import type { Building, Polygon, Road, SurfaceKind } from './citygml.js';
import { LocalProjector } from './geo.js';
import { clipRingToSquare, triangulatePolygon } from './geometry.js';

export type PartName = 'wall' | 'roof' | 'detail' | 'road' | 'ground';

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
}

export interface SceneOptions {
  /** 中心 */
  projector: LocalProjector;
  /** 切り出す正方形の一辺の半分（m） */
  half: number;
  /** 1 = 箱型（軽い）、2 = 屋根の形あり */
  lod: 1 | 2;
  /** ベランダなどの付属物を入れる（LOD2 のときだけ） */
  installations?: boolean;
}

export interface BuildingInfo {
  id: string;
  buildingId?: string;
  usage?: string;
  measuredHeight?: number;
  /** GLB の中での高さ（m） */
  modelHeight: number;
  storeys?: number;
  yearOfConstruction?: number;
  name?: string;
  city?: string;
  /** 中心から見た位置（m） */
  x: number;
  z: number;
  lodUsed: 1 | 2;
  /** 入れた付属物の面の数 */
  installationFaces: number;
}

/** 道路を地面よりわずかに上に置く高さ（m）。地面とちらつかないため */
export const ROAD_HEIGHT = 0.15;

export class SceneBuilder {
  readonly parts: Record<PartName, MeshPart>;
  readonly buildings: BuildingInfo[] = [];
  readonly cities = new Set<string>();
  private readonly seen = new Set<string>();
  roadCount = 0;
  /** 範囲内の建物のうち、形が読めずに省いた数 */
  skippedBuildings = 0;

  /** 付属物を入れた建物の数 */
  buildingsWithInstallations = 0;

  constructor(private readonly opt: SceneOptions) {
    this.parts = {
      wall: new MeshPart(),
      roof: new MeshPart(),
      detail: new MeshPart(),
      road: new MeshPart(),
      ground: new MeshPart(),
    };
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
    this.seen.add(b.id);

    const useLod2 = this.opt.lod === 2 && b.lod2.length > 0;
    const surfaces: { kind: SurfaceKind; polygon: Polygon }[] = useLod2
      ? b.lod2
      : b.lod1.map((polygon) => ({ kind: 'other' as SurfaceKind, polygon }));

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

    let added = 0;
    for (const s of local) {
      // 底の面は見えないので入れない（三角形を減らす）
      if (s.kind === 'ground') continue;
      for (let i = 1; i < s.exterior.length; i += 3) s.exterior[i]! -= minY;
      for (const r of s.interiors) for (let i = 1; i < r.length; i += 3) r[i]! -= minY;
      const tri = triangulatePolygon(s.exterior, s.interiors);
      if (!tri) continue;
      if (s.kind === 'other' && tri.normal[1] < -0.9) continue; // 下向きの面＝底
      const isRoof = s.kind === 'roof' || (s.kind === 'other' && tri.normal[1] > 0.3);
      (isRoof ? this.parts.roof : this.parts.wall).addTriangles(tri.positions, tri.indices, tri.normal);
      added++;
    }
    if (added === 0) {
      this.skippedBuildings++;
      return false;
    }

    // 付属物（ベランダ・ひさし・屋上の設備など）。本体と同じ高さだけずらす
    let installationFaces = 0;
    if (useLod2 && this.opt.installations) {
      for (const p of b.installations) {
        const ext = this.toLocal(p.exterior);
        const holes = p.interiors.map((r) => this.toLocal(r));
        for (let i = 1; i < ext.length; i += 3) ext[i]! -= minY;
        for (const r of holes) for (let i = 1; i < r.length; i += 3) r[i]! -= minY;
        const tri = triangulatePolygon(ext, holes);
        if (!tri) continue;
        this.parts.detail.addTriangles(tri.positions, tri.indices, tri.normal);
        installationFaces++;
      }
      if (installationFaces > 0) this.buildingsWithInstallations++;
    }

    if (b.attrs.city) this.cities.add(b.attrs.city);
    this.buildings.push({
      id: b.id,
      buildingId: b.attrs.buildingId,
      usage: b.attrs.usage,
      measuredHeight: b.attrs.measuredHeight,
      modelHeight: Math.round((maxY - minY) * 100) / 100,
      storeys: b.attrs.storeysAboveGround,
      yearOfConstruction: b.attrs.yearOfConstruction,
      name: b.attrs.name,
      city: b.attrs.city,
      x: Math.round(cx * 10) / 10,
      z: Math.round(cz * 10) / 10,
      lodUsed: useLod2 ? 2 : 1,
      installationFaces,
    });
    return true;
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

  /** 範囲全体に、薄い地面の板（2枚の三角形）を敷く */
  addGround(): void {
    const h = this.opt.half;
    this.parts.ground.addTriangles(
      [-h, 0, -h, -h, 0, h, h, 0, h, h, 0, -h],
      [0, 1, 2, 0, 2, 3],
      [0, 1, 0],
    );
  }
}
