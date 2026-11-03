// 三角形の集まりを、PlotBlock で読める GLB（画像も含めて1ファイル・圧縮なし）にする。
import { Document, WebIO, type Material, type Mesh } from '@gltf-transform/core';
import type { GroupName, ModelPiece, Parts, PartName } from './scene.js';

export interface GlbInput {
  /** 出力する部品（SceneBuilder.pieces()） */
  pieces: ModelPiece[];
  /** asset.copyright に入れる出典の文 */
  copyright: string;
  /** ルートのノードと asset の extras に入れる情報（出典・範囲など） */
  extras: Record<string, unknown>;
  /** ルートのノード名 */
  name: string;
}

/** 材質の色（sRGB 0〜1）と表示名 */
export const MATERIALS: Record<PartName, { name: string; color: [number, number, number] }> = {
  wall: { name: '建物の壁', color: [0.86, 0.85, 0.82] },
  roof: { name: '建物の屋根', color: [0.62, 0.6, 0.57] },
  detail: { name: '建物の付属物', color: [0.74, 0.73, 0.7] },
  window: { name: '建物の窓', color: [0.33, 0.45, 0.55] },
  door: { name: '建物の扉', color: [0.45, 0.33, 0.24] },
  road: { name: '道路', color: [0.36, 0.37, 0.39] },
  ground: { name: '地面', color: [0.55, 0.58, 0.5] },
};

/** 部品の名前（GLB の中のノード名・メッシュ名） */
export const GROUPS: { name: GroupName; parts: PartName[] }[] = [
  { name: 'Buildings', parts: ['wall', 'roof', 'detail', 'window', 'door'] },
  { name: 'Roads', parts: ['road'] },
  { name: 'Ground', parts: ['ground'] },
];

export function srgbToLinear(c: number): number {
  return c <= 0.04045 ? c / 12.92 : Math.pow((c + 0.055) / 1.055, 2.4);
}

export async function buildGlb(input: GlbInput): Promise<Uint8Array> {
  const doc = new Document();
  doc.getRoot().getAsset().generator = 'PLATEAUtoGLB';
  doc.getRoot().getAsset().copyright = input.copyright;
  doc.getRoot().getAsset().extras = input.extras;
  const buffer = doc.createBuffer();
  const scene = doc.createScene(input.name);
  const root = doc.createNode(input.name).setExtras(input.extras);
  scene.addChild(root);

  // 材質は種類ごとに1つだけ作り、建物を1棟ずつ分けたときも共有する
  const materials = new Map<PartName, Material>();
  const materialOf = (partName: PartName): Material => {
    let material = materials.get(partName);
    if (!material) {
      const m = MATERIALS[partName];
      material = doc
        .createMaterial(m.name)
        .setBaseColorFactor([srgbToLinear(m.color[0]), srgbToLinear(m.color[1]), srgbToLinear(m.color[2]), 1])
        .setMetallicFactor(0)
        .setRoughnessFactor(0.9)
        // 元データの面の向きがそろっていないことがあるので、裏からも見えるようにする
        .setDoubleSided(true);
      materials.set(partName, material);
    }
    return material;
  };
  /** 部品の三角形を1つのメッシュにする（種類ごとに材質を分ける）。三角形がなければ null */
  const meshOf = (name: string, parts: Parts, partNames: PartName[]): Mesh | null => {
    const mesh = doc.createMesh(name);
    for (const partName of partNames) {
      const part = parts[partName];
      if (part.triangleCount === 0) continue;
      const positions = doc
        .createAccessor()
        .setType('VEC3')
        .setArray(new Float32Array(part.positions))
        .setBuffer(buffer);
      const normals = doc
        .createAccessor()
        .setType('VEC3')
        .setArray(new Float32Array(part.normals))
        .setBuffer(buffer);
      const indexArray =
        part.vertexCount <= 65535 ? new Uint16Array(part.indices) : new Uint32Array(part.indices);
      const indices = doc.createAccessor().setType('SCALAR').setArray(indexArray).setBuffer(buffer);
      const prim = doc
        .createPrimitive()
        .setAttribute('POSITION', positions)
        .setAttribute('NORMAL', normals)
        .setIndices(indices)
        .setMaterial(materialOf(partName));
      mesh.addPrimitive(prim);
    }
    if (mesh.listPrimitives().length === 0) {
      mesh.dispose();
      return null;
    }
    return mesh;
  };

  for (const group of GROUPS) {
    const pieces = input.pieces.filter((p) => p.group === group.name);
    const only = pieces.length === 1 && pieces[0]!.name === group.name ? pieces[0]! : null;
    if (only) {
      // まとめて1つ：グループのノードに直接メッシュを付ける
      const mesh = meshOf(group.name, only.parts, group.parts);
      if (mesh) root.addChild(doc.createNode(group.name).setMesh(mesh));
      continue;
    }
    // 1棟ずつ：グループのノードの下に、部品ごとのノードを並べる
    const groupNode = doc.createNode(group.name);
    for (const piece of pieces) {
      const mesh = meshOf(piece.name, piece.parts, group.parts);
      if (mesh) groupNode.addChild(doc.createNode(piece.name).setMesh(mesh));
    }
    if (groupNode.listChildren().length > 0) root.addChild(groupNode);
    else groupNode.dispose();
  }

  const io = new WebIO();
  return io.writeBinary(doc);
}
