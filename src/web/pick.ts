// 選んだ候補（住所の検索・シチュエーション・対応地域の一覧・LOD3 の区画）を、選択中とわかるように強調する。
// 一覧は言語の切り替えや絞り込みで描き直すので、選んだものはキーで覚えておき、作り直したボタンにも付け直す。
let pickedKey: string | null = null;

/** 候補のボタンにキーを付ける（選択中なら強調した状態で作る） */
export function pickable(button: HTMLButtonElement, key: string): void {
  button.dataset.pick = key;
  button.setAttribute('aria-pressed', String(key === pickedKey));
}

/** key の候補を選択中にし、ほかの候補の強調を外す（null ですべて外す） */
export function setPicked(key: string | null): void {
  pickedKey = key;
  for (const el of document.querySelectorAll<HTMLButtonElement>('button[data-pick]')) {
    el.setAttribute('aria-pressed', String(el.dataset.pick === key));
  }
}
