# Reverse Shell Launcher with Nmap Integration and USB File Copy

This repository contains a script for launching a reverse shell, integrating Nmap for network scanning, and copying
files to a USB drive.

## Features

- **Reverse Shell Launcher:** Launch a reverse shell by specifying an IP address and port.
- **Nmap Integration:** Use Nmap for network scanning and enumeration.
- **USB File Copy:** Copy files to a USB drive for backup or transfer.

## Usage

1. **Launching Reverse Shell:**
    - Run the script and follow the prompts to enter the IP address and port for the reverse shell.

2. **Nmap Integration:**
    - Ensure Nmap is installed and available in the system's PATH.
    - Script will download and install Nmap if not existent
    - The script will automatically detect if Nmap is installed and display its status.

3. **Copying Files to USB:**
    - Connect a USB drive to your system.
    - Run the script start.bat there is an Autorun but since defender on windows you might need to do it manually, and
      if a USB drive is detected, files will be copied to it.
    - When you launch start.bat it will do everything
    - Files will be copied to backups directory in the USB

## Requirements

- Windows operating system
- Linux operating system
- USB drive connected (optional for USB file copy)

## Disclaimer

**Disclaimer: For Testing Purposes Only**

This script is provided for testing and educational purposes only. It is intended to demonstrate various concepts
related to scripting and network security.

**Usage Restrictions:**

- Do not use this script on any system or network without proper authorization.
- Ensure that you have permission from the system owner before running any tests.
- Use this script responsibly and ethically, and do not engage in any activities that may violate laws or regulations.

The author of this script is not responsible for any misuse or damage caused by its use. By using this script, you agree
to assume all responsibility for your actions.

**Use at Your Own Risk:**

- This script may contain bugs or errors that could potentially cause unintended consequences.
- Always review and understand the code before executing it on your system.
- Use caution when running scripts downloaded from the internet, and consider reviewing them with a trusted source
  before use.

By using this script, you acknowledge that you have read, understood, and agree to the terms outlined in this
disclaimer.

## License

This project is licensed under the [MIT License](LICENSE).
