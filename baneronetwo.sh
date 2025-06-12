#!/bin/bash

# Colors
RESET="\033[0m"
BLUE="\033[0;34m"
GREEN="\033[0;32m"
YELLOW="\033[0;33m"
CYAN="\033[0;36m"

# Get username from environment
USERNAME="${USER:-$(whoami)}"

# Decorative elements
DIVIDER="${CYAN}----------------------------------------${RESET}"

# Clear screen and show header
clear
echo -e "${YELLOW}Welcome, ${USERNAME}!${RESET}"
echo -e "${DIVIDER}"

# Display links
echo -e "${BLUE}YouTube:${RESET} https://www.youtube.com/@Baneronetwo"
echo -e "${GREEN}GitHub:${RESET}  https://github.com/BANSAFAn"

echo -e "${DIVIDER}"
echo -e "${YELLOW}Thanks for using Baneronetwo CLI!${RESET}"