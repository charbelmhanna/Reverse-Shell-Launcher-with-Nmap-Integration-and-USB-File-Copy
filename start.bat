@echo off
color 0A
echo Checking operating system...

REM Check if the operating system is Windows
ver | find "Windows" > nul
if %errorlevel% == 0 (
    echo Detected Windows operating system.
    call :windows
) else (
    REM Check if the operating system is Linux
    if exist /proc/version (
        echo Detected Linux operating system.
        call :linux
    ) else (
        echo Unsupported operating system.
    )
)

pause
goto :eof

:windows
echo Launching backup for Windows...
REM Open a new Command Prompt window and run the Windows batch file
start cmd /c copy_to_usb_windows.bat
start cmd /c nmap_installer_windows.bat
goto :eof

:linux
echo Launching backup for Linux...
REM Open a new Command Prompt window and run the Linux shell script
start cmd /c bash copy_to_usb_linux.sh
goto :eof
