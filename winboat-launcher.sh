#!/bin/bash

# --- CONFIGURATION ---
# NOTE: Users should place the winboat.AppImage in this relative path
APP_SUBDIR="Virtualizations"
APP_FILENAME="winboat.AppImage"
# ---------------------

APPDIR="$HOME/$APP_SUBDIR"
APPPATH="$APPDIR/$APP_FILENAME"

# --- 1. Check Prerequisites (Docker Group Membership) ---
# Check if the user is in the 'docker' group. This MUST be active before running WinBoat.
if ! groups | grep -q 'docker'; then
    echo "========================================================================"
    echo "ERROR: Docker Permissions Missing."
    echo "The current user is NOT a member of the 'docker' group."
    echo "Please ensure you have run: sudo usermod -aG docker \$USER"
    echo "Then, you MUST LOG OUT and LOG BACK IN to activate the group membership."
    echo "========================================================================"
    read -p "Press Enter to exit."
    exit 1
fi

# --- 2. Path Checks and Permissions ---
echo "Docker group confirmed active. Checking for WinBoat AppImage..."

if [ ! -d "$APPDIR" ]; then
    echo "Error: Application directory not found: $APPDIR"
    read -p "Press Enter to exit."
    exit 1
fi

# Change to the application directory to ensure AppImage execution context is correct
cd "$APPDIR" || { echo "Error: Could not navigate to $APPDIR"; read -p "Press Enter to exit."; exit 1; }

if [ ! -f "$APPPATH" ]; then
    echo "ERROR: WinBoat AppImage not found at: $APPPATH"
    read -p "Press Enter to exit."
    exit 1
fi

# Ensure the AppImage is executable
if [ ! -x "$APPPATH" ]; then
    echo "Warning: AppImage is not executable. Fixing permissions..."
    chmod +x "$APPPATH"
fi

# --- 3. Launch WinBoat ---
echo "Launching WinBoat..."
# Execute the AppImage relative to the current directory
"./$APP_FILENAME" --no-sandbox

if [ $? -ne 0 ]; then
    echo "WinBoat may have failed to launch. Check its output for errors."
fi

echo "Script complete. WinBoat window should now be visible."
read -p "Press Enter to close this terminal window."
exit 0
