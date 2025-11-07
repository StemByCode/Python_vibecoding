# Cursorの残りのファイルを削除するスクリプト
# 管理者権限で実行してください

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Cursor残りファイル削除スクリプト" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# 1. プログラムファイル（管理者権限が必要）
$programFiles = "C:\Program Files\Cursor"
Write-Host "1. プログラムファイルを削除中..." -ForegroundColor Yellow
if (Test-Path $programFiles) {
    try {
        Remove-Item -Path $programFiles -Recurse -Force -ErrorAction Stop
        Write-Host "   削除成功: $programFiles" -ForegroundColor Green
    } catch {
        Write-Host "   削除失敗: $programFiles" -ForegroundColor Red
        Write-Host "   エラー: $($_.Exception.Message)" -ForegroundColor Red
        Write-Host "   ※管理者権限でPowerShellを実行してください" -ForegroundColor Yellow
    }
} else {
    Write-Host "   見つかりません: $programFiles" -ForegroundColor Gray
}

# 2. Program Files (x86)
$programFiles86 = "${env:ProgramFiles(x86)}\Cursor"
if (Test-Path $programFiles86) {
    Write-Host "2. Program Files (x86) を削除中..." -ForegroundColor Yellow
    try {
        Remove-Item -Path $programFiles86 -Recurse -Force -ErrorAction Stop
        Write-Host "   削除成功: $programFiles86" -ForegroundColor Green
    } catch {
        Write-Host "   削除失敗: $programFiles86" -ForegroundColor Red
        Write-Host "   エラー: $($_.Exception.Message)" -ForegroundColor Red
    }
}

# 3. 一時ファイル
Write-Host "3. 一時ファイルを削除中..." -ForegroundColor Yellow
$tempFiles = Get-ChildItem "$env:LOCALAPPDATA\Temp" -Filter "cursor*" -ErrorAction SilentlyContinue
if ($tempFiles) {
    $tempFiles | ForEach-Object {
        try {
            Remove-Item -Path $_.FullName -Recurse -Force -ErrorAction Stop
            Write-Host "   削除: $($_.Name)" -ForegroundColor Green
        } catch {
            Write-Host "   削除失敗: $($_.Name)" -ForegroundColor Red
        }
    }
} else {
    Write-Host "   一時ファイルは見つかりませんでした" -ForegroundColor Gray
}

# 4. レジストリエントリ（オプション）
Write-Host "4. レジストリエントリを確認中..." -ForegroundColor Yellow
$regPath = "HKCU:\Software\Cursor"
if (Test-Path $regPath) {
    Write-Host "   レジストリエントリが見つかりました" -ForegroundColor Yellow
    Write-Host "   削除しますか？ (Y/N): " -ForegroundColor Yellow -NoNewline
    $response = Read-Host
    if ($response -eq "Y" -or $response -eq "y") {
        try {
            Remove-Item -Path $regPath -Recurse -Force -ErrorAction Stop
            Write-Host "   削除成功: レジストリエントリ" -ForegroundColor Green
        } catch {
            Write-Host "   削除失敗: レジストリエントリ" -ForegroundColor Red
        }
    }
} else {
    Write-Host "   レジストリエントリは見つかりませんでした" -ForegroundColor Gray
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "削除完了" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "次のステップ:" -ForegroundColor Yellow
Write-Host "1. PCを再起動してください" -ForegroundColor White
Write-Host "2. Cursorを再インストールしてください" -ForegroundColor White
Write-Host ""

