// できあがった GLB を、three.js（PlotBlock と同じ 3D 部品）で表示する。
import {
  Box3,
  Color,
  DirectionalLight,
  GridHelper,
  HemisphereLight,
  PerspectiveCamera,
  Scene,
  Vector3,
  WebGLRenderer,
  type Object3D,
} from 'three';
import { GLTFLoader } from 'three/examples/jsm/loaders/GLTFLoader.js';
import { OrbitControls } from 'three/examples/jsm/controls/OrbitControls.js';
import { formatLength, niceGridStep } from './grid-scale.js';
import { t } from './i18n/index.js';

/** 視点：斜めから（南東の上から見下ろす）・真上から・正面から（南から） */
export type ViewName = 'angle' | 'top' | 'front';

export interface ShowOptions {
  /** 3Dプリンタ用（GLB は印刷したときの大きさ）。マス目の長さを mm・cm で書く */
  print?: boolean;
}

export class Preview {
  private readonly renderer: WebGLRenderer;
  private readonly scene = new Scene();
  private readonly camera = new PerspectiveCamera(45, 1, 0.5, 20000);
  private readonly controls: OrbitControls;
  private model: Object3D | null = null;
  private grid: GridHelper | null = null;
  private readonly gridLabel: HTMLElement;
  private readonly box = new Box3();
  /** マス目の1マスの長さ（m）と、3Dプリンタ用か（言語を変えたときに書き直すため） */
  private gridStep = 0;
  private gridPrint = false;
  private readonly observer: ResizeObserver;

  constructor(private readonly container: HTMLElement) {
    this.renderer = new WebGLRenderer({ antialias: true, preserveDrawingBuffer: true });
    this.renderer.setPixelRatio(Math.min(window.devicePixelRatio, 2));
    container.appendChild(this.renderer.domElement);
    this.gridLabel = document.createElement('div');
    this.gridLabel.className = 'preview-scale';
    container.appendChild(this.gridLabel);
    const bg = getComputedStyle(container).backgroundColor;
    this.scene.background = new Color(bg || '#e8ecf1');
    this.scene.add(new HemisphereLight(0xffffff, 0x8899aa, 1.6));
    const sun = new DirectionalLight(0xffffff, 1.8);
    sun.position.set(0.6, 1, 0.4);
    this.scene.add(sun);
    this.controls = new OrbitControls(this.camera, this.renderer.domElement);
    this.controls.enableDamping = false;
    this.controls.maxPolarAngle = Math.PI * 0.49;
    this.controls.addEventListener('change', () => this.render());
    this.observer = new ResizeObserver(() => this.resize());
    this.observer.observe(container);
    this.resize();
  }

  async show(glb: ArrayBuffer, opt: ShowOptions = {}): Promise<void> {
    const gltf = await new GLTFLoader().parseAsync(glb.slice(0), '');
    if (this.model) this.scene.remove(this.model);
    this.model = gltf.scene;
    this.scene.add(this.model);
    this.box.setFromObject(this.model);
    this.showGrid(opt.print === true);
    this.setView('angle');
  }

  /** 全体が入るように、選んだ向きからカメラを置く */
  setView(view: ViewName): void {
    if (!this.model) return;
    const size = this.box.getSize(new Vector3());
    const center = this.box.getCenter(new Vector3());
    // 模型を包む球が画面の縦にちょうど収まる距離
    const radius = size.length() / 2;
    const d = radius / Math.sin(((this.camera.fov / 2) * Math.PI) / 180);
    // 真上は、真下を向くと回す向きが定まらないので、ほんの少し南へずらす
    const dir =
      view === 'top' ? new Vector3(0, 1, 0.001) : view === 'front' ? new Vector3(0, 0.25, 1) : new Vector3(1, 0.9, 1);
    this.camera.position.copy(center).addScaledVector(dir.normalize(), d);
    // 3Dプリンタ用の GLB は縮尺をかけた大きさ（数 cm）なので、近くを切る距離も大きさに合わせる
    this.camera.near = radius / 1000;
    this.camera.far = radius * 20;
    this.camera.updateProjectionMatrix();
    this.controls.target.copy(center);
    this.controls.update();
    this.resize();
    this.render();
  }

  /** 床にマス目を敷き、1マスの長さを書く（大きさの見当をつけるため） */
  private showGrid(print: boolean): void {
    if (this.grid) {
      this.scene.remove(this.grid);
      this.grid.dispose();
    }
    const size = this.box.getSize(new Vector3());
    const center = this.box.getCenter(new Vector3());
    const extent = Math.max(size.x, size.z);
    const step = niceGridStep(extent);
    const cells = Math.ceil((extent * 1.2) / step / 2) * 2;
    this.grid = new GridHelper(cells * step, cells, 0x7f8a96, 0xaab3bd);
    // 模型の底のすぐ下に置く（底の面とちらつかないように少しだけ下げる）
    this.grid.position.set(center.x, this.box.min.y - extent * 1e-3, center.z);
    this.scene.add(this.grid);
    this.gridStep = step;
    this.gridPrint = print;
    this.relabel();
  }

  /** マス目の長さの文を、今の画面の言語で書き直す */
  relabel(): void {
    if (this.gridStep === 0) return;
    const length = formatLength(this.gridStep, this.gridPrint);
    this.gridLabel.textContent = t(this.gridPrint ? 'preview.gridPrint' : 'preview.grid', { length });
  }

  private resize(): void {
    const w = this.container.clientWidth || 1;
    const h = this.container.clientHeight || 1;
    this.renderer.setSize(w, h, false);
    this.renderer.domElement.style.width = '100%';
    this.renderer.domElement.style.height = '100%';
    this.camera.aspect = w / h;
    this.camera.updateProjectionMatrix();
    this.render();
  }

  private render(): void {
    this.renderer.render(this.scene, this.camera);
  }
}
