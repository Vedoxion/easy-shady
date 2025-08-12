#!/usr/bin/env bash

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

clear

# ASCII Banner
echo -e "${CYAN}"
echo "  _________.__                .___       "
echo " /   _____/|  |__ _____     __| _/__.__. "
echo " \_____  \ |  |  \\\\__  \   / __ <   |  | "
echo " /        \|   Y  \\/ __ \_/ /_/ |\___  | "
echo "/_______  /|___|  (____  /\\\____ |/ ____| "
echo "        \\/      \\/     \\/      \\/\\/      "
echo -e "${NC}"

# Title
echo -e "${GREEN}        Shady's Installer${NC}"
echo -e "${CYAN}========================================${NC}"
echo -e "${YELLOW}1)${NC} Install Pterodactyl"
echo -e "${YELLOW}2)${NC} Install Blueprint"
echo -e "${YELLOW}3)${NC} Exit"
echo -e "${CYAN}========================================${NC}"

# Menu loop
while true; do
    read -p "Select an option [1-3]: " choice
    case $choice in
        1)
            echo -e "${GREEN}Installing Pterodactyl...${NC}"
            bash <(curl -fsSL https://pterodactyl-installer.se)
            break
            ;;
        2)
            echo -e "${GREEN}Installing Blueprint...${NC}"
            bash <(curl -fsSL https://raw.githubusercontent.com/shinzzlol/Shell/refs/heads/main/blueprint.sh)
            break
            ;;
        3)
            echo -e "${RED}Exiting... Goodbye from Shady!${NC}"
            exit 0
            ;;
        *)
            echo -e "${RED}Invalid choice. Try again.${NC}"
            ;;
    esac
done
