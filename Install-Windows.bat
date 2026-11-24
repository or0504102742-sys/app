@echo off
setlocal
chcp 65001 >nul
title Galaxy Buds Studio - התקנה
echo.
echo  Galaxy Buds Studio
echo  מתקין רכיב שליטה עבור Galaxy Buds3 FE
echo.
where winget >nul 2>nul
if errorlevel 1 (
  echo winget לא נמצא במחשב.
  echo פותח את דף ההורדה הרשמי של GalaxyBudsClient...
  start "" "https://github.com/timschneeb/GalaxyBudsClient/releases/latest"
  echo.
  echo הורד והרץ את GalaxyBudsClient_Windows_64bit_Setup.exe
  pause
  exit /b 1
)
echo מתקין GalaxyBudsClient דרך Windows Package Manager...
winget install --id timschneeb.GalaxyBudsClient --exact --source winget --accept-source-agreements --accept-package-agreements
if errorlevel 1 (
  echo.
  echo ההתקנה האוטומטית לא הושלמה. פותח דף הורדה חלופי.
  start "" "https://github.com/timschneeb/GalaxyBudsClient/releases/latest"
  pause
  exit /b 1
)
echo.
echo ההתקנה הסתיימה. פתח את GalaxyBudsClient מתפריט Start,
echo בחר את Galaxy Buds3 FE והתחבר אליהם.
echo שים לב: תמיכת Buds3 FE בפרויקט המקור סומנה כלא נבדקה.
echo.
pause
