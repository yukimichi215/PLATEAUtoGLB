// 範囲を選ぶ地図の設定（地図を差し替えるときは、ここだけを変える）。
// 国土地理院の地理院タイル（淡色地図）。利用条件：https://maps.gsi.go.jp/development/ichiran.html
// ・サーバーから表示のたびに読み込むだけにする（タイルをアプリに入れたり、まとめて保存・事前に取得したりしない）。
//   この使い方なら測量法の申請は不要で、出典の表示だけでよい（国土地理院の説明による。2026-11-03 確認）。
// ・ズーム 5〜8 は海岸線などに別の出典（VMAP0 など）が要るので、9 以上だけを使う。
export const MAP_TILES = {
  url: 'https://cyberjapandata.gsi.go.jp/xyz/pale/{z}/{x}/{y}.png',
  /** 出典のリンク先（表示する文字は辞書の map.attribution。「地理院タイル」） */
  attributionUrl: 'https://maps.gsi.go.jp/development/ichiran.html',
  minZoom: 9,
  maxZoom: 18,
} as const;
