@echo off
title fsociety_payload
color 0A
cls
echo fsociety owns this device...
timeout /t 2 >nul
echo Obtaining System32 files...
timeout /t 2 >nul
setlocal enabledelayedexpansion
for /L %%i in (1,1,25) do (
    echo Deleting C:\Windows\System32\fsociety_file_%%i.dll...
    echo Deleting C:\Windows\System32\driver_%%i.sys...
    echo Deleting C:\Windows\System32\config\fsociety_%%i.reg...
    timeout /t 1 >nul
)
cls
echo fsociety completed.
timeout /t 3 >nul
taskkill /f /im explorer.exe
start "" mshta.exe "%~dp0fsociety_bsod.hta"
exit
