// 範囲を選ぶ地図（Leaflet）。正方形・四角（大きさを選んで、ドラッグや地図を押して動かす）と、自由な形（クリックで点を打つ）で囲む操作。
// 地図の部品（Leaflet）への依存は、このファイルの中だけにまとめる。
import L from 'leaflet';
import 'leaflet/dist/leaflet.css';
import { areaOfPolygon, dedupePolygon, MAX_SIZE, polygonIssue, type PolygonIssue } from '../core/area.js';
import type { CoverageCell } from '../core/coverage.js';
import { LocalProjector, metersPerDegree, type LatLon, type LatLonBox } from '../core/geo.js';
import { MAP_TILES } from './map-config.js';

/** 範囲の選び方。square：中心と一辺の正方形、rect：横・縦の長さを選んだ四角、polygon：地図で自由な形を描く */
export type AreaMode = 'square' | 'rect' | 'polygon';

export interface DrawState {
  mode: AreaMode;
  /** 囲んだ範囲（rect のときは四角の4つの角。square のとき・自由な形を描いている途中は undefined） */
  polygon?: LatLon[];
  /** 描いている途中の点の数（polygon のとき） */
  drawingPoints: number;
  /** 囲んだ範囲の問題 */
  issue?: PolygonIssue;
  /** 囲んだ範囲がちょうど入る正方形の一辺（m）。自由な形を描いている途中も、打った点から出す */
  size?: number;
}

const STYLE: L.PathOptions = { color: '#1f6feb', weight: 2, fillOpacity: 0.12 };
/** PLATEAU の建物データがある所（3次メッシュ）の枠 */
const COVERAGE_STYLE: L.PathOptions = { color: '#2e7d32', weight: 1, opacity: 0.6, fillColor: '#43a047', fillOpacity: 0.08, interactive: false };
const BAD_STYLE: L.PathOptions = { color: '#c62828', weight: 2, fillOpacity: 0.12 };
/** 最初の点のこの距離（画面の px）の中をクリックすると、囲み終える */
const CLOSE_PX = 14;
/** 直前の点のこの距離（画面の px）の中のクリックは、点を足さない（ダブルクリックで同じ点が2つできないように） */
const SAME_POINT_PX = 6;

export class AreaMap {
  private map: L.Map;
  private layer = L.layerGroup();
  /** データのある所の枠（描いた範囲より下に出す） */
  private coverageLayer = L.layerGroup();
  private viewListener: ((view: LatLonBox) => void) | null = null;
  private mode: AreaMode = 'square';
  private center: LatLon | null = null;
  private size = 300;
  private points: LatLon[] = [];
  private closed = false;
  /** 四角の横・縦の長さ（m） */
  private rectW = 300;
  private rectH = 300;
  /** 正方形・四角をドラッグで動かしているとき：押した所と中心のずれ（緯度・経度） */
  private moving: { dLat: number; dLon: number; pointerId: number } | null = null;
  /** ドラッグで動かした直後のクリックは、移動として扱わない */
  private justMoved = false;
  private centerListener: ((center: LatLon) => void) | null = null;

  private attribution = '';

  constructor(
    el: HTMLElement,
    private onChange: (s: DrawState) => void,
    attributionLabel: string,
  ) {
    this.map = L.map(el, { minZoom: MAP_TILES.minZoom, maxZoom: MAP_TILES.maxZoom, zoomSnap: 0.5 });
    this.map.attributionControl.setPrefix('<a href="https://leafletjs.com" target="_blank" rel="noopener noreferrer">Leaflet</a>');
    L.tileLayer(MAP_TILES.url, {
      minZoom: MAP_TILES.minZoom,
      maxZoom: MAP_TILES.maxZoom,
    }).addTo(this.map);
    this.coverageLayer.addTo(this.map);
    this.layer.addTo(this.map);
    this.map.on('moveend', () => this.viewListener?.(this.view()));
    this.setAttributionLabel(attributionLabel);
    this.map.on('click', (ev: L.LeafletMouseEvent) => this.onClick(ev));
    // 正方形・四角は、中を押したまま動かすと移動する（指でも動かせるように pointer の出来事を使う）。
    // 地図を動かす操作より先に受け取るため、capture で受ける（中を押したときだけ地図の移動を止める）
    const c = this.map.getContainer();
    c.addEventListener('pointerdown', (ev) => this.onPointerDown(ev), true);
    c.addEventListener('pointermove', (ev) => this.onPointerMove(ev));
    c.addEventListener('pointerup', (ev) => this.onPointerUp(ev));
    c.addEventListener('pointercancel', (ev) => this.onPointerUp(ev));
  }

  /** 正方形・四角を動かして、中心が変わったときに呼ぶ関数 */
  onCenterChange(fn: (center: LatLon) => void): void {
    this.centerListener = fn;
  }

  /** 地図の右下の出典（言語を切り替えたときにも呼ぶ） */
  setAttributionLabel(label: string): void {
    const a = document.createElement('a');
    a.href = MAP_TILES.attributionUrl;
    a.target = '_blank';
    a.rel = 'noopener noreferrer';
    a.textContent = label;
    const html = a.outerHTML;
    if (html === this.attribution) return;
    const control = this.map.attributionControl;
    if (this.attribution) control.removeAttribution(this.attribution);
    control.addAttribution(html);
    this.attribution = html;
  }

  /** 今地図に見えている範囲 */
  view(): LatLonBox {
    const b = this.map.getBounds();
    return { south: b.getSouth(), west: b.getWest(), north: b.getNorth(), east: b.getEast() };
  }

  /** 地図を動かしたとき（見える範囲が変わったとき）に呼ぶ関数 */
  onViewChange(fn: (view: LatLonBox) => void): void {
    this.viewListener = fn;
  }

  /** データのある所の枠を出す（null で消す） */
  setCoverage(cells: CoverageCell[] | null): void {
    this.coverageLayer.clearLayers();
    for (const c of cells ?? []) {
      L.rectangle(
        [
          [c.box.south, c.box.west],
          [c.box.north, c.box.east],
        ],
        COVERAGE_STYLE,
      ).addTo(this.coverageLayer);
    }
  }

  /** 選んだ場所を中心に地図を出す（正方形の一辺 m） */
  show(center: LatLon, size: number): void {
    this.center = center;
    this.size = size;
    this.map.invalidateSize();
    // 正方形のまわりに少し余白を残して、地図に収める（動かす・囲み直す余地を残すため）
    const box = new LocalProjector(center).boxAround(Math.max(size, this.rectW, this.rectH));
    this.map.fitBounds([
      [box.south, box.west],
      [box.north, box.east],
    ]);
    this.clearDrawing();
  }

  setSize(size: number): void {
    this.size = size;
    if (this.mode === 'square') this.redraw();
  }

  /** 四角の横・縦の長さ（m） */
  setRectSize(width: number, height: number): void {
    this.rectW = width;
    this.rectH = height;
    if (this.mode === 'rect') this.redraw();
  }

  setMode(mode: AreaMode): void {
    this.mode = mode;
    const drawing = mode === 'polygon';
    // 描くあいだは、ダブルクリックでの拡大を止める（点を打つ操作とぶつかるため）
    if (drawing) this.map.doubleClickZoom.disable();
    else this.map.doubleClickZoom.enable();
    this.map.getContainer().classList.toggle('drawing', drawing);
    this.clearDrawing();
  }

  /** 描いた範囲を消して、描き直せるようにする */
  clearDrawing(): void {
    this.points = [];
    this.closed = false;
    this.moving = null;
    this.map.dragging.enable();
    this.redraw();
  }

  /** 自由な形：最後に打った点を取り消す */
  undoPoint(): void {
    if (this.mode !== 'polygon' || this.closed) return;
    this.points.pop();
    this.redraw();
  }

  /** 自由な形：今の点で囲み終える（3点以上） */
  finishPolygon(): void {
    if (this.mode !== 'polygon' || this.points.length < 3) return;
    this.closed = true;
    this.redraw();
  }

  /** 地図の大きさが変わったとき（隠していた地図を出したときなど）に呼ぶ */
  refresh(): void {
    this.map.invalidateSize();
  }

  state(): DrawState {
    if (this.mode === 'rect') {
      const polygon = this.center ? this.rectPoints(this.center) : undefined;
      return { mode: 'rect', polygon, drawingPoints: 0, size: polygon ? areaOfPolygon(polygon).size : undefined };
    }
    const polygon = this.closed ? dedupePolygon(this.points) : undefined;
    const issue = polygon ? polygonIssue(polygon) : undefined;
    // 描いている途中も、打った点から大きさを出し、上限を超えたらその場で知らせる
    const drawingSize = !this.closed && this.points.length >= 2 ? areaOfPolygon(this.points).size : undefined;
    return {
      mode: this.mode,
      polygon,
      drawingPoints: this.closed ? 0 : this.points.length,
      issue: issue ?? (drawingSize !== undefined && drawingSize > MAX_SIZE ? 'tooLarge' : undefined),
      size: polygon && polygon.length >= 3 ? areaOfPolygon(polygon).size : drawingSize,
    };
  }

  /** 中心と横・縦の長さから、四角の4つの角 */
  private rectPoints(c: LatLon): LatLon[] {
    const m = metersPerDegree(c.lat);
    const dLat = this.rectH / 2 / m.lat;
    const dLon = this.rectW / 2 / m.lon;
    return [
      { lat: c.lat - dLat, lon: c.lon - dLon },
      { lat: c.lat - dLat, lon: c.lon + dLon },
      { lat: c.lat + dLat, lon: c.lon + dLon },
      { lat: c.lat + dLat, lon: c.lon - dLon },
    ];
  }

  /** 今の正方形・四角の範囲（緯度経度） */
  private movableBox(): LatLonBox | null {
    if (!this.center) return null;
    if (this.mode === 'square') return new LocalProjector(this.center).boxAround(this.size / 2);
    if (this.mode === 'rect') {
      const p = this.rectPoints(this.center);
      return { south: p[0]!.lat, west: p[0]!.lon, north: p[2]!.lat, east: p[2]!.lon };
    }
    return null;
  }

  private moveCenter(c: LatLon, done: boolean): void {
    this.center = c;
    // 動かしている途中は描き直すだけにし、離したときにまとめて知らせる（データの有無の確認などを何度も走らせないため）
    this.redraw(done);
    if (done) this.centerListener?.(c);
  }

  private onClick(ev: L.LeafletMouseEvent): void {
    if (this.mode !== 'polygon') {
      // 正方形・四角：地図を押した所へ動かす（ドラッグで動かした直後のクリックは除く）
      if (this.justMoved) {
        this.justMoved = false;
        return;
      }
      if (this.center) this.moveCenter({ lat: ev.latlng.lat, lon: ev.latlng.lng }, true);
      return;
    }
    if (this.closed) return;
    const p = { lat: ev.latlng.lat, lon: ev.latlng.lng };
    const last = this.points[this.points.length - 1];
    if (last && this.map.latLngToContainerPoint([last.lat, last.lon]).distanceTo(ev.containerPoint) <= SAME_POINT_PX) return;
    const first = this.points[0];
    if (first && this.points.length >= 3) {
      const a = this.map.latLngToContainerPoint([first.lat, first.lon]);
      if (a.distanceTo(ev.containerPoint) <= CLOSE_PX) {
        this.finishPolygon();
        return;
      }
    }
    this.points.push(p);
    this.redraw();
  }

  private onPointerDown(ev: PointerEvent): void {
    this.justMoved = false;
    if (this.mode === 'polygon' || ev.button !== 0 || !ev.isPrimary) return;
    if ((ev.target as HTMLElement).closest('.leaflet-control')) return;
    const box = this.movableBox();
    if (!box || !this.center) return;
    const p = this.map.mouseEventToLatLng(ev as unknown as MouseEvent);
    if (p.lat < box.south || p.lat > box.north || p.lng < box.west || p.lng > box.east) return;
    // 四角の中を押した：地図は動かさず、四角を動かす
    ev.preventDefault();
    this.map.dragging.disable();
    this.moving = { dLat: this.center.lat - p.lat, dLon: this.center.lon - p.lng, pointerId: ev.pointerId };
    this.map.getContainer().setPointerCapture(ev.pointerId);
  }

  private onPointerMove(ev: PointerEvent): void {
    if (!this.moving || ev.pointerId !== this.moving.pointerId) return;
    const p = this.map.mouseEventToLatLng(ev as unknown as MouseEvent);
    this.moveCenter({ lat: p.lat + this.moving.dLat, lon: p.lng + this.moving.dLon }, false);
    this.justMoved = true;
  }

  private onPointerUp(ev: PointerEvent): void {
    if (!this.moving || ev.pointerId !== this.moving.pointerId) return;
    this.moving = null;
    this.map.dragging.enable();
    if (this.justMoved && this.center) this.moveCenter(this.center, true);
  }

  private redraw(notify = true): void {
    this.layer.clearLayers();
    if (this.center) {
      L.circleMarker([this.center.lat, this.center.lon], { radius: 4, color: '#1d2228', weight: 1, fillOpacity: 0.8 }).addTo(this.layer);
    }
    const box = this.movableBox();
    if (box) {
      L.rectangle(
        [
          [box.south, box.west],
          [box.north, box.east],
        ],
        { ...STYLE, interactive: false },
      ).addTo(this.layer);
    } else if (this.points.length > 0) {
      const ll = this.points.map((p) => [p.lat, p.lon] as [number, number]);
      const st = this.state();
      const style = { ...(st.issue ? BAD_STYLE : STYLE), interactive: false };
      if (this.closed) {
        L.polygon(ll, style).addTo(this.layer);
      } else {
        L.polyline(ll, style).addTo(this.layer);
        for (const [i, p] of ll.entries()) {
          // 最初の点は大きめに（ここを押すと囲み終える）
          L.circleMarker(p, { radius: i === 0 ? 7 : 4, color: STYLE.color, weight: 2, fillOpacity: 1, fillColor: '#fff', interactive: false }).addTo(this.layer);
        }
      }
    }
    if (notify) this.onChange(this.state());
  }
}
