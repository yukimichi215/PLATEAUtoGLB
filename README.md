# PLATEAUtoGLB

住所や地名を入れると、その周りの建物（と道路）を、国土交通省の [PLATEAU（3D都市モデル）](https://www.mlit.go.jp/plateau/) から切り出して、
[PlotBlock](https://github.com/yukimichi215/plot-block) で取り込める GLB ファイルにするツールです。ブラウザで使います。

## できること（初版）

1. 住所・地名・駅名（または「緯度, 経度」）で場所を探す
2. 切り出す広さ（正方形の一辺 100〜1000 m）と建物の形を選ぶ
   - **箱型**（LOD1）：いちばん軽い。スマホ向けのおすすめ
   - **屋根の形あり**（LOD2）：屋根の形が入る。少し重い
   - 道路・地面の板を入れるかどうか
3. 「GLB を作る」を押すと、必要な地域のデータだけを PLATEAU から取り、その場で GLB にする
4. 3D のプレビューで確かめて、GLB と出典（クレジット）の文章をダウンロード

作られる GLB の形：

- 1つの `.glb` に全部入り（外部ファイルの参照なし）。Draco などの形の圧縮は使わない
- 単位はメートル、上は +Y、北は -Z。切り出した範囲の中心が原点、地面が高さ 0
- 建物の底の面は省いて三角形を減らす。模様（テクスチャ）は使わず、壁・屋根・道路・地面の4色
- 中身は「Buildings」「Roads」「Ground」の3つの部品
- `asset.copyright` と `extras.plateau` に出典（自治体・年度・データ名・ライセンス・入手先）と「加工して作成」の旨を記録

まだできないこと：地形（坂・高低差。建物は地面の高さ 0 にそろえて並べる）、橋・木など、建物の模様、地図で場所を選ぶこと。

## 使い方

### Windows アプリ版（おすすめ）

`PLATEAUtoGLB.exe` をダブルクリックすると起動します（インストール不要。Windows 10/11 64ビット・インターネット接続が必要）。

exe は、main に取り込まれたときに GitHub の自動ビルドが作ります。
GitHub のリポジトリの「Actions」→ いちばん新しい「build」→ 下の「Artifacts」の `PLATEAUtoGLB-windows` からダウンロードできます
（保存は最新の1つだけ・7日間。消えていたら、main に変更が入ったときに作り直されます）。
署名のないアプリなので、初回は「Windows によって PC が保護されました」と出ることがあります（「詳細情報」→「実行」）。

### ブラウザ版（開発用。パソコンに Node.js が必要）

```sh
npm ci --ignore-scripts
npm run dev
```

表示された `http://localhost:5173/` をブラウザで開きます。

一度取った PLATEAU のデータは手元（アプリ・ブラウザの保存領域）に保存して使い回します（画面の一番下のリンクで消せます）。
東京の中心部などでは、1km 四方のデータが展開後 100〜200MB 程度あります（通信は圧縮されるので 1〜2 割程度）。

## データと出典

- データは PLATEAU のデータカタログ API（`api.plateauview.mlit.go.jp`）で場所に合う約1km四方のファイルを調べ、
  公式の配信元（`assets.cms.plateau.reearth.io`）から取得します。
- 住所の検索には国土地理院の住所検索（`msearch.gsi.go.jp`、無料・登録不要）を使います。
- PLATEAU のデータは「公共データ利用規約（第1.0版）」（CC BY 4.0 互換）で、出典の表示が必要です。
  GLB と一緒にダウンロードできるクレジットの文章を、PlotBlock の素材のクレジット欄に貼ってください。
  利用条件：https://www.mlit.go.jp/plateau/site-policy/

## 開発者向け

| コマンド | 内容 |
|---|---|
| `npm run dev` | 画面を開発用に起動 |
| `npm run typecheck` | 型チェック |
| `npm test` | 自動テスト（`tests/`。小さな見本データ `tests/fixtures/` を使い、glTF Validator と three.js の GLTFLoader で GLB を検査） |
| `npm run build` | 型チェックと公開用のファイル作成（`dist/`） |
| `npm run cli -- --lat 35.6812 --lon 139.7671 --size 300 --lod 1 --name 東京駅` | コマンドで GLB を作る（取得したデータは `data/cache/` に保存。1ファイル200MB・合計1000MBを超えると中止） |
| `npm run app:dev` / `npm run app:build` | Windows アプリ版の起動・ビルド（Rust と Tauri の準備が要る。通常は GitHub の自動ビルドで作る） |
| `npm run verify -- out/xxx.glb` | GLB を glTF Validator と three.js で検査し、外形・三角形の数を表示 |

PR を出す前の検証：`npm run typecheck`、`npm test`、`npm run build` がすべて通ること。
GLB の出力を変えたときは、さらに実データで `npm run cli` と `npm run verify` を実行し、見た目に関わる変更は画面のプレビューのスクリーンショットで確かめる。

構成：

- `src/core/` … 画面とコマンドで共通の中身（場所→メッシュ番号、データカタログ、CityGML の読み取り、三角形分割、GLB 作成、出典）
- `src/web/` … ブラウザの画面。重い処理は Web Worker（`worker.ts`）で行う
- `scripts/` … コマンド（GLB 作成・検査）
- `src-tauri/` … Windows アプリ版（Tauri）。画面は `dist/` をそのまま使い、保存だけ「名前を付けて保存」の窓（`save_file`）にする
- `.github/workflows/build.yml` … 自動ビルド。PR では検査とビルドの確認だけ、main では exe を作って最新の1つだけ保存

自動ビルド：PR では「検査（型チェック・テスト・画面のビルド）」と「Windows 版（exe）」が通ることを確かめる。
