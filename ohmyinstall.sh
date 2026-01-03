#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${BLUE}=========================================="
echo -e "      OMARCHY SETTINGS GUI INSTALLER      "
echo -e "==========================================${NC}\n"

if ! command -v yay &> /dev/null; then
    echo -e "${RED}[!] Error: 'yay' is not installed. Please install it first.${NC}"
    exit 1
fi

# 2. Sync and Install Dependencies
echo -e "${YELLOW}[1/4] Installing dependencies via yay...${NC}"
DEPENDENCIES="python python-gobject gtk3 gtk4 python-pip"
yay -S --needed --noconfirm $DEPENDENCIES


echo -e "${YELLOW}[2/4] Setting up directories...${NC}"
mkdir -p "$HOME/.config/hypr"
mkdir -p "$HOME/.local/share/applications"

echo -e "${YELLOW}[3/4] Deploying application files...${NC}"


if [ -f "omarchy-control.py" ]; then
    cp omarchy-control.py "$HOME/.config/hypr/"
    chmod +x "$HOME/.config/hypr/omarchy-control.py"
    echo -e "${GREEN}[+] omarchy-control.py -> ~/.config/hypr/${NC}"
else
    echo -e "${RED}[!] Error: omarchy-control.py not found in current folder!${NC}"
fi


DESKTOP_FILE="$HOME/.local/share/applications/omarchy-settings.desktop"

cat <<EOF > "$DESKTOP_FILE"
[Desktop Entry]
Type=Application
Name=Omarchy Settings
Comment=Liquid Glass Configuration Manager for Hyprland
Exec=python3 $HOME/.config/hypr/omarchy-control.py
Icon=preferences-system
Categories=Settings;System;
Terminal=false
EOF

chmod +x "$DESKTOP_FILE"
echo -e "${GREEN}[+] Desktop Entry created at ~/.local/share/applications/${NC}"

# 5. Finalize
echo -e "\n${YELLOW}[4/4] Finalizing...${NC}"
update-desktop-database "$HOME/.local/share/applications" &> /dev/null

echo -e "\n${BLUE}==========================================${NC}"
echo -e "${GREEN}   INSTALLATION COMPLETE!${NC}"
echo -e "   You can now launch 'Omarchy Settings'"
echo -e "   from your App Launcher (wallker/wofi/etc.)${NC}"
echo -e "${BLUE}==========================================${NC}"
