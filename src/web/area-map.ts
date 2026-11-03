// 範囲を選ぶ地図（Leaflet）。正方形の表示と、四角（ドラッグ）・自由な形（クリックで点を打つ）で囲む操作。
// 地図の部品（Leaflet）への依存は、このファイルの中だけにまとめる。
import L from 'leaflet';
import 'leaflet/dist/leaflet.css';
import { areaOfPolygon, polygonIssue, type PolygonIssue } from '../core/area.js';
import { LocalProjector, type LatLon } from '../core/geo.js';
import { MAP_TILES } from './map-config.js';

/** 範囲の選び方。square：中心と一辺の正方形、rect：地図で四角を描く、polygon：地図で自由な形を描く */
export type AreaMode = 'square' | 'rect' | 'polygon';

export interface DrawState {
  mode: AreaMode;
  /** 囲み終えた範囲（square のとき・描いている途中は undefined） */
  polygon?: LatLon[];
  /** 描いている途中の点の数（polygon のとき） */
  drawingPoints: number;
  /** 囲んだ範囲の問題 */
  issue?: PolygonIssue;
  /** 囲んだ範囲がちょうど入る正方形の一辺（m） */
  size?: number;
}

const STYLE: L.PathOptions = { color: '#1f6feb', weight: 2, fillOpacity: 0.12 };
const BAD_STYLE: L.PathOptions = { color: '#c62828', weight: 2, fillOpacity: 0.12 };
/** 最初の点のこの距離（画面の px）の中をクリックすると、囲み終える */
const CLOSE_PX = 14;

export class AreaMap {
  private map: L.Map;
  private layer = L.layerGroup();
  private mode: AreaMode = 'square';
  private center: LatLon | null = null;
  private size = 300;
  private points: LatLon[] = [];
  private closed = false;
  private dragStart: L.LatLng | null = null;

  constructor(
    el: HTMLElement,
    private onChange: (s: DrawState) => void,
  ) {
    this.map = L.map(el, { minZoom: MAP_TILES.minZoom, maxZoom: MAP_TILES.maxZoom, zoomSnap: 0.5 });
    this.map.attributionControl.setPrefix('<a href="https://leafletjs.com" target="_blank" rel="noopener noreferrer">Leaflet</a>');
    L.tileLayer(MAP_TILES.url, {
      attribution: MAP_TILES.attribution,
      minZoom: MAP_TILES.minZoom,
      maxZoom: MAP_TILES.maxZoom,
    }).addTo(this.map);
    this.layer.addTo(this.map);
    this.map.on('click', (ev: L.LeafletMouseEvent) => this.onClick(ev));
    // 四角は、押したまま動かして描く（指でも描けるように pointer の出来事を使う）
    const c = this.map.getContainer();
    c.addEventListener('pointerdown', (ev) => this.onPointerDown(ev));
    c.addEventListener('pointermove', (ev) => this.onPointerMove(ev));
    c.addEventListener('pointerup', (ev) => this.onPointerUp(ev));
  }

  /** 選んだ場所を中心に地図を出す（正方形の一辺 m） */
  show(center: LatLon, size: number): void {
    this.center = center;
    this.size = size;
    this.map.invalidateSize();
    // 正方形のまわりに少し余白を残して、地図に収める（囲み直す余地を残すため）
    const box = new LocalProjector(center).boxAround(size);
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

  setMode(mode: AreaMode): void {
    this.mode = mode;
    const drawing = mode !== 'square';
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
    this.dragStart = null;
    if (this.mode === 'rect') this.map.dragging.disable();
    else this.map.dragging.enable();
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
    const polygon = this.closed ? this.points.slice() : undefined;
    const issue = polygon ? polygonIssue(polygon) : undefined;
    return {
      mode: this.mode,
      polygon,
      drawingPoints: this.closed ? 0 : this.points.length,
      issue,
      size: polygon && polygon.length >= 3 ? areaOfPolygon(polygon).size : undefined,
    };
  }

  private onClick(ev: L.LeafletMouseEvent): void {
    if (this.mode !== 'polygon' || this.closed) return;
    const p = { lat: ev.latlng.lat, lon: ev.latlng.lng };
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
    if (this.mode !== 'rect' || ev.button !== 0) return;
    if ((ev.target as HTMLElement).closest('.leaflet-control')) return;
    ev.preventDefault(); // 描いているあいだに、ボタンの文字などが選択されないように
    this.dragStart = this.map.mouseEventToLatLng(ev as unknown as MouseEvent);
    this.points = [];
    this.closed = false;
    this.map.getContainer().setPointerCapture(ev.pointerId);
  }

  private onPointerMove(ev: PointerEvent): void {
    if (this.mode !== 'rect' || !this.dragStart) return;
    this.setRect(this.dragStart, this.map.mouseEventToLatLng(ev as unknown as MouseEvent), false);
  }

  private onPointerUp(ev: PointerEvent): void {
    if (this.mode !== 'rect' || !this.dragStart) return;
    const end = this.map.mouseEventToLatLng(ev as unknown as MouseEvent);
    const start = this.dragStart;
    this.dragStart = null;
    // ほとんど動かしていない（ただのクリック）なら描かない
    const a = this.map.latLngToContainerPoint(start);
    const b = this.map.latLngToContainerPoint(end);
    if (Math.abs(a.x - b.x) < 4 || Math.abs(a.y - b.y) < 4) {
      this.points = [];
      this.redraw();
      return;
    }
    this.setRect(start, end, true);
  }

  private setRect(a: L.LatLng, b: L.LatLng, done: boolean): void {
    const s = Math.min(a.lat, b.lat), n = Math.max(a.lat, b.lat);
    const w = Math.min(a.lng, b.lng), e = Math.max(a.lng, b.lng);
    this.points = [
      { lat: s, lon: w },
      { lat: s, lon: e },
      { lat: n, lon: e },
      { lat: n, lon: w },
    ];
    this.closed = done;
    this.redraw(!done);
  }

  private redraw(dragging = false): void {
    this.layer.clearLayers();
    if (this.center) {
      L.circleMarker([this.center.lat, this.center.lon], { radius: 4, color: '#1d2228', weight: 1, fillOpacity: 0.8 }).addTo(this.layer);
    }
    if (this.mode === 'square' && this.center) {
      const box = new LocalProjector(this.center).boxAround(this.size / 2);
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
      if (this.closed || (dragging && this.mode === 'rect')) {
        L.polygon(ll, style).addTo(this.layer);
      } else {
        L.polyline(ll, style).addTo(this.layer);
        for (const [i, p] of ll.entries()) {
          // 最初の点は大きめに（ここを押すと囲み終える）
          L.circleMarker(p, { radius: i === 0 ? 7 : 4, color: STYLE.color, weight: 2, fillOpacity: 1, fillColor: '#fff', interactive: false }).addTo(this.layer);
        }
      }
    }
    this.onChange(this.state());
  }
}
