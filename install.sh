#!/usr/bin/env bash

# Colors & Effects
RED='\033[0;31m'
ORANGE='\033[0;33m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
BOLD='\033[1m'
BLINK='\033[5m'
NC='\033[0m'

# Typing animation
type_text() {
  local text="$1"
  local color="$2"
  local delay=${3:-0.002}
  for (( i=0; i<${#text}; i++ )); do
    echo -ne "${color}${text:$i:1}${NC}"
    sleep $delay
  done
  echo
}

# Spinner during command execution
spinner() {
  local pid=$!
  local delay=0.1
  local spinstr='|/-\'
  while kill -0 $pid 2>/dev/null; do
    for i in $(seq 0 3); do
      printf "\r${CYAN} [%c]${NC} " "${spinstr:i:1}"
      sleep $delay
    done
  done
  printf "\r"
}

clear

# Rainbow ASCII Banner lines & colors
banner_lines=(
"  _________.__                .___       "
" /   _____/|  |__ _____     __| _/__.__. "
" \_____  \ |  |  \\__  \   / __ <   |  | "
" /        \|   Y  \/ __ \_/ /_/ |\___  | "
"/_______  /|___|  (____  /\____ |/ ____| "
"        \/      \/     \/      \/\/      "
)

colors=("$RED" "$ORANGE" "$YELLOW" "$GREEN" "$BLUE" "$PURPLE")

# Print banner with rainbow colors and slight delay
for i in "${!banner_lines[@]}"; do
  type_text "${banner_lines[i]}" "${colors[i]}" 0.005
done

type_text "         Welcome to Shady's Installer" "$GREEN" 0.01

echo -e "${CYAN}========================================${NC}"

# Menu loop
while true; do
  echo -e "${YELLOW}1)${NC} Install Pterodactyl"
  echo -e "${YELLOW}2)${NC} Install Blueprint"
  echo -e "${YELLOW}3)${NC} Install Both"
  echo -e "${YELLOW}4)${NC} Exit"
  echo -e "${CYAN}========================================${NC}"

  read -rp "Select an option [1-4]: " choice

  case "$choice" in
    1)
      echo -e "${GREEN}Running Pterodactyl installer...${NC}"
      bash <(curl -s https://pterodactyl-installer.se) &
      spinner
      ;;
    2)
      echo -e "${GREEN}Running Blueprint installer...${NC}"
      bash <(curl -s https://raw.githubusercontent.com/shinzzlol/Shell/refs/heads/main/blueprint.sh) &
      spinner
      ;;
    3)
      echo -e "${GREEN}Running both installers sequentially...${NC}"
      bash <(curl -s https://pterodactyl-installer.se) &
      spinner
      bash <(curl -s https://raw.githubusercontent.com/shinzzlol/Shell/refs/heads/main/blueprint.sh) &
      spinner
      ;;
    4)
      echo -e "${RED}Exiting... Goodbye from Shady!${NC}"
      exit 0
      ;;
    *)
      echo -e "${RED}Invalid option, try again.${NC}"
      ;;
  esac
done
