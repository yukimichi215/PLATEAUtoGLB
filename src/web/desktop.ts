// デスクトップ版（Tauri）で動いているときの処理。Web 版では何もしない。
import { invoke, isTauri } from '@tauri-apps/api/core';

export const isDesktop = (): boolean => isTauri();

/**
 * 保存先を選ぶ窓を出して、ファイルを書く（デスクトップ版だけ）。
 * 保存したら true、取りやめたら false。
 */
export async function saveWithDialog(fileName: string, data: Uint8Array): Promise<boolean> {
  return invoke<boolean>('save_file', data, {
    headers: { 'x-file-name': encodeURIComponent(fileName) },
  });
}
