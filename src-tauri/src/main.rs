// PLATEAUtoGLB のデスクトップ版。画面は Web 版（../dist）と同じものを窓で開く。
// Windows でダブルクリックしたときに黒い窓（コンソール）を出さない。
#![cfg_attr(not(debug_assertions), windows_subsystem = "windows")]

use tauri::ipc::{InvokeBody, Request};

/// 「%E6%9D%B1」のような URL 用の書き方をもとの文字に戻す（ファイル名は日本語を含むため、画面から送るときに変換している）
fn percent_decode(s: &str) -> String {
    let bytes = s.as_bytes();
    let mut out = Vec::with_capacity(bytes.len());
    let mut i = 0;
    while i < bytes.len() {
        if bytes[i] == b'%' && i + 2 < bytes.len() {
            if let Ok(b) = u8::from_str_radix(&s[i + 1..i + 3], 16) {
                out.push(b);
                i += 3;
                continue;
            }
        }
        out.push(bytes[i]);
        i += 1;
    }
    String::from_utf8_lossy(&out).into_owned()
}

/// Windows で使えない文字を除いたファイル名
fn safe_file_name(name: &str) -> String {
    let cleaned: String = name
        .chars()
        .map(|c| if "\\/:*?\"<>|".contains(c) || c.is_control() { '_' } else { c })
        .collect();
    let trimmed = cleaned.trim().trim_matches('.').to_string();
    if trimmed.is_empty() { "plateau.glb".to_string() } else { trimmed }
}

/// 画面で作ったファイル（GLB・クレジット）を、保存先を選ぶ窓で選んだ場所に書く。
/// 中身は本文（バイト列）で、ファイル名は x-file-name で受け取る。
/// 保存したら true、取りやめたら false を返す。
#[tauri::command]
async fn save_file(request: Request<'_>) -> Result<bool, String> {
    let data = match request.body() {
        InvokeBody::Raw(bytes) => bytes.clone(),
        _ => return Err("保存するデータの形が正しくありません。".into()),
    };
    let name = request
        .headers()
        .get("x-file-name")
        .and_then(|v| v.to_str().ok())
        .map(percent_decode)
        .map(|n| safe_file_name(&n))
        .unwrap_or_else(|| "plateau.glb".to_string());
    let ext = std::path::Path::new(&name)
        .extension()
        .and_then(|e| e.to_str())
        .unwrap_or("")
        .to_lowercase();

    tauri::async_runtime::spawn_blocking(move || {
        let mut dialog = rfd::FileDialog::new().set_file_name(&name);
        dialog = match ext.as_str() {
            "glb" => dialog.add_filter("GLB（3Dモデル）", &["glb"]),
            "txt" => dialog.add_filter("テキスト", &["txt"]),
            _ => dialog,
        };
        let Some(path) = dialog.save_file() else {
            return Ok(false);
        };
        std::fs::write(&path, &data).map_err(|e| format!("保存できませんでした：{e}"))?;
        Ok(true)
    })
    .await
    .map_err(|e| format!("保存できませんでした：{e}"))?
}

fn main() {
    tauri::Builder::default()
        .invoke_handler(tauri::generate_handler![save_file])
        .run(tauri::generate_context!())
        .expect("PLATEAUtoGLB を起動できませんでした");
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn decodes_japanese_names() {
        assert_eq!(percent_decode("%E6%9D%B1%E4%BA%AC.glb"), "東京.glb");
        assert_eq!(percent_decode("a%2"), "a%2");
    }

    #[test]
    fn removes_forbidden_characters() {
        assert_eq!(safe_file_name("a/b:c?.glb"), "a_b_c_.glb");
        assert_eq!(safe_file_name("  "), "plateau.glb");
    }
}
