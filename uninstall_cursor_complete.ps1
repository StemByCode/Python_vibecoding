# Cursorの完全アンインストールスクリプト
# すべての設定、拡張機能、キャッシュを含めて削除します

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Cursor完全アンインストールスクリプト" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# 1. アプリケーションディレクトリ
$appData = "$env:APPDATA\Cursor"
$localAppData = "$env:LOCALAPPDATA\Programs\cursor"
$userProfile = "$env:USERPROFILE\.cursor"

Write-Host "1. 設定ディレクトリを削除中..." -ForegroundColor Yellow
if (Test-Path $appData) {
    Remove-Item -Path $appData -Recurse -Force -ErrorAction SilentlyContinue
    Write-Host "   削除: $appData" -ForegroundColor Green
} else {
    Write-Host "   見つかりません: $appData" -ForegroundColor Gray
}

Write-Host "2. ローカルアプリケーションディレクトリを削除中..." -ForegroundColor Yellow
if (Test-Path $localAppData) {
    Remove-Item -Path $localAppData -Recurse -Force -ErrorAction SilentlyContinue
    Write-Host "   削除: $localAppData" -ForegroundColor Green
} else {
    Write-Host "   見つかりません: $localAppData" -ForegroundColor Gray
}

Write-Host "3. ユーザープロファイルディレクトリを削除中..." -ForegroundColor Yellow
if (Test-Path $userProfile) {
    Remove-Item -Path $userProfile -Recurse -Force -ErrorAction SilentlyContinue
    Write-Host "   削除: $userProfile" -ForegroundColor Green
} else {
    Write-Host "   見つかりません: $userProfile" -ForegroundColor Gray
}

# 4. キャッシュディレクトリ
$cacheDir = "$env:LOCALAPPDATA\Cursor"
Write-Host "4. キャッシュディレクトリを削除中..." -ForegroundColor Yellow
if (Test-Path $cacheDir) {
    Remove-Item -Path $cacheDir -Recurse -Force -ErrorAction SilentlyContinue
    Write-Host "   削除: $cacheDir" -ForegroundColor Green
} else {
    Write-Host "   見つかりません: $cacheDir" -ForegroundColor Gray
}

# 5. ログディレクトリ
$logDir = "$env:APPDATA\Cursor\logs"
Write-Host "5. ログディレクトリを削除中..." -ForegroundColor Yellow
if (Test-Path $logDir) {
    Remove-Item -Path $logDir -Recurse -Force -ErrorAction SilentlyContinue
    Write-Host "   削除: $logDir" -ForegroundColor Green
} else {
    Write-Host "   見つかりません: $logDir" -ForegroundColor Gray
}

# 6. プログラムファイル（インストール場所）
$programFiles = "C:\Program Files\Cursor"
$programFiles86 = "${env:ProgramFiles(x86)}\Cursor"
Write-Host "6. インストールディレクトリを確認中..." -ForegroundColor Yellow
if (Test-Path $programFiles) {
    Write-Host "   見つかりました: $programFiles" -ForegroundColor Yellow
    Write-Host "   ※管理者権限で手動削除が必要な場合があります" -ForegroundColor Yellow
}
if (Test-Path $programFiles86) {
    Write-Host "   見つかりました: $programFiles86" -ForegroundColor Yellow
    Write-Host "   ※管理者権限で手動削除が必要な場合があります" -ForegroundColor Yellow
}

# 7. レジストリエントリ（オプション）
Write-Host "7. レジストリエントリを確認中..." -ForegroundColor Yellow
$regPath = "HKCU:\Software\Cursor"
if (Test-Path $regPath) {
    Write-Host "   レジストリエントリが見つかりました: $regPath" -ForegroundColor Yellow
    Write-Host "   ※レジストリエディタで手動削除するか、以下のコマンドを実行してください:" -ForegroundColor Yellow
    Write-Host "   Remove-Item -Path '$regPath' -Recurse -Force" -ForegroundColor Cyan
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "削除完了" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "次のステップ:" -ForegroundColor Yellow
Write-Host "1. Cursorを完全に終了してください" -ForegroundColor White
Write-Host "2. コントロールパネルからCursorをアンインストールしてください" -ForegroundColor White
Write-Host "3. 上記で見つからなかったディレクトリがあれば、手動で削除してください" -ForegroundColor White
Write-Host "4. レジストリエントリがある場合は削除してください（オプション）" -ForegroundColor White
Write-Host "5. PCを再起動してから、Cursorを再インストールしてください" -ForegroundColor White
Write-Host ""

# 削除されたディレクトリの一覧を表示
Write-Host "削除された/削除対象のディレクトリ:" -ForegroundColor Yellow
Write-Host "  - $appData" -ForegroundColor Gray
Write-Host "  - $cacheDir" -ForegroundColor Gray
Write-Host "  - $userProfile" -ForegroundColor Gray
Write-Host "  - $logDir" -ForegroundColor Gray
if (Test-Path $programFiles) {
    Write-Host "  - $programFiles (手動削除が必要)" -ForegroundColor Gray
}
if (Test-Path $programFiles86) {
    Write-Host "  - $programFiles86 (手動削除が必要)" -ForegroundColor Gray
}

