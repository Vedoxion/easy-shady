#!/usr/bin/env bash

# Colors & Effects
RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
PURPLE='\033[0;35m'
BOLD='\033[1m'
BLINK='\033[5m'
NC='\033[0m' # No Color

# Function: typewriter effect
type_text() {
    text="$1"
    color="$2"
    delay=${3:-0.002}
    for (( i=0; i<${#text}; i++ )); do
        echo -ne "${color}${text:$i:1}${NC}"
        sleep $delay
    done
    echo ""
}

# Function: loading animation
loading() {
    echo -ne "${CYAN}Loading"
    for i in {1..3}; do
        echo -n "."
        sleep 0.3
    done
    echo -e "${NC}"
}

# Function: glowing menu
glow_menu() {
    echo -e "${BOLD}${YELLOW}${BLINK}1)${NC} ${GREEN}Install Pterodactyl${NC}"
    echo -e "${BOLD}${YELLOW}${BLINK}2)${NC} ${GREEN}Install Blueprint${NC}"
    echo -e "${BOLD}${YELLOW}${BLINK}3)${NC} ${RED}Exit${NC}"
}

clear

# Colored ASCII Banner
type_text "  _________.__                .___       " "$CYAN"
type_text " /   _____/|  |__ _____     __| _/__.__. " "$GREEN"
type_text " \_____  \ |  |  \\\\__  \   / __ <   |  | " "$YELLOW"
type_text " /        \|   Y  \\/ __ \_/ /_/ |\___  | " "$PURPLE"
type_text "/_______  /|___|  (____  /\\\____ |/ ____| " "$RED"
type_text "        \\/      \\/     \\/      \\/\\/      " "$CYAN"

echo -e "${GREEN}            Welcome to Shady's Installer${NC}"
echo -e "${CYAN}================================================${NC}"

# Loop menu
while true; do
    glow_menu
    echo -e "${CYAN}================================================${NC}"
    read -p "Select an option [1-3]: " choice

    case $choice in
        1)
            echo -e "${GREEN}Starting Pterodactyl installation...${NC}"
            loading
            bash <(curl -fsSL https://pterodactyl-installer.se)
            ;;
        2)
            echo -e "${GREEN}Starting Blueprint installation...${NC}"
            loading
            bash <(curl -fsSL https://raw.githubusercontent.com/shinzzlol/Shell/refs/heads/main/blueprint.sh)
            ;;
        3)
            echo -e "${RED}Shutting down Shady's Installer... Goodbye!${NC}"
            exit 0
            ;;
        *)
            echo -e "${RED}Invalid choice. Try again.${NC}"
            ;;
    esac
done
