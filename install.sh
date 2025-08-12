#!/bin/bash

# Colors
RED='\033[0;31m'
ORANGE='\033[0;33m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
NC='\033[0m' # No Color

# Rainbow ASCII Logo
echo -e "${RED}  _________.__                .___       "
echo -e "${ORANGE} /   _____/|  |__ _____     __| _/__.__. "
echo -e "${YELLOW} \_____  \ |  |  \\\__  \   / __ <   |  | "
echo -e "${GREEN} /        \|   Y  \/ __ \_/ /_/ |\___  | "
echo -e "${BLUE}/_______  /|___|  (____  /\____ |/ ____|"
echo -e "${PURPLE}        \/      \/     \/      \/\/      "
echo -e "${NC}"

# Typing effect function
typewriter() {
    text="$1"
    delay="${2:-0.03}"
    for ((i=0; i<${#text}; i++)); do
        echo -n "${text:$i:1}"
        sleep "$delay"
    done
    echo
}

# Welcome message
typewriter "Welcome to the SHADY Easy Installer 🚀" 0.04
typewriter "Let's get your system ready..." 0.04

# Progress bar
progress_bar() {
    local duration=$1
    already_done() { for ((done=0; done<$1; done++)); do echo -n "▰"; done }
    remaining() { for ((remain=$1; remain<$2; remain++)); do echo -n "▱"; done }
    for ((elapsed=1; elapsed<=$duration; elapsed++)); do
        already_done $elapsed
        remaining $elapsed $duration
        printf "  %s%%\r" $((elapsed * 100 / duration))
        sleep 0.1
    done
    echo
}

# Install packages
typewriter "Installing base packages..." 0.04
progress_bar 20
sudo apt update && sudo apt install -y git curl unzip htop neofetch

typewriter "Installation complete ✅" 0.04
echo -e "${GREEN}All set, Shady!${NC}"
