import { createReadStream } from 'node:fs';
import { describe, expect, it } from 'vitest';
import { CityGmlReader, readCityGml, type Building, type Road } from '../src/core/citygml.js';

const fixture = (name: string) =>
  createReadStream(new URL(`./fixtures/${name}`, import.meta.url), { encoding: 'utf8', highWaterMark: 4096 }) as AsyncIterable<string>;

describe('CityGML の読み取り', () => {
  it('建物6棟と属性・LOD1/LOD2 の面を読む（小さく区切って渡しても同じ）', async () => {
    const list: Building[] = [];
    await readCityGml(fixture('bldg_tokyo_station.gml'), { onBuilding: (b) => list.push(b) });
    expect(list).toHaveLength(6);
    const station = list.find((b) => b.attrs.buildingId === '13101-bldg-2544')!;
    expect(station.attrs).toMatchObject({ name: '東京駅', usage: '431', measuredHeight: 14.8, storeysAboveGround: 2, city: '13101' });
    expect(station.lod1).toHaveLength(32);
    const kinds = new Set(station.lod2.map((s) => s.kind));
    expect(kinds).toEqual(new Set(['roof', 'wall', 'ground']));
    // 座標は「緯度 経度 標高」の順
    const [lat, lon] = station.lod1[0]!.exterior;
    expect(lat).toBeGreaterThan(35.6);
    expect(lon).toBeGreaterThan(139.7);
    // 閉じるための最後の点（最初と同じ点）は取り除く
    const ext = station.lod1[0]!.exterior;
    expect(ext.slice(-3)).not.toEqual(ext.slice(0, 3));
  });

  it('付属物（ベランダなど）は本体と分けて読み、部屋の中は読まない', () => {
    const ring = (h: number) =>
      `<gml:Polygon><gml:exterior><gml:LinearRing><gml:posList>35.68 139.76 ${h} 35.6801 139.76 ${h} 35.6801 139.7601 ${h} 35.68 139.76 ${h}</gml:posList></gml:LinearRing></gml:exterior></gml:Polygon>`;
    const xml = `<core:CityModel><core:cityObjectMember><bldg:Building gml:id="b1">
<bldg:storeysAboveGround>3</bldg:storeysAboveGround>
<bldg:boundedBy><bldg:RoofSurface><bldg:lod2MultiSurface><gml:MultiSurface><gml:surfaceMember>${ring(10)}</gml:surfaceMember></gml:MultiSurface></bldg:lod2MultiSurface></bldg:RoofSurface></bldg:boundedBy>
<bldg:outerBuildingInstallation><bldg:BuildingInstallation gml:id="i1"><bldg:class>9</bldg:class><bldg:lod2Geometry><gml:MultiSurface>
<gml:surfaceMember>${ring(5)}</gml:surfaceMember><gml:surfaceMember>${ring(6)}</gml:surfaceMember>
</gml:MultiSurface></bldg:lod2Geometry></bldg:BuildingInstallation></bldg:outerBuildingInstallation>
<bldg:interiorRoom><bldg:Room><bldg:lod4MultiSurface><gml:MultiSurface><gml:surfaceMember>${ring(1)}</gml:surfaceMember></gml:MultiSurface></bldg:lod4MultiSurface></bldg:Room></bldg:interiorRoom>
</bldg:Building></core:cityObjectMember></core:CityModel>`;
    const got: Building[] = [];
    const reader = new CityGmlReader({ onBuilding: (b) => got.push(b) });
    reader.feed(xml);
    reader.close();
    expect(got).toHaveLength(1);
    expect(got[0]!.lod2).toHaveLength(1);
    expect(got[0]!.lod2[0]!.kind).toBe('roof');
    expect(got[0]!.installations).toHaveLength(2);
    expect(got[0]!.attrs.class).toBeUndefined(); // 付属物の属性は建物の属性にしない
    expect(got[0]!.attrs.storeysAboveGround).toBe(3);
  });

  it('「分からない」を表す値（階数 9999・建てた年 0001・高さ -9999）は値なしにする', () => {
    const xml = (storeys: string, year: string, height: string) => `<core:CityModel><core:cityObjectMember><bldg:Building gml:id="b1">
<bldg:measuredHeight uom="m">${height}</bldg:measuredHeight>
<bldg:storeysAboveGround>${storeys}</bldg:storeysAboveGround>
<bldg:yearOfConstruction>${year}</bldg:yearOfConstruction>
</bldg:Building></core:cityObjectMember></core:CityModel>`;
    const read = (text: string) => {
      const got: Building[] = [];
      const reader = new CityGmlReader({ onBuilding: (b) => got.push(b) });
      reader.feed(text);
      reader.close();
      return got[0]!.attrs;
    };
    const unknown = read(xml('9999', '0001', '-9999'));
    expect(unknown.storeysAboveGround).toBeUndefined();
    expect(unknown.yearOfConstruction).toBeUndefined();
    expect(unknown.measuredHeight).toBeUndefined();
    const known = read(xml('5', '1985', '18.4'));
    expect(known).toMatchObject({ storeysAboveGround: 5, yearOfConstruction: 1985, measuredHeight: 18.4 });
  });

  it('LOD3（窓・扉まである形）を読む：窓・扉は種類を分け、窓の名前は建物の名前にしない', async () => {
    const list: Building[] = [];
    await readCityGml(fixture('bldg_numazu_lod3.gml'), { onBuilding: (b) => list.push(b) });
    expect(list).toHaveLength(2);
    for (const b of list) {
      expect(b.lod3.length).toBeGreaterThan(0);
      expect(b.lod2.length).toBeGreaterThan(0); // LOD2 も別に持つ
      expect(b.attrs.city).toBe('22203');
      expect(b.attrs.name).toBeUndefined();
    }
    const count = (kind: string) => list.reduce((n, b) => n + b.lod3.filter((s) => s.kind === kind).length, 0);
    expect(count('window')).toBeGreaterThan(0);
    expect(count('door')).toBeGreaterThan(0);
    expect(count('wall')).toBeGreaterThan(0);
    expect(count('roof')).toBeGreaterThan(0);
  });

  it('LOD3 の付属物は LOD2 の付属物と分けて読む', () => {
    const ring = (h: number) =>
      `<gml:Polygon><gml:exterior><gml:LinearRing><gml:posList>35.68 139.76 ${h} 35.6801 139.76 ${h} 35.6801 139.7601 ${h} 35.68 139.76 ${h}</gml:posList></gml:LinearRing></gml:exterior></gml:Polygon>`;
    const xml = `<core:CityModel><core:cityObjectMember><bldg:Building gml:id="b1">
<bldg:boundedBy><bldg:WallSurface><bldg:lod3MultiSurface><gml:MultiSurface><gml:surfaceMember>${ring(1)}</gml:surfaceMember></gml:MultiSurface></bldg:lod3MultiSurface>
<bldg:opening><bldg:Window gml:id="w1"><gml:name>窓</gml:name><bldg:lod3MultiSurface><gml:MultiSurface><gml:surfaceMember>${ring(2)}</gml:surfaceMember></gml:MultiSurface></bldg:lod3MultiSurface></bldg:Window></bldg:opening>
</bldg:WallSurface></bldg:boundedBy>
<bldg:outerBuildingInstallation><bldg:BuildingInstallation gml:id="i1">
<bldg:lod2Geometry><gml:MultiSurface><gml:surfaceMember>${ring(5)}</gml:surfaceMember></gml:MultiSurface></bldg:lod2Geometry>
<bldg:lod3Geometry><gml:MultiSurface><gml:surfaceMember>${ring(6)}</gml:surfaceMember><gml:surfaceMember>${ring(7)}</gml:surfaceMember></gml:MultiSurface></bldg:lod3Geometry>
</bldg:BuildingInstallation></bldg:outerBuildingInstallation>
</bldg:Building></core:cityObjectMember></core:CityModel>`;
    const got: Building[] = [];
    const reader = new CityGmlReader({ onBuilding: (b) => got.push(b) });
    reader.feed(xml);
    reader.close();
    const b = got[0]!;
    expect(b.lod3.map((s) => s.kind)).toEqual(['wall', 'window']);
    expect(b.installations).toHaveLength(1);
    expect(b.installations3).toHaveLength(2);
    expect(b.attrs.name).toBeUndefined();
  });

  it('道路を読む', async () => {
    const roads: Road[] = [];
    await readCityGml(fixture('tran_sample.gml'), { onRoad: (r) => roads.push(r) });
    expect(roads).toHaveLength(3);
    expect(roads[0]!.polygons[0]!.exterior.length).toBeGreaterThanOrEqual(9);
  });

  it('外部のファイルを読み込む指定（外部実体）は展開しない', () => {
    const xml = `<?xml version="1.0"?><!DOCTYPE r [<!ENTITY x SYSTEM "file:///etc/passwd">]>
<core:CityModel><core:cityObjectMember><bldg:Building gml:id="b1"><gml:name>&x;</gml:name></bldg:Building></core:cityObjectMember></core:CityModel>`;
    const got: Building[] = [];
    const reader = new CityGmlReader({ onBuilding: (b) => got.push(b) });
    let failed = false;
    try {
      reader.feed(xml);
      reader.close();
    } catch {
      failed = true; // 未知の実体として読み取りを止める
    }
    const leaked = got.some((b) => (b.attrs.name ?? '').includes('root:'));
    expect(leaked).toBe(false);
    expect(failed || got.every((b) => !b.attrs.name)).toBe(true);
  });
});
