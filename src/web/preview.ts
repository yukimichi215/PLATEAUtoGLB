// できあがった GLB を、three.js（PlotBlock と同じ 3D 部品）で表示する。
import {
  Box3,
  Color,
  DirectionalLight,
  HemisphereLight,
  PerspectiveCamera,
  Scene,
  Vector3,
  WebGLRenderer,
  type Object3D,
} from 'three';
import { GLTFLoader } from 'three/examples/jsm/loaders/GLTFLoader.js';
import { OrbitControls } from 'three/examples/jsm/controls/OrbitControls.js';

export class Preview {
  private readonly renderer: WebGLRenderer;
  private readonly scene = new Scene();
  private readonly camera = new PerspectiveCamera(45, 1, 0.5, 20000);
  private readonly controls: OrbitControls;
  private model: Object3D | null = null;
  private readonly observer: ResizeObserver;

  constructor(private readonly container: HTMLElement) {
    this.renderer = new WebGLRenderer({ antialias: true, preserveDrawingBuffer: true });
    this.renderer.setPixelRatio(Math.min(window.devicePixelRatio, 2));
    container.appendChild(this.renderer.domElement);
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

  async show(glb: ArrayBuffer): Promise<void> {
    const gltf = await new GLTFLoader().parseAsync(glb.slice(0), '');
    if (this.model) this.scene.remove(this.model);
    this.model = gltf.scene;
    this.scene.add(this.model);
    // 全体が入るようにカメラを置く（南東の斜め上から見下ろす）
    const box = new Box3().setFromObject(this.model);
    const size = box.getSize(new Vector3());
    const center = box.getCenter(new Vector3());
    const radius = Math.max(size.x, size.z, size.y) * 0.6;
    this.camera.position.set(center.x + radius, center.y + radius * 0.9, center.z + radius);
    // 3Dプリンタ用の GLB は縮尺をかけた大きさ（数 cm）なので、近くを切る距離も大きさに合わせる
    this.camera.near = radius / 1000;
    this.camera.far = radius * 20;
    this.camera.updateProjectionMatrix();
    this.controls.target.copy(center);
    this.controls.update();
    this.resize();
    this.render();
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
