#!/bin/bash

# Define ANSI color escape codes
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Function to copy files to USB
copy_files_to_usb() {
    # Find all mounted USB drives
    for USB_DRIVE in /media/*; do
        DESTINATION_DIRECTORY="$USB_DRIVE/backups"
        # Check if the destination directory exists on the USB drive
        if [ -d "$DESTINATION_DIRECTORY" ]; then
            # Sync image files
            find "$HOME" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" \) -exec cp -r "{}" "$DESTINATION_DIRECTORY" \;

            # Sync PDF files
            find "$HOME" -type f -iname "*.pdf" -exec cp -r "{}" "$DESTINATION_DIRECTORY" \;

            # Sync DOC files
            find "$HOME" -type f \( -iname "*.doc" -o -iname "*.docx" \) -exec cp -r "{}" "$DESTINATION_DIRECTORY" \;

            # Sync Excel files
            find "$HOME" -type f \( -iname "*.xls" -o -iname "*.xlsx" \) -exec cp -r "{}" "$DESTINATION_DIRECTORY" \;

            echo -e "${GREEN}Files copied successfully to $USB_DRIVE.${NC}"
            return
        fi
    done
    echo -e "${GREEN}Destination directory not found on any USB drive.${NC}"
}

# Check if the operating system is Linux
if [ "$(uname)" == "Linux" ]; then
    copy_files_to_usb
else
    echo -e "${GREEN}This script is intended to run on Linux only.${NC}"
fi
