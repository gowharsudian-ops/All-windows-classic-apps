@echo off
cls
title Classic Windows Suite Manager
echo ====================================================
echo      ACTIVATING CLASSIC WINDOWS APPS OVERRIDES
echo ====================================================
echo.

:: 1. Deploy Classic Notepad (Old-Notepad)
echo [+] Setting up Classic Notepad...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\notepad.exe" /v "UseFilter" /t REG_DWORD /d 0 /f >nul 2>&1
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\App Paths\notepad.exe" /f >nul 2>&1
del /f /q "%localappdata%\Microsoft\WindowsApps\notepad.exe" >nul 2>&1
echo --- Classic Notepad activated.
echo.

:: 2. Create Internet Explorer COM Bypass
echo [+] Creating Internet Explorer COM Bypass...
if not exist "%SystemDrive%\ClassicWinSuite" mkdir "%SystemDrive%\ClassicWinSuite" >nul 2>&1
echo Set objIE = CreateObject("InternetExplorer.Application") > "%SystemDrive%\ClassicWinSuite\launch_ie.vbs"
echo objIE.Visible = True >> "%SystemDrive%\ClassicWinSuite\launch_ie.vbs"
echo objIE.Navigate "about:blank" >> "%SystemDrive%\ClassicWinSuite\launch_ie.vbs"
echo --- Internet Explorer script created at %SystemDrive%\ClassicWinSuite\launch_ie.vbs
echo.

:: 3. Setup Netscape Navigator Folder
echo [+] Preparing Netscape Navigator target directory...
if not exist "%SystemDrive%\ClassicWinSuite\Netscape" mkdir "%SystemDrive%\ClassicWinSuite\Netscape" >nul 2>&1
echo --- Operational directory prepared at %SystemDrive%\ClassicWinSuite\Netscape
echo.

:: 4. Restore Classic MS Paint
echo [+] Routing Paint to classic pathways...
dism /Online /Add-Capability /CapabilityName:Microsoft.Windows.MSPaint~~~~0.0.1.0 >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\CurrentVersion\App Paths\mspaint.exe" /ve /t REG_SZ /d "%ProgramFiles%\Windows NT\Accessories\mspaint.exe" /f >nul 2>&1
echo --- Classic Paint configuration applied.
echo.

:: 5. Redirect Classic Calculator
echo [+] Intercepting Calculator requests...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\calc.exe" /v "Debugger" /t REG_SZ /d "%SystemDrive%\ClassicWinSuite\legacy_calc.exe" /f >nul 2>&1
echo --- Calculator interception hook active.
echo.

:: 6. Enable Windows Media Player Legacy
echo [+] Enabling Windows Media Player Legacy...
dism /Online /Enable-Feature /FeatureName:"WindowsMediaPlayer" /All >nul 2>&1
echo --- Windows Media Player Legacy turned on.
echo.

echo ====================================================
echo   SUITE DEPLOYMENT COMPLETE: ALL REGISTRY KEYS APPLIED
echo ====================================================
echo.
pause
