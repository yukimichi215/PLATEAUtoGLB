import { createReadStream } from 'node:fs';
import { WebIO } from '@gltf-transform/core';
import { describe, expect, it } from 'vitest';
import type { SourceFile } from '../src/core/catalog.js';
import { generateFromPlan, type AreaPlan, type AreaRequest, type OpenText } from '../src/core/pipeline.js';
import { usageName } from '../src/core/usage.js';

const openText: OpenText = async () =>
  createReadStream(new URL('./fixtures/bldg_tokyo_station.gml', import.meta.url), { encoding: 'utf8' }) as AsyncIterable<string>;

const file: SourceFile = {
  type: 'bldg',
  mesh: '53394611',
  url: 'https://assets.cms.plateau.reearth.io/test/13101/bldg.gml',
  fileSize: 1000,
  maxLod: 2,
  cities: [{ code: '13101', name: '千代田区', year: 2025, url: 'https://assets.cms.plateau.reearth.io/test/13101/bldg.gml' }],
};

function plan(req: Partial<AreaRequest>): AreaPlan {
  const request: AreaRequest = {
    center: { lat: 35.6812, lon: 139.7671 },
    size: 300,
    lod: 2,
    includeRoads: false,
    includeGround: false,
    placeName: '東京駅',
    separateBuildings: true,
    ...req,
  };
  return { request, meshes: [], files: [file], totalBytes: 1, unknownSizeFiles: 0 };
}

/** GLB の Buildings の下のノード（名前と extras） */
async function buildingNodes(glb: Uint8Array) {
  const doc = await new WebIO().readBinary(glb);
  const buildings = doc.getRoot().listScenes()[0]!.listChildren()[0]!.listChildren().find((n) => n.getName() === 'Buildings')!;
  return buildings.listChildren().map((n) => ({ name: n.getName(), extras: n.getExtras() as Record<string, unknown> }));
}

describe('建物の情報を部品に残す', () => {
  it('見本の建物の値と、部品の名前・extras の値が一致する', async () => {
    const res = await generateFromPlan(plan({}), openText);
    const nodes = await buildingNodes(res.glb);
    expect(nodes.length).toBe(res.buildings.length);
    for (const [i, info] of res.buildings.entries()) {
      const { name, extras } = nodes[i]!;
      expect(extras.plateauId).toBe(info.id);
      expect(extras.buildingId).toBe(info.buildingId);
      expect(extras.name).toBe(info.name);
      expect(extras.measuredHeight).toBe(info.measuredHeight);
      expect(extras.modelHeight).toBe(info.modelHeight);
      expect(extras.storeysAboveGround).toBe(info.storeys);
      expect(extras.yearOfConstruction).toBe(info.yearOfConstruction);
      expect(extras.usageName).toBe(usageName(info.usage));
      // 名前のある建物は「名前_ID」
      expect(name).toBe(info.name ? `${info.name}_${info.buildingId ?? info.id}` : (info.buildingId ?? info.id));
      // データにない項目は作らない（値が undefined・空のキーがない）
      for (const v of Object.values(extras)) expect(v === undefined || v === '').toBe(false);
    }
    // 見本の東京駅（citygml.test.ts で確かめた元データの値）
    const station = nodes.find((n) => n.extras.name === '東京駅' && n.extras.measuredHeight === 14.8)!;
    expect(station).toBeDefined();
    expect(station.name.startsWith('東京駅_')).toBe(true);
    expect(station.extras).toMatchObject({ usage: '431', usageName: '運輸倉庫施設', storeysAboveGround: 2, cityCode: '13101' });
    expect(station.extras.heightScale).toBeUndefined();
  });

  it('高さの強調をしたときは、元の計測値と強調後の高さの両方が入る', async () => {
    const base = await generateFromPlan(plan({}), openText);
    const tall = await generateFromPlan(plan({ heightScale: 2 }), openText);
    const a = await buildingNodes(base.glb);
    const b = await buildingNodes(tall.glb);
    for (const [i, node] of b.entries()) {
      expect(node.extras.measuredHeight).toBe(a[i]!.extras.measuredHeight); // 元の計測値はそのまま
      expect(node.extras.modelHeight as number).toBeCloseTo((a[i]!.extras.modelHeight as number) * 2, 1);
      expect(node.extras.heightScale).toBe(2);
    }
  });

  it('用途のコードの名前（「不明」・知らないコードは値なし）', () => {
    expect(usageName('401')).toBe('業務施設');
    expect(usageName('431')).toBe('運輸倉庫施設');
    expect(usageName('461')).toBeUndefined();
    expect(usageName('999')).toBeUndefined();
    expect(usageName(undefined)).toBeUndefined();
  });
});
