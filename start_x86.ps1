$switch = $args[0]

$userprofile = $env:USERPROFILE

#Stop-Process -ProcessName explorer
net start "DolbyDAXAPI"

# Only runs if it was running before standby
$searchresults = Select-String -Path C:\Scripts\log.log -pattern "taskbarx"
if ($searchresults -ne $null) { Start-Process "C:\Scripts\TaskbarX.lnk" }
$searchresults = Select-String -Path C:\Scripts\log.log -pattern "chrome"
if ($searchresults -ne $null) { start-process "C:\Users\proel\AppData\Local\Chromium\Application\chrome.exe" ; msg * "chrome gestartet" }
$searchresults = Select-String -Path C:\Scripts\log.log -pattern "wsl"
if ($searchresults -ne $null) { Start-Process "C:\Windows\sysnative\wsl" }
$searchresults = Select-String -Path C:\Scripts\log.log -pattern "vsc"
if ($searchresults -ne $null) { Start-Process "C:\Program Files (x86)\Microsoft VS Code Insiders\Code - Insiders.exe" }
$searchresults = Select-String -Path C:\Scripts\log.log -pattern "whatsapp"
if ($searchresults -ne $null) { Start-Process "C:\Program Files (Arm)\Nativefier\WhatsApp Web\WhatsApp Web.exe" }
$searchresults = Select-String -Path C:\Scripts\log.log -pattern "unigram"
if ($searchresults -ne $null) { Start-Process "Unigram" }
$searchresults = Select-String -Path C:\Scripts\log.log -pattern "dbbrowser"
if ($searchresults -ne $null) { Start-Process "C:\Program Files (x86)\DB Browser for SQLite\DB Browser for SQLite.exe" }
$searchresults = Select-String -Path C:\Scripts\log.log -pattern "steam"
if ($searchresults -ne $null) { Start-Process "C:\Program Files (x86)\Steam\steam.exe" }

# Runs always after standby
Start-Process WinDynamicDesktop
Start-Process OneDrive
Remove-Item log.log

exit 0
