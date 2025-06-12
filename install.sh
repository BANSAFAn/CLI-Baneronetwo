#!/bin/bash

# Installation script for Baneronetwo CLI

# Define colors for output
RESET="\033[0m"
GREEN="\033[0;32m"
YELLOW="\033[0;33m"
RED="\033[0;31m"

# Define installation directory
INSTALL_DIR="/usr/local/bin"
SCRIPT_NAME="baneronetwo"
SCRIPT_PATH="$(pwd)/baneronetwo.sh"

# Check if script exists
if [ ! -f "$SCRIPT_PATH" ]; then
    echo -e "${RED}Error: baneronetwo.sh not found in current directory.${RESET}"
    exit 1
fi

# Make script executable
chmod +x "$SCRIPT_PATH"

# Check if we have permission to write to install directory
if [ ! -w "$INSTALL_DIR" ]; then
    echo -e "${YELLOW}Sudo permission required to install to $INSTALL_DIR${RESET}"
    sudo cp "$SCRIPT_PATH" "$INSTALL_DIR/$SCRIPT_NAME"
    if [ $? -ne 0 ]; then
        echo -e "${RED}Installation failed.${RESET}"
        exit 1
    fi
else
    cp "$SCRIPT_PATH" "$INSTALL_DIR/$SCRIPT_NAME"
fi

# Verify installation
if [ -f "$INSTALL_DIR/$SCRIPT_NAME" ]; then
    echo -e "${GREEN}Baneronetwo CLI installed successfully!${RESET}"
    echo -e "${YELLOW}You can now run '${SCRIPT_NAME}' from anywhere.${RESET}"
else
    echo -e "${RED}Installation failed.${RESET}"
    exit 1
fi

exit 0