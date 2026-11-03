// 中身の処理（src/core・worker）が出す日本語の知らせ（進み具合・エラー・注意）を、英語の画面で英語にする。
// 中身の処理はコマンド（日本語）とも共有しているので、文言は日本語のまま持ち、画面の側で訳す。
// 知らない文は日本語のまま出す（tests/i18n.test.ts で、中身の処理の文がすべて訳せることを確かめる）。
type Rule = [RegExp, (m: RegExpMatchArray) => string];

const fileLabel = (s: string) =>
  s.replace(/^(\d+)\/(\d+) (建物|道路)データ（メッシュ (\S+)）$/, (_, i, n, kind, mesh) =>
    `${i}/${n} ${kind === '建物' ? 'building' : 'road'} data (mesh ${mesh})`,
  );

const RULES: Rule[] = [
  [/^場所が日本の範囲の外です。/, () => 'The place is outside Japan. Check the latitude and longitude.'],
  [/^広さは (\S+)〜(\S+) m の範囲で指定してください。$/, (m) => `Choose an area size from ${m[1]} to ${m[2]} m.`],
  [/^範囲は3点以上で囲んでください。$/, () => 'Draw the area with 3 or more points.'],
  [/^囲んだ形の面積がほぼありません。/, () => 'The drawn shape has almost no area. Check that the points are not in a straight line.'],
  [/^範囲の線が交差しています。/, () => 'The lines of the area cross. Draw it again so that the lines do not cross.'],
  [/^囲んだ範囲が大きすぎます（一辺 (\S+) m の正方形に入る大きさまで）。$/, (m) => `The drawn area is too large (it must fit in a ${m[1]} m square).`],
  [/^高さの強調は (\S+)〜(\S+) 倍の範囲で指定してください。$/, (m) => `Choose a height exaggeration from ${m[1]}× to ${m[2]}×.`],
  [/^この場所には PLATEAU の建物データがありません/, () => 'There is no PLATEAU building data for this place (the area may not be covered yet).'],
  [
    /^(.+) を読み込み中…(?: (\S+) \/ (\S+) MB)?$/,
    (m) => `Reading ${fileLabel(m[1]!)}…${m[2] !== undefined ? ` ${m[2]} / ${m[3]} MB` : ''}`,
  ],
  [/^指定した範囲に建物が見つかりませんでした。/, () => 'No buildings were found in this area. Try another place or size.'],
  [/^3D モデルを作成中…$/, () => 'Building the 3D model…'],
  [
    /^この縮尺では建物が細すぎて、すべて省きました。/,
    () => 'At this scale every building is too thin and was removed. Use a larger scale or a smaller "Remove parts that are too thin" value.',
  ],
  [/^PLATEAU データカタログへの問い合わせに失敗しました（(\S+)）$/, (m) => `The PLATEAU data catalog request failed (${m[1]}).`],
  [/^データの本文がありません$/, () => 'The data has no content.'],
  [/^データの取得に失敗しました（(\S+)）。/, (m) => `Downloading the data failed (${m[1]}). Please try again later.`],
  [/^収める長さは (\S+)〜(\S+) mm の範囲で指定してください。$/, (m) => `Choose a base side length from ${m[1]} to ${m[2]} mm.`],
  [/^縮尺は (\S+)〜(\S+) の範囲で指定してください。$/, (m) => `Choose a scale from ${m[1]} to ${m[2]}.`],
  [/^台座の厚さは 0〜(\S+) mm の範囲で指定してください。$/, (m) => `Choose a base thickness from 0 to ${m[1]} mm.`],
  [/^外す細さは 0〜(\S+) mm の範囲で指定してください。$/, (m) => `Choose a thin-part limit from 0 to ${m[1]} mm.`],
  [/^閉じた形（3Dプリンタ用）では建物を1棟ずつ分けられません$/, () => 'Buildings cannot be split into parts for 3D printing.'],
  [/^建物の形と一覧の数が合いません$/, () => 'Internal error: building shapes and list do not match.'],
  [/^道路の形と一覧の数が合いません$/, () => 'Internal error: road shapes and list do not match.'],
  [/^CityGML の読み取りに失敗しました: (.*)$/s, (m) => `Reading CityGML failed: ${m[1]}`],
  [/^緯度 (\S+)・経度 (\S+)$/, (m) => `Latitude ${m[1]}, longitude ${m[2]}`],
  [/^約(1\/\d+)$/, (m) => `about ${m[1]}`],
];

/** 中身の処理の日本語の文を英語にする（知らない文はそのまま返す） */
export function translateCore(message: string): string {
  // 注意が複数あるときは1行ずつ訳す
  return message
    .split('\n')
    .map((line) => {
      for (const [re, fn] of RULES) {
        const m = line.match(re);
        if (m) return fn(m);
      }
      return line;
    })
    .join('\n');
}
