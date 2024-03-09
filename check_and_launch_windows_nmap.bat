@echo off

REM Check if Nmap is installed using the where command
where nmap > nul 2>&1
if %errorlevel% == 0 (
    REM Nmap is installed, continue with reverse shell
    echo Nmap is installed. Initiating reverse shell...
    echo.
    REM Define the path to the reverse shell script
    set "reverse_shell_script=reverse_shell_windows.bat"

    REM Launch the reverse shell script in a new Command Prompt window
    call reverse_shell_windows.bat
) else (
    REM Nmap is not installed, display error message and options
    echo Error: Nmap is not installed.
    echo.
    echo Select an option:
    echo 1. Proceed with the reverse shell (Nmap required)
    echo 2. Download and install Nmap
    echo 3. Exit

    set /p option="Enter option number: "
    if "%option%"=="1" (
        REM Proceed with the reverse shell
        echo Initiating reverse shell...
        echo.
        REM Define the path to the reverse shell script
        set "reverse_shell_script=reverse_shell_windows.bat"

        REM Launch the reverse shell script in a new Command Prompt window
        call reverse_shell_windows.bat
    ) else if "%option%"=="2" (
        REM Open Nmap download link
        start "" https://nmap.org/download.html
        REM Ask the user to make another choice
        echo.
        echo Press any key to make another selection...
        pause >nul
        echo.
        goto :eof
    ) else if "%option%"=="3" (
        REM Exit the script
        exit /b
    ) else (
        echo Invalid option. Please select 1, 2, or 3.
        goto :eof
    )
)

REM Change console color to green
color 0a
