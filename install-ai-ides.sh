#!/bin/bash
#
# Standalone AI IDEs Installer for Linux (Debian/Ubuntu/PRoot/Raspberry Pi/x86_64)
# Installs Google Antigravity 2.0 & Reasonix Desktop GUI
#
set -e

# --- Colors ---
C_BLUE='\033[1;34m'
C_GREEN='\033[1;32m'
C_YELLOW='\033[1;33m'
C_CYAN='\033[1;36m'
C_RESET='\033[0m'

echo -e "${C_CYAN}"
echo "=========================================================="
echo "      🤖 AI IDEs Installer (Antigravity 2.0 & Reasonix)    "
echo "=========================================================="
echo -e "${C_RESET}"

# Check for root/sudo
if [ "$EUID" -ne 0 ]; then
    SUDO="sudo"
else
    SUDO=""
fi

# Detect Architecture
ARCH=$(uname -m)
echo -e "Detected Architecture: ${C_YELLOW}$ARCH${C_RESET}"

# Install Dependencies
echo -e "\n${C_BLUE}>>> [1/3] Installing Dependencies...${C_RESET}"
$SUDO apt-get update
$SUDO apt-get install -y curl wget tar jq libnss3 libsecret-1-0 libx11-xcb1 libgbm1 xdg-utils zenity || true

# --- Function: Install Google Antigravity 2.0 ---
install_antigravity() {
    echo -e "\n${C_BLUE}>>> [2/3] Installing Google Antigravity 2.0...${C_RESET}"
    $SUDO mkdir -p /opt/antigravity
    
    if [ "$ARCH" == "aarch64" ] || [ "$ARCH" == "arm64" ]; then
        DOWNLOAD_URL="https://storage.googleapis.com/antigravity-public/antigravity-hub/2.8.1-6512087774658560/linux-arm/Antigravity.tar.gz"
    else
        DOWNLOAD_URL="https://storage.googleapis.com/antigravity-public/antigravity-hub/2.8.1-6512087774658560/linux-x64/Antigravity.tar.gz"
    fi

    echo "Downloading from: $DOWNLOAD_URL"
    curl -fsSL "$DOWNLOAD_URL" | $SUDO tar -xz -C /opt/antigravity --strip-components=1

    # Create wrapper binary
    cat << 'EOF' | $SUDO tee /usr/local/bin/antigravity > /dev/null
#!/bin/bash
exec /opt/antigravity/antigravity --no-sandbox "$@"
EOF
    $SUDO chmod +x /usr/local/bin/antigravity

    # Create Desktop Launcher
    cat << 'EOF' | $SUDO tee /usr/share/applications/antigravity.desktop > /dev/null
[Desktop Entry]
Version=1.0
Type=Application
Name=Google Antigravity 2.0
Comment=AI-Powered Agentic IDE
Exec=/usr/local/bin/antigravity %F
Icon=/opt/antigravity/resources/app/resources/linux/code.png
Terminal=false
Categories=Development;IDE;
StartupNotify=true
EOF
    $SUDO chmod +x /usr/share/applications/antigravity.desktop

    # Copy to user Desktop if exists
    if [ -d "$HOME/Desktop" ]; then
        cp /usr/share/applications/antigravity.desktop "$HOME/Desktop/Antigravity_2.0.desktop" 2>/dev/null || true
        chmod +x "$HOME/Desktop/Antigravity_2.0.desktop" 2>/dev/null || true
    fi

    echo -e "${C_GREEN}✔ Google Antigravity 2.0 installed successfully!${C_RESET}"
}

# --- Function: Install Reasonix Desktop ---
install_reasonix() {
    echo -e "\n${C_BLUE}>>> [3/3] Installing Reasonix Desktop...${C_RESET}"
    $SUDO mkdir -p /opt/reasonix /tmp/reasonix_download

    if [ "$ARCH" == "aarch64" ] || [ "$ARCH" == "arm64" ]; then
        MATCH_PATTERN="browser_download_url.*reasonix-linux-arm64.tar.gz"
    else
        MATCH_PATTERN="browser_download_url.*reasonix-linux-x64.tar.gz"
    fi

    echo "Fetching latest Reasonix release..."
    LATEST_URL=$(curl -s https://api.github.com/repos/esengine/DeepSeek-Reasonix/releases/latest | grep -E "$MATCH_PATTERN" | head -n 1 | cut -d '"' -f 4 || true)

    if [ -n "$LATEST_URL" ]; then
        echo "Downloading Reasonix from: $LATEST_URL"
        wget -q --show-progress -O /tmp/reasonix_download/reasonix.tar.gz "$LATEST_URL"
        $SUDO tar -xzf /tmp/reasonix_download/reasonix.tar.gz -C /opt/reasonix
        rm -rf /tmp/reasonix_download
    else
        echo -e "${C_YELLOW}⚠ Direct release archive not found via API, falling back to npm build...${C_RESET}"
        $SUDO apt-get install -y nodejs npm
        $SUDO npm install -g @esengine/reasonix || $SUDO npm install -g reasonix || true
    fi

    # Create Reasonix executable wrapper
    REASONIX_BIN=$(find /opt/reasonix -type f -executable -name 'reasonix*' 2>/dev/null | head -n 1)
    if [ -n "$REASONIX_BIN" ]; then
        cat << EOF | $SUDO tee /usr/local/bin/reasonix > /dev/null
#!/bin/bash
exec "$REASONIX_BIN" --no-sandbox "\$@"
EOF
        $SUDO chmod +x /usr/local/bin/reasonix
    fi

    # Create Reasonix Desktop entry
    cat << 'EOF' | $SUDO tee /usr/share/applications/reasonix.desktop > /dev/null
[Desktop Entry]
Version=1.0
Type=Application
Name=Reasonix Desktop
Comment=DeepSeek & AI Reasoning Canvas
Exec=/usr/local/bin/reasonix %F
Icon=text-editor
Terminal=false
Categories=Development;IDE;
StartupNotify=true
EOF
    $SUDO chmod +x /usr/share/applications/reasonix.desktop

    # Copy to user Desktop if exists
    if [ -d "$HOME/Desktop" ]; then
        cp /usr/share/applications/reasonix.desktop "$HOME/Desktop/Reasonix_Desktop.desktop" 2>/dev/null || true
        chmod +x "$HOME/Desktop/Reasonix_Desktop.desktop" 2>/dev/null || true
    fi

    echo -e "${C_GREEN}✔ Reasonix Desktop installed successfully!${C_RESET}"
}

# Run Installation
install_antigravity
install_reasonix

echo ""
echo -e "${C_GREEN}==========================================================${C_RESET}"
echo -e "${C_GREEN}   🎉 Both AI Desktop GUI Applications Are Ready!        ${C_RESET}"
echo -e "${C_GREEN}==========================================================${C_RESET}"
echo -e "You can launch them via:"
echo -e "  1. Terminal:  ${C_CYAN}antigravity${C_RESET}  or  ${C_CYAN}reasonix${C_RESET}"
echo -e "  2. Desktop:   Double-click the icons on your Desktop or Menu"
echo ""
