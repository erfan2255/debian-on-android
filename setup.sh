#!/bin/bash
#
# Enhanced Automated Debian Setup Script
# This script installs a Debian environment with a full XFCE desktop,
# It is designed to be run in a Termux-like environment.
#

# Stop the script if any command fails
set -e

# --- Color Definitions ---
C_BLUE='\033[1;34m'
C_GREEN='\033[1;32m'
C_YELLOW='\033[1;33m'
C_CYAN='\033[1;36m'
C_RESET='\033[0m'

# --- Welcome Message ---
clear
echo -e "${C_CYAN}"
cat << "EOF"
 ____       _     _
|  _ \  ___| |__ (_) __ _ _ __
| | | |/ _ \ '_ \| |/ _` | '_ \
| |_| |  __/ |_) | | (_| | | | |
|____/ \___|_.__/|_|\__,_|_| |_|
EOF
echo -e "\n${C_GREEN}Welcome to the Enhanced Debian Setup Script!${C_RESET}"
echo "This will prepare a full desktop environment for you."
echo ""

# --- [1/6] User Input ---
echo -e "${C_YELLOW}>>> [1/6] Let's create your user account.${C_RESET}"
read -p "Please enter a username: " NEW_USER
read -s -p "Please enter a password for '$NEW_USER': " NEW_PASS
echo ""
read -s -p "Retype password: " NEW_PASS_CONFIRM
echo ""

if [ "$NEW_PASS" != "$NEW_PASS_CONFIRM" ]; then
    echo "Passwords do not match. Aborting."
    exit 1
fi

# --- [2/6] Base System Setup (in Termux) ---
echo -e "\n${C_BLUE}>>> [2/6] Updating base system packages...${C_RESET}"
pkg update -y && pkg upgrade -y

echo -e "\n${C_BLUE}>>> [2/6] Installing proot-distro...${C_RESET}"
pkg install proot-distro -y

echo -e "\n${C_BLUE}>>> [2/6] Installing Debian...${C_RESET}"
proot-distro install debian


# --- [3/6] Debian Configuration (as root) ---
echo -e "\n${C_BLUE}>>> [3/6] Configuring Debian system as root...${C_RESET}"

run_in_debian() {
    proot-distro login debian --shared-tmp -- /bin/bash -c "$@"
}

echo "--> Updating Debian's package list and upgrading packages..."
run_in_debian "apt-get update && apt-get upgrade -y"

echo "--> Installing required packages: sudo, nano, adduser..."
run_in_debian "apt-get install -y sudo nano adduser"

echo "--> Setting timezone to Asia/Tehran..."
run_in_debian "ln -fs /usr/share/zoneinfo/Asia/Tehran /etc/localtime"
run_in_debian "apt-get install -y tzdata"
run_in_debian "dpkg-reconfigure --frontend noninteractive tzdata"

echo "--> Creating new user '$NEW_USER'..."
echo -e "${NEW_PASS}\n${NEW_PASS}\n${NEW_USER}\n\n\n\n\ny" | run_in_debian "adduser $NEW_USER"

echo "--> Granting '$NEW_USER' user sudo privileges..."
run_in_debian "usermod $NEW_USER -g sudo"


# --- [4/6] Desktop & Apps Setup (as new user) ---
echo -e "\n${C_BLUE}>>> [4/6] Setting up Desktop & Applications as '$NEW_USER'...${C_RESET}"

run_as_user() {
    proot-distro login debian --user $NEW_USER --shared-tmp -- /bin/bash -c "$@"
}

echo "--> Installing XFCE Desktop, VNC Server, Firefox, and LibreOffice..."
INSTALL_CMD="apt-get install -y xfce4 xfce4-goodies tigervnc-standalone-server dbus-x11 firefox-esr libreoffice libreoffice-gtk3 libreoffice-gnome"
echo "${NEW_PASS}" | run_as_user "sudo -S $INSTALL_CMD"


# --- [5/6] Create VNC Resolution Selector Script ---
echo -e "\n${C_BLUE}>>> [5/6] Creating VNC resolution selector script inside Debian...${C_RESET}"
# This script will be called by the 'startvnc' alias.
VNC_SCRIPT_PATH="/home/$NEW_USER/start_vnc_session.sh"
run_as_user "touch $VNC_SCRIPT_PATH"
run_as_user "chmod +x $VNC_SCRIPT_PATH"
# Use 'cat << EOF | command' to write a multi-line script into the user's home directory.
cat << 'EOF' | run_as_user "cat > $VNC_SCRIPT_PATH"
#!/bin/bash
C_CYAN='\033[1;36m'
C_YELLOW='\033[1;33m'
C_RESET='\033[0m'

echo -e "${C_CYAN}--- VNC Server Resolution ---${C_RESET}"
echo "1) 1280x720  (HD)"
echo "2) 1920x1080 (Full HD - Recommended)"
echo "3) 1600x900"
echo "4) Custom"
echo ""
read -p "Select an option [2]: " choice
choice=${choice:-2} # Default to 2 if user just presses Enter

case $choice in
    1) GEOMETRY="1280x720";;
    2) GEOMETRY="1920x1080";;
    3) GEOMETRY="1600x900";;
    4) read -p "Enter custom resolution (e.g., 1440x900): " GEOMETRY;;
    *) echo "Invalid option. Exiting."; exit 1;;
esac

echo -e "${C_YELLOW}Starting VNC server with resolution: $GEOMETRY${C_RESET}"
vncserver :1 -geometry $GEOMETRY -depth 24
EOF


# --- [6/6] Create Aliases in Debian ---
echo -e "\n${C_BLUE}>>> [6/6] Creating convenient aliases inside Debian for '$NEW_USER'...${C_RESET}"
DEBIAN_BASHRC="/home/$NEW_USER/.bashrc"
run_as_user "echo '' >> $DEBIAN_BASHRC"
run_as_user "echo '# --- VNC Aliases ---' >> $DEBIAN_BASHRC"
# The startvnc alias now runs the selector script we just created.
run_as_user "echo \"alias startvnc='~/start_vnc_session.sh'\" >> $DEBIAN_BASHRC"
run_as_user "echo \"alias stopvnc='vncserver -kill :1'\" >> $DEBIAN_BASHRC"
# Create an alias for logging into Debian from Termux
BASHRC_FILE="$HOME/.bashrc"
echo "" >> $BASHRC_FILE
echo "# --- Debian Alias ---" >> $BASHRC_FILE
echo "alias debian='proot-distro login debian --user $NEW_USER --shared-tmp'" >> $BASHRC_FILE
echo "Alias 'debian' has been added to your Termux .bashrc!"


# --- [6/6] Final Instructions ---
echo ""
echo -e "${C_GREEN}=================================================${C_RESET}"
echo -e "${C_GREEN}          SETUP COMPLETE!                        ${C_RESET}"
echo -e "${C_GREEN}=================================================${C_RESET}"
echo ""
echo -e "To log into your Debian system from Termux, just type:"
echo -e "  '${C_CYAN}debian${C_RESET}'"
echo ""
echo -e "Once you are logged in, you can start the VNC server for the first time:"
echo -e "  '${C_CYAN}startvnc${C_RESET}'"
echo ""
echo -e "${C_YELLOW}You will be prompted to select a resolution and create a VNC password.${C_RESET}"
echo ""
echo "After starting, you can connect using a VNC client at:"
echo -e "  ${C_CYAN}localhost:1${C_RESET}  (which is 127.0.0.1 on port 5901)"
echo ""
echo "Inside Debian, you can also use:"
echo -e "  '${C_CYAN}stopvnc${C_RESET}'   - to stop the VNC server."
echo -e "  '${C_CYAN}exit${C_RESET}'      - to log out and return to Termux."
echo ""
echo -e "${C_YELLOW}IMPORTANT: Open a new Termux/Debian session or run 'source ~/.bashrc' for the aliases to work.${C_RESET}"
echo -e "${C_CYAN}                                          by CoreLand${C_RESET}"
echo -e "${C_GREEN}=================================================${C_RESET}"

