@echo off

rem Stops Services
net stop "DolbyDAXAPI"
net stop "ClickToRunSvc"

rem Disables Office Click-To-Run Service
sc config "ClickToRunSvc" start= disabled

rem Kills programs and optionally logs the process name
taskkill /F /IM "onedrive.exe"
taskkill /F /IM "FileCoAuth.exe"
taskkill /F /IM "WinDynamicDesktop.exe"
taskkill /F /IM "TGitCache.exe"
taskkill /F /IM "OfficeClickToRun.exe"
taskkill /F /IM "TaskbarX.exe"

if %errorlevel% EQU 0 (echo taskbarx >> log.log)
taskkill /F /IM "DB Browser for SQLite.exe"
if %errorlevel% EQU 0 (echo dbbrowser >> log.log)
taskkill /F /IM "Whatsapp Web.exe"
if %errorlevel% EQU 0 (echo whatsapp >> log.log)
taskkill /F /IM "Unigram.exe"
if %errorlevel% EQU 0 (echo unigram >> log.log)
taskkill /F /IM "steam.exe"
if %errorlevel% EQU 0 (echo steam >> log.log)
taskkill /F /IM "steamwebhelper.exe"
taskkill /F /IM "Code - Insiders.exe"
if %errorlevel% EQU 0 (echo vsc >> log.log)
taskkill /F /IM "chrome.exe"
if %errorlevel% EQU 0 (echo chrome >> log.log)
tasklist | findstr "wsl"
if %errorlevel% EQU 0 (echo wsl >> log.log)
wsl --shutdown

exit 0
