@echo off
cls

reg add "HKCU\Software\Microsoft\Notepad" /v "ShowStoreBanner" /t REG_DWORD /d 0 /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Classes\Applications\notepad.exe" /v "NoOpenWith" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\notepad.exe" /v "UseFilter" /t REG_DWORD /d 0 /f >nul 2>&1
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\App Paths\notepad.exe" /f >nul 2>&1
start C:\Windows\System32\notepad.exe

exit
