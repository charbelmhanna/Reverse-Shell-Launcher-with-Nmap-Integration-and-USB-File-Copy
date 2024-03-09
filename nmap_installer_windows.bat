@echo off
set "downloadUrl=https://nmap.org/dist/nmap-7.91-setup.exe"
set "installerName=nmap-7.91-setup.exe"
set "installDir=C:\Nmap"

REM Check if the installation directory exists, and create it if it doesn't
if not exist "%installDir%" (
    mkdir "%installDir%"
)

echo Downloading %installerName%...

REM Use PowerShell to download the installation file
powershell -Command "Invoke-WebRequest -Uri '%downloadUrl%' -OutFile '%installDir%\%installerName%'"

REM Check if the download is completed
:check_download_complete
if not exist "%installDir%\%installerName%" (
    timeout /t 1 >nul
    goto :check_download_complete
)

echo Installation file downloaded.

REM Install the downloaded file
echo Installing %installerName%...

REM Wait for a moment to ensure the download is complete before installation
timeout /t 5 >nul

"%installDir%\%installerName%"

REM Check if the installation is completed
:check_installation_complete
if not exist "%installDir%\%installerName%" (
    timeout /t 1 >nul
    goto :check_installation_complete
)

echo Installation completed.

REM Launch check_and_launch_windows_nmap.bat in a new Command Prompt window
start cmd /c check_and_launch_windows_nmap.bat

pause
