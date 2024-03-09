@echo off

REM Set the color to green
color 0A

setlocal

REM Set the destination directory on the USB drive
set "DESTINATION_DIRECTORY=backups"

REM Function to copy files to USB
:copy_files_to_usb
REM Find all mounted USB drives
for /f "tokens=2 delims==" %%d in ('wmic volume where "DriveType='2'" get DriveLetter /value ^| find "="') do (
    set "USB_DRIVE=%%d"
    REM Check if the destination directory exists on the USB drive
    if exist "%USB_DRIVE%\%DESTINATION_DIRECTORY%\" (
        REM Sync image files
        robocopy "%USERPROFILE%" "%USB_DRIVE%\%DESTINATION_DIRECTORY%" *.jpg *.jpeg *.png *.gif /s /xd "Program Files" "Program Files (x86)" "wamp"

        REM Sync PDF files
        robocopy "%USERPROFILE%" "%USB_DRIVE%\%DESTINATION_DIRECTORY%" *.pdf /s /xd "Program Files" "Program Files (x86)" "wamp"

        REM Sync DOC files
        robocopy "%USERPROFILE%" "%USB_DRIVE%\%DESTINATION_DIRECTORY%" *.doc *.docx /s /xd "Program Files" "Program Files (x86)" "wamp"

        REM Sync Excel files
        robocopy "%USERPROFILE%" "%USB_DRIVE%\%DESTINATION_DIRECTORY%" *.xls *.xlsx /s /xd "Program Files" "Program Files (x86)" "wamp"

        REM Display loading bar
        call :loading_bar
        echo.
        echo Files copied successfully to %USB_DRIVE%.
        goto :end
    )
)

REM If no USB drive with the destination directory is found
echo Destination directory not found on any USB drive.

:end
echo Press any key to exit...
pause >nul
endlocal
exit /b

:loading_bar
echo Uploading files:
setlocal enabledelayedexpansion
set "bar="
set "spaces=                                                 "
set "percent=0"
for /l %%i in (1,1,40) do (
    set /a "percent=100 * %%i / 40"
    <nul set /p "=%spaces%!bar:~0,%%i!!spaces:~0,40-%%i! [%percent%%%]"
    ping -n 1 localhost >nul
    set "bar=#!bar!"
)
endlocal
exit /b
