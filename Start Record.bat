@echo off
cd "%~dp0"
mode con:cols=85 lines=50
set /A count=4
Title screenrecord ENG-Redhwan
FOR /F "tokens=1-3 delims=/ " %%i IN ("%date:~0,10%") DO SET d=%%i%%j%%k
FOR /F "tokens=1-3 delims=: " %%i IN ("%time:~0,8%")  DO SET t=%%i%%j%%k
set PATH=%SystemRoot%\system32;%PATH%
SET log_dir=%d%_%t%

:RK
cls
echo.
echo ******** ---------------------------------------------------------------- ********
echo ****** -----------------------------   2020   ----------------------------- ******
echo ***** --------------        Screenrecord All Android         --------------- *****
echo **** ----------------         BY Redhwan Kathir              ---------------- ****
echo * -------------------------------Tell:774489117--------------------------------- *
echo.
color C
echo.
echo [*] Waiting For Your Phone ...
dd wait-for-device >NUL 2>&1
echo.                     
echo [*] Please Wait Recording in progress ...
dd shell screenrecord --bit-rate 10000 --bugreport /sdcard/Record.mp4  >NUL 2>&1
dd pull /sdcard/Record.mp4 ./Record.%log_dir%_%1.mp4 >NUL 2>&1
dd shell rm /sdcard/Record.mp4 >NUL 2>&1
echo.    
echo [*] Saved to Record.%log_dir%_%1.mp4  ...
echo.                             
echo.
echo --- All Finished ---                               
pause
:exit
rem goto RK