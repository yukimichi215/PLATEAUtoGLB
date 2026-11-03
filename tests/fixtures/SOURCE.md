# テスト用データの出典

自動テストで使う、PLATEAU の3D都市モデルの小さな切り出しです（建物8棟・道路3本、合計 約0.9MB）。

| ファイル | 内容 |
|---|---|
| `bldg_tokyo_station.gml` | 建築物モデル。東京駅の周り（3次メッシュ 53394611）の建物6棟だけを残したもの |
| `tran_sample.gml` | 道路モデル。同じメッシュの道路3本だけを残したもの |
| `bldg_numazu_lod3.gml` | 建築物モデル。沼津駅南口（3次メッシュ 52385628）の、窓・扉まである建物（LOD3）2棟だけを残したもの |

- 出典：「3D都市モデル（Project PLATEAU）千代田区（2025年度）」（国土交通省）を加工して作成
  - 東京都の整備データのため、同じファイルが中央区（2025年度）の配布にも含まれています
- 自治体：東京都千代田区・中央区
- 年度：2025年度（CityGML 仕様 5.0）
- ライセンス：公共データ利用規約（第1.0版）（CC BY 4.0 互換）。利用条件：https://www.mlit.go.jp/plateau/site-policy/
- 入手先（PLATEAU データカタログ API で取得した公式の個別ファイル）：
  - https://assets.cms.plateau.reearth.io/assets/5d/dc07c5-ace7-465a-9c99-53f6d78f6164/13101_chiyoda-ku_pref_2025_citygml_1_op/udx/bldg/53394611_bldg_6697_op.gml
  - https://assets.cms.plateau.reearth.io/assets/5d/dc07c5-ace7-465a-9c99-53f6d78f6164/13101_chiyoda-ku_pref_2025_citygml_1_op/udx/tran/53394611_tran_6697_op.gml
- 入手日：2026-11-02
- 加工の内容：ファイルの先頭部分（名前空間の宣言・範囲）を残し、`core:cityObjectMember` のうち上記の建物・道路だけを残した。見た目の情報（`app:appearanceMember`）は削除。中身の数値は変えていない。

## `bldg_numazu_lod3.gml`

- 出典：「3D都市モデル（Project PLATEAU）沼津市（2023年度）」（国土交通省）を加工して作成
- 自治体：静岡県沼津市
- 年度：2023年度
- ライセンス：公共データ利用規約（第1.0版）（CC BY 4.0 互換）。利用条件：https://www.mlit.go.jp/plateau/site-policy/
- 入手先（PLATEAU データカタログ API で取得した公式の個別ファイル）：
  - https://assets.cms.plateau.reearth.io/assets/c1/c24461-af1d-49a3-a4f4-14e88a731bfb/22203_numazu-shi_city_2023_citygml_3_op/udx/bldg/52385628_bldg_6697_op.gml
- 入手日：2026-11-02
- 加工の内容：ファイルの先頭部分（名前空間の宣言・範囲）を残し、`core:cityObjectMember` のうち建物2棟（`bldg_4776724a-…`・`bldg_74a2820d-…`）だけを残した。見た目の情報（`app:appearanceMember`）は削除。中身の数値は変えていない。
