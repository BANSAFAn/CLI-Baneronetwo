#!/bin/bash

# Colors
RESET="\033[0m"
BLUE="\033[0;34m"
GREEN="\033[0;32m"
YELLOW="\033[0;33m"
CYAN="\033[0;36m"
RED="\033[0;31m"

# Get username from environment
USERNAME="${USER:-$(whoami)}"

# Decorative elements
DIVIDER="${CYAN}----------------------------------------${RESET}"

# Function to display links
display_links() {
  # Clear screen and show header
  clear
  echo -e "${YELLOW}Welcome, ${USERNAME}!${RESET}"
  echo -e "${DIVIDER}"

  # Display links
  echo -e "${BLUE}YouTube:${RESET} https://www.youtube.com/@Baneronetwo"
  echo -e "${GREEN}GitHub:${RESET}  https://github.com/BANSAFAn"

  echo -e "${DIVIDER}"
  echo -e "${YELLOW}Thanks for using Baneronetwo CLI!${RESET}"
}

# Function to install the script
install_script() {
  echo -e "${YELLOW}Installing Baneronetwo CLI...${RESET}"
  
  # Create temporary file
  TMP_FILE=$(mktemp)
  
  # Write script content to temporary file
  cat > "$TMP_FILE" << 'EOF'
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
EOF
  
  # Define installation directory
  INSTALL_DIR="/usr/local/bin"
  SCRIPT_NAME="baneronetwo"
  
  # Make script executable
  chmod +x "$TMP_FILE"
  
  # Check if we have permission to write to install directory
  if [ ! -w "$INSTALL_DIR" ]; then
    echo -e "${YELLOW}Sudo permission required to install to $INSTALL_DIR${RESET}"
    sudo cp "$TMP_FILE" "$INSTALL_DIR/$SCRIPT_NAME"
    if [ $? -ne 0 ]; then
      echo -e "${RED}Installation failed.${RESET}"
      rm "$TMP_FILE"
      return 1
    fi
  else
    cp "$TMP_FILE" "$INSTALL_DIR/$SCRIPT_NAME"
  fi
  
  # Remove temporary file
  rm "$TMP_FILE"
  
  # Verify installation
  if [ -f "$INSTALL_DIR/$SCRIPT_NAME" ]; then
    echo -e "${GREEN}Baneronetwo CLI installed successfully!${RESET}"
    echo -e "${YELLOW}You can now run '${SCRIPT_NAME}' from anywhere.${RESET}"
    return 0
  else
    echo -e "${RED}Installation failed.${RESET}"
    return 1
  fi
}

# Check for command line arguments
if [ "$1" = "--install" ]; then
  install_script
else
  display_links
fi