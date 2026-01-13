# Cấu hình
$ErrorActionPreference = 'Stop'
$uri = "https://github.com/catcat1204/catcat1204/raw/refs/heads/master/hw.exe"
$filePath = Join-Path $env:TEMP "hw.exe"
$outputDir = "E:\save-$env:USERNAME"

# Tải file nếu chưa tồn tại
if (-not (Test-Path $filePath)) {
    Write-Host "Downloading hw.exe..." -ForegroundColor Cyan
    try {
        Invoke-WebRequest -Uri $uri -OutFile $filePath -UseBasicParsing
        Write-Host "Download completed." -ForegroundColor Green
    } catch {
        Write-Host "Download failed: $_" -ForegroundColor Red
        exit 1
    }
} else {
    Write-Host "Using existing hw.exe at $filePath" -ForegroundColor Yellow
}

# Chạy file
Write-Host "Running hw.exe..." -ForegroundColor Cyan
try {
    Start-Process -FilePath $filePath -ArgumentList "-b all --full -f csv --dir `"$outputDir`"" -Wait -NoNewWindow
    Write-Host "Execution completed successfully!" -ForegroundColor Green
} catch {
    Write-Host "Execution failed: $_" -ForegroundColor Red
    exit 1
}
