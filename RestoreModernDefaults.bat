@echo off
cls
title Modern Windows 11 App Restoration Utility
echo ====================================================
echo      RESTORING FACTORY DEFAULT MODERN WINDOWS APPS
echo ====================================================
echo.

:: 1. Restore Modern UWP Notepad
echo [-] Restoring Modern Notepad defaults...
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\notepad.exe" /f >nul 2>&1
echo --- Modern Notepad restored.
echo.

:: 2. Remove Classic Internet Explorer COM Shortcut
echo [-] Removing Classic IE engine scripts...
del /f /q "%SystemDrive%\ClassicWinSuite\launch_ie.vbs" >nul 2>&1
echo --- Internet Explorer bypass scripts removed.
echo.

:: 3. Restore Modern UWP Store Paint
echo [-] Restoring Modern Paint defaults...
reg delete "HKLM\SOFTWARE\Microsoft\CurrentVersion\App Paths\mspaint.exe" /ve /f >nul 2>&1
echo --- Modern UWP Paint restored.
echo.

:: 4. Restore Modern UWP Calculator
echo [-] Restoring Modern Calculator defaults...
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\calc.exe" /v "Debugger" /f >nul 2>&1
echo --- Modern Calculator restored.
echo.

:: 5. Remove Windows Media Player Legacy 
echo [-] Removing Windows Media Player Legacy feature...
dism /Online /Disable-Feature /FeatureName:"WindowsMediaPlayer" >nul 2>&1
echo --- Windows Media Player Legacy turned off.
echo.

echo ====================================================
echo   RESTORE COMPLETE: SYSTEM IS BACK TO MODERN WINDOWS 11
echo ====================================================
echo.
pause
