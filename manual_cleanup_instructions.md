# Cursor完全アンインストール - 手動クリーンアップ手順

## 削除するディレクトリ

### 1. プログラムファイル（管理者権限が必要）
```
C:\Program Files\Cursor
```
または
```
C:\Program Files (x86)\Cursor
```

### 2. 設定とデータ（既にスクリプトで削除済み）
```
C:\Users\hoppe\AppData\Roaming\Cursor
C:\Users\hoppe\.cursor
```

### 3. キャッシュと一時ファイル
```
C:\Users\hoppe\AppData\Local\Cursor
C:\Users\hoppe\AppData\Local\Temp\Cursor*
```

### 4. レジストリエントリ（オプション）
レジストリエディタ（regedit）を開いて以下を削除：
```
HKEY_CURRENT_USER\Software\Cursor
```

## 削除方法

### ファイルエクスプローラーで削除
1. 上記のパスをファイルエクスプローラーで開く
2. フォルダを右クリック → 「削除」
3. 管理者権限が必要な場合は、管理者として実行

### PowerShellで削除（管理者として実行）
```powershell
# 管理者権限でPowerShellを開いて実行
Remove-Item -Path "C:\Program Files\Cursor" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path "C:\Users\hoppe\AppData\Local\Cursor" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path "C:\Users\hoppe\AppData\Local\Temp\Cursor*" -Recurse -Force -ErrorAction SilentlyContinue
```

### レジストリエントリの削除
1. `Win + R` を押して「regedit」と入力
2. 以下のパスに移動：
   ```
   HKEY_CURRENT_USER\Software\Cursor
   ```
3. 「Cursor」フォルダを右クリック → 「削除」

## 確認
すべてのディレクトリが削除されたことを確認してください。

