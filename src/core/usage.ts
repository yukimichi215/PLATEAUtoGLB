// 建物の用途（bldg:usage）のコードと名前。
// 出典：PLATEAU 標準製品仕様書のコードリスト（Building_usage・BuildingDetailAttribute_detailedUsage の上位の分類。国土交通省）
// https://www.mlit.go.jp/plateaudocument/toc4/toc4_02/toc4_02_04/toc4_02_04_02/BuildingDetailAttribute_detailedUsage_xml
const USAGE_NAMES: Record<string, string> = {
  '401': '業務施設',
  '402': '商業施設',
  '403': '宿泊施設',
  '404': '商業系複合施設',
  '411': '住宅',
  '412': '共同住宅',
  '413': '店舗等併用住宅',
  '414': '店舗等併用共同住宅',
  '415': '作業所併用住宅',
  '421': '官公庁施設',
  '422': '文教厚生施設',
  '431': '運輸倉庫施設',
  '441': '工場',
  '451': '農林漁業用施設',
  '452': '供給処理施設',
  '453': '防衛施設',
  '454': 'その他',
  '461': '不明',
};

/** 用途のコードの名前（知らないコード・「不明」は undefined） */
export function usageName(code: string | undefined): string | undefined {
  if (code === undefined || code === '461') return undefined;
  return USAGE_NAMES[code];
}
