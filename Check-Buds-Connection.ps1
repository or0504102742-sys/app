# Galaxy Buds Studio - Windows diagnostics
# Read-only checks. This script does not pair, connect to, or change the earbuds.

$ErrorActionPreference = "SilentlyContinue"
Write-Host ""
Write-Host "Galaxy Buds Studio - בדיקת חיבור Windows" -ForegroundColor Cyan
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "הבדיקה אינה משנה הגדרות ואינה מתחברת לאוזניות." -ForegroundColor Gray

$bt = Get-PnpDevice -Class Bluetooth | Where-Object { $_.FriendlyName -match "Bluetooth|Radio|Wireless" -and $_.FriendlyName -notmatch "Enumerator" }
if ($bt) { Write-Host "[Bluetooth]" -ForegroundColor Yellow; $bt | Select-Object FriendlyName, Status | Format-Table -AutoSize } else { Write-Host "[Bluetooth] לא נמצא מתאם Bluetooth פעיל דרך Windows PnP." -ForegroundColor Red }

$buds = Get-PnpDevice | Where-Object { $_.FriendlyName -match "Galaxy Buds|Buds3|Samsung.*Buds" }
Write-Host "[אוזניות Samsung שמופיעות ב-Windows]" -ForegroundColor Yellow
if ($buds) { $buds | Select-Object Class, FriendlyName, Status, InstanceId | Format-Table -Wrap -AutoSize } else { Write-Host "לא נמצאה רשומת אוזניות מוכרת. ייתכן שהן לא מצומדות למחשב." -ForegroundColor DarkYellow }

$candidates = @("$env:LOCALAPPDATA\Programs\GalaxyBudsClient\GalaxyBudsClient.exe", "$env:ProgramFiles\GalaxyBudsClient\GalaxyBudsClient.exe", "${env:ProgramFiles(x86)}\GalaxyBudsClient\GalaxyBudsClient.exe")
$exe = $candidates | Where-Object { Test-Path $_ } | Select-Object -First 1
if (-not $exe) { $uninstall = Get-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*", "HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*", "HKLM:\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*" | Where-Object { $_.DisplayName -like "*GalaxyBudsClient*" } | Select-Object -First 1; if ($uninstall.InstallLocation) { $candidate = Join-Path $uninstall.InstallLocation "GalaxyBudsClient.exe"; if (Test-Path $candidate) { $exe = $candidate } } }
Write-Host "[GalaxyBudsClient]" -ForegroundColor Yellow
if ($exe) { Write-Host "נמצאה התקנה: $exe" -ForegroundColor Green; $answer = Read-Host "לפתוח עכשיו את GalaxyBudsClient? (Y/N)"; if ($answer -match "^(Y|y|כן)$") { Start-Process -FilePath $exe } } else { Write-Host "לא נמצאה התקנה. יש להריץ תחילה את Install-Windows.bat." -ForegroundColor Red }

Write-Host ""
Write-Host "העתק את כל הפלט ושלח אותו כאן כדי שאוכל לאבחן את בעיית החיבור." -ForegroundColor Cyan
Write-Host "שים לב: אין בפלט סיסמאות או מפתחות Bluetooth." -ForegroundColor Gray