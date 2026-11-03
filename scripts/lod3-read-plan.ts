// 対応地域の一覧を作るときに、LOD3 の区画の CityGML をどの順に・どこまで読むかの決まり（make-city-list.ts から使う）。

/** 読んだ量（展開後）の上限。1ファイルの上限を超えたらそのファイルだけ飛ばし、合計の上限に達したら残りは読まない */
export class ReadBudget {
  /** 読んだ量の合計（展開後、途中でやめたファイルの分も含む） */
  total = 0;
  constructor(
    readonly maxFileBytes: number,
    readonly maxTotalBytes: number,
  ) {}

  /** 次のファイルを読み始めてよいか */
  canStart(): boolean {
    return this.total < this.maxTotalBytes;
  }

  /** 読んだ分を足す。fileBytes は足したあとのそのファイルの量。続けてよければ 'ok' */
  add(chunkBytes: number, fileBytes: number): 'ok' | 'fileTooLarge' | 'totalReached' {
    this.total += chunkBytes;
    if (fileBytes > this.maxFileBytes) return 'fileTooLarge';
    if (this.total > this.maxTotalBytes) return 'totalReached';
    return 'ok';
  }
}

/** 候補の列（自治体ごと、小さい順）を、1周目は各列の1番目、2周目は2番目…の順に並べる（[列の番号, 候補]） */
export function* roundRobin<T>(lists: readonly (readonly T[])[]): Generator<[number, T]> {
  const longest = Math.max(0, ...lists.map((l) => l.length));
  for (let round = 0; round < longest; round++) {
    for (const [i, list] of lists.entries()) {
      const item = list[round];
      if (item !== undefined) yield [i, item];
    }
  }
}
