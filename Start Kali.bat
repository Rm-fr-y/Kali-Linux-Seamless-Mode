@echo off
echo [1/3] Preparing Workspace and X Server...
:: Clean up any ghost processes
taskkill /f /im vcxsrv.exe >nul 2>&1
taskkill /f /im xlaunch.exe >nul 2>&1
taskkill /f /im DesktopCoral.exe >nul 2>&1

:: 1. Launch the invisible 50px wall with your custom arguments
start "" "C:\Program Files (x86)\DesktopCoral\DesktopCoral.exe" -placement top -dockheight 50

:: 2. Start the X server using your saved config
start "" "C:\Program Files\VcXsrv\xlaunch.exe" -run "CONFIG FILEPATH HERE"

echo Waiting for server to initialize...
timeout /t 2 /nobreak >nul

echo [2/3] Launching Kali Seamless Mode...
:: Launch the Linux script in the Controller window
start "Kali Controller" wsl -d kali-linux ~/launch-kex.sh

exit