#!/bin/bash

# Check if the script is running as root
if [ "$(id -u)" != "0" ]; then
    echo "This script must be run as root. Please run with sudo."
    exit 1
fi

# Ask user to input data for each variable
echo "Please provide the following information:"
read -p "Name of the application: " APP
read -p "Comment about the application: " COMMENT
read -p "Path to the application, e.g /home/someuser/tools/APP: " APP_DIR
read -p "Path to the icon file, e.g /home/someuser/tools/APP.png: " ICON_DIR

# Build the desktop file contents with the user's input
DESKTOP_FILE="[Desktop Entry]
Name=$APP
Comment=$COMMENT
Exec=$APP_DIR %U
Icon=$ICON_DIR
Terminal=false
Type=Application
Encoding=UTF-8
Categories=Network;Application;
Name[en_US]=$APP"

# Display the desktop file contents to the user and ask for confirmation
echo "The following desktop file will be created:"
echo "$DESKTOP_FILE"
read -p "Is this correct? (y/n) " CONFIRM

# Create the desktop file if the user confirmed
if [ "$CONFIRM" == "y" ]; then
    echo "$DESKTOP_FILE" | sudo tee /usr/share/applications/$APP.desktop > /dev/null
    echo "Desktop file created at /usr/share/applications/$APP.desktop"
else
    echo "Desktop file creation cancelled"
fi
