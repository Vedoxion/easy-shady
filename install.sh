#!/usr/bin/env bash

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function: typewriter effect
type_text() {
    text="$1"
    delay=${2:-0.002}
    for (( i=0; i<${#text}; i++ )); do
        echo -n "${text:$i:1}"
        sleep $delay
    done
    echo ""
}

# Function: loading dots
loading() {
    for i in {1..3}; do
        echo -n "."
        sleep 0.4
    done
    echo ""
}

clear

# Banner with typing effect
echo -e "${CYAN}"
type_text "  _________.__                .___       "
type_text " /   _____/|  |__ _____     __| _/__.__. "
type_text " \_____  \ |  |  \\\\__  \   / __ <   |  | "
type_text " /        \|   Y  \\/ __ \_/ /_/ |\___  | "
type_text "/_______  /|___|  (____  /\\\____ |/ ____| "
type_text "        \\/      \\/     \\/      \\/\\/      "
echo -e "${NC}"

type_text "${GREEN}           Welcome to Shady's Installer${NC}" 0.01
echo -e "${CYAN}========================================${NC}"

# Loop menu
while true; do
    echo -e "${YELLOW}1)${NC} Install Pterodactyl"
    echo -e "${YELLOW}2)${NC} Install Blueprint"
    echo -e "${YELLOW}3)${NC} Exit"
    echo -e "${CYAN}========================================${NC}"
    read -p "Select an option [1-3]: " choice

    case $choice in
        1)
            echo -e "${GREEN}Installing Pterodactyl${NC}"
            loading
            bash <(curl -fsSL https://pterodactyl-installer.se)
            ;;
        2)
            echo -e "${GREEN}Installing Blueprint${NC}"
            loading
            bash <(curl -fsSL https://raw.githubusercontent.com/shinzzlol/Shell/refs/heads/main/blueprint.sh)
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
