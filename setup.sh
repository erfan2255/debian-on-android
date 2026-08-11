#!/bin/bash
#
# Ultimate Unified Debian Setup Script for Termux (v8 GUI Ease-of-Use Masterclass)
# Features: Power Profiles, Box64, DX12, Android Integration, Double-Click EXE, Zenity
#
set -e

# --- Color Definitions ---
C_BLUE='\033[1;34m'
C_GREEN='\033[1;32m'
C_YELLOW='\033[1;33m'
C_CYAN='\033[1;36m'
C_RED='\033[1;31m'
C_RESET='\033[0m'

# --- Welcome Message ---
clear
echo -e "${C_CYAN}"
cat << "EOF"
  ______      __            ___  ___  _____  _____ 
 |  ____|    / _|          |__ \|__ \| ____|| ____|
 | |__   _ _| |_ __ _ _ __    ) |  ) | |__  | |__  
 |  __| | '__|  _/ _` | '_ \ / /  / /|___ \ |___ \ 
 | |____| |  | || (_| | | | / /_ / /_ ___) | ___) |
 |______|_|  |_| \__,_|_| |_\____\____|____/ |____/ 

EOF
echo -e "\n${C_GREEN}Welcome to the Erfan2255 Ultimate OS Setup (v8)${C_RESET}"
echo "Configuring the most advanced environment possible..."
echo ""

# Request Android Storage Permission
echo -e "${C_BLUE}>>> Requesting Android Storage Permissions (for Desktop integration)...${C_RESET}"
termux-setup-storage
sleep 2

# --- [1] Phantom Process Check ---
echo -e "\n${C_BLUE}>>> [1/8] Android System Check...${C_RESET}"
API_LEVEL=$(getprop ro.build.version.sdk 2>/dev/null || echo "0")
if [ "$API_LEVEL" -ge 31 ]; then
    echo -e "${C_RED}WARNING: Android 12+ detected (API $API_LEVEL)!${C_RESET}"
    echo "Android's Phantom Process Killer WILL terminate Termux during heavy use."
    echo -e "To fix this permanently, run this command from a PC via ADB:"
    echo -e "${C_YELLOW}adb shell \"/system/bin/device_config put activity_manager max_phantom_processes 2147483647\"${C_RESET}"
    echo ""
    read -p "Press Enter to acknowledge and continue..."
else
    echo "Android version looks good. No Phantom Process issues expected."
fi

# --- [2] User Configuration Prompts ---
echo -e "\n${C_YELLOW}>>> [2/8] Select Display Server Setup${C_RESET}"
echo "1) VNC Only (Stable, widely compatible)"
echo "2) Termux-X11 Only (Better integration, faster)"
echo "3) Both"
read -p "Choose [3]: " DISP_CHOICE
DISP_CHOICE=${DISP_CHOICE:-3}

WANT_VNC=false
WANT_X11=false
if [ "$DISP_CHOICE" == "1" ]; then WANT_VNC=true; fi
if [ "$DISP_CHOICE" == "2" ]; then WANT_X11=true; fi
if [ "$DISP_CHOICE" == "3" ]; then WANT_VNC=true; WANT_X11=true; fi

if $WANT_X11; then
    echo -e "\n${C_YELLOW}>>> Select Hardware Acceleration (Termux-X11)${C_RESET}"
    echo "1) Snapdragon/Adreno Optimized (Turnip + Zink) - Recommended for Poco F3 / Pad 7"
    echo "2) Universal (VirGL) - Recommended for Mali GPUs"
    echo "3) None (Software Rendering)"
    read -p "Choose [1]: " HW_CHOICE
    HW_CHOICE=${HW_CHOICE:-1}
else
    HW_CHOICE=3
fi

echo -e "\n${C_YELLOW}>>> Select Desktop Environment${C_RESET}"
echo "1) XFCE4 (Balanced, Beautiful, Highly Recommended)"
echo "2) LXQt (Ultra-lightweight battery saver)"
echo "3) i3wm (Keyboard-driven, minimalist)"
read -p "Choose [1]: " DE_CHOICE
DE_CHOICE=${DE_CHOICE:-1}

echo -e "\n${C_YELLOW}>>> Select UI Scaling & Touch Mode${C_RESET}"
echo "1) Tablet Mode (Large Icons, High DPI, Virtual On-Screen Keyboard)"
echo "2) Desktop Mode (Standard Mouse/Keyboard Scaling)"
read -p "Choose [1]: " TOUCH_CHOICE
TOUCH_CHOICE=${TOUCH_CHOICE:-1}

echo -e "\n${C_YELLOW}>>> Select Web Browser${C_RESET}"
echo "1) Firefox (Standard)"
echo "2) Chromium (Hardware Accelerated via Vulkan)"
echo "3) Both"
echo "4) None"
read -p "Choose [3]: " BROW_CHOICE
BROW_CHOICE=${BROW_CHOICE:-3}

echo -e "\n${C_YELLOW}>>> Select Graphical AI Code Editor${C_RESET}"
echo "1) Reasonix Desktop App (ARM64)"
echo "2) Cursor IDE (ARM64)"
echo "3) Visual Studio Code (ARM64)"
echo "4) None"
read -p "Choose [1]: " IDE_CHOICE
IDE_CHOICE=${IDE_CHOICE:-1}

echo -e "\n${C_YELLOW}>>> Select CLI AI Coding Agents${C_RESET}"
echo "1) Reasonix CLI (Node.js)"
echo "2) Aider (Python)"
echo "3) Both"
echo "4) None"
read -p "Choose [4]: " CLI_CHOICE
CLI_CHOICE=${CLI_CHOICE:-4}

echo -e "\n${C_YELLOW}>>> Select PC Gaming/Emulation Support${C_RESET}"
echo "1) Install Pro-Gamer Windows Emulation (Box86/64, Wine, DXVK, VKD3D, DX8)"
echo "2) None"
read -p "Choose [1]: " GAMING_CHOICE
GAMING_CHOICE=${GAMING_CHOICE:-1}

echo -e "\n${C_YELLOW}>>> Install Developer Toolkit?${C_RESET}"
echo "1) Yes (Python, Node.js, Go, Rust, Git, Build-tools)"
echo "2) No"
read -p "Choose [1]: " DEV_CHOICE
DEV_CHOICE=${DEV_CHOICE:-1}

echo -e "\n${C_YELLOW}>>> Let's create your user account${C_RESET}"
read -p "Please enter a username: " NEW_USER
read -s -p "Please enter a password for '$NEW_USER': " NEW_PASS
echo ""
read -s -p "Retype password: " NEW_PASS_CONFIRM
echo ""
if [ "$NEW_PASS" != "$NEW_PASS_CONFIRM" ]; then echo "Passwords do not match. Aborting."; exit 1; fi

# --- [3] Base System Setup (in Termux) ---
echo -e "\n${C_BLUE}>>> [3/8] Setting up base packages in Termux...${C_RESET}"
pkg update -y && pkg upgrade -y
pkg install proot-distro pulseaudio wget git curl tar zstd -y

if $WANT_X11; then
    echo "--> Installing X11 and Hardware Acceleration packages..."
    pkg install x11-repo tur-repo -y
    pkg install termux-x11-nightly -y
    if [ "$HW_CHOICE" == "1" ]; then
        pkg install mesa-zink virglrenderer-mesa-zink vulkan-loader-android -y
    elif [ "$HW_CHOICE" == "2" ]; then
        pkg install virglrenderer-android -y
    fi
fi

echo "--> Installing Debian via proot-distro..."
proot-distro install debian

# --- [4] Debian Configuration ---
echo -e "\n${C_BLUE}>>> [4/8] Configuring Debian environment...${C_RESET}"
run_in_debian() { proot-distro login debian --shared-tmp -- /bin/bash -c "$@"; }
run_as_user() { proot-distro login debian --user $NEW_USER --shared-tmp -- /bin/bash -c "$@"; }

echo "--> Updating Debian packages..."
run_in_debian "export DEBIAN_FRONTEND=noninteractive && apt-get update && apt-get upgrade -y"
run_in_debian "export DEBIAN_FRONTEND=noninteractive && apt-get install -y sudo nano adduser tzdata curl wget dbus-x11 apt-transport-https software-properties-common gpg jq mesa-utils vulkan-tools fonts-vazirmatn fonts-noto-arabic alsa-utils cabextract x11-xserver-utils zenity file xdg-utils"

echo "--> Setting timezone to Asia/Tehran..."
run_in_debian "ln -fs /usr/share/zoneinfo/Asia/Tehran /etc/localtime"
run_in_debian "dpkg-reconfigure --frontend noninteractive tzdata"

echo "--> Creating new user '$NEW_USER'..."
echo -e "${NEW_PASS}\n${NEW_PASS}\n${NEW_USER}\n\n\n\n\ny" | run_in_debian "adduser $NEW_USER"
run_in_debian "usermod $NEW_USER -g sudo"

echo "--> Installing Desktop Environment & Apps..."
CORE_APPS="pulseaudio pavucontrol libreoffice libreoffice-gtk3 libreoffice-gnome gimp vlc kdenlive"
if [ "$DE_CHOICE" == "1" ]; then
    CORE_APPS="$CORE_APPS xfce4 xfce4-goodies xfce4-whiskermenu-plugin numix-gtk-theme greybird-gtk-theme plank"
    START_CMD="xfce4-session"
elif [ "$DE_CHOICE" == "2" ]; then
    CORE_APPS="$CORE_APPS lxqt coreutils lxqt-core numix-gtk-theme"
    START_CMD="startlxqt"
elif [ "$DE_CHOICE" == "3" ]; then
    CORE_APPS="$CORE_APPS i3-wm i3status dmenu stterm"
    START_CMD="i3"
fi

if [ "$TOUCH_CHOICE" == "1" ]; then CORE_APPS="$CORE_APPS onboard"; fi
if [ "$BROW_CHOICE" == "1" ] || [ "$BROW_CHOICE" == "3" ]; then CORE_APPS="$CORE_APPS firefox-esr"; fi
if [ "$BROW_CHOICE" == "2" ] || [ "$BROW_CHOICE" == "3" ]; then CORE_APPS="$CORE_APPS chromium"; fi
if $WANT_VNC; then CORE_APPS="$CORE_APPS tigervnc-standalone-server"; fi

echo "${NEW_PASS}" | run_as_user "sudo -S DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends $CORE_APPS"

# --- [5] Touch Optimizations & Magic Desktop ---
echo -e "\n${C_BLUE}>>> [5/8] Configuring Touch UI & Android Integration...${C_RESET}"
run_as_user "mkdir -p ~/Desktop"

echo "--> Creating Android Magic Folders..."
run_as_user "ln -sf /sdcard/Download ~/Desktop/Android_Downloads || true"
run_as_user "ln -sf /sdcard/DCIM ~/Desktop/Android_Photos || true"
run_as_user "ln -sf /sdcard/Documents ~/Desktop/Android_Documents || true"
run_as_user "ln -sf /sdcard ~/Desktop/Android_Root || true"

if [ "$DE_CHOICE" == "1" ]; then
    run_as_user "mkdir -p ~/.config/autostart"
    cat << 'EOF' | run_as_user "cat > ~/.config/autostart/theme.desktop"
[Desktop Entry]
Type=Application
Name=Apply Theme
Exec=sh -c 'xfconf-query -c xsettings -p /Net/ThemeName -s "Numix" --create -t string; xfconf-query -c xfwm4 -p /general/theme -s "Numix" --create -t string'
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
EOF

    if [ "$TOUCH_CHOICE" == "1" ]; then
        echo "--> Applying Tablet UI Scaling (DPI 144) & Virtual Keyboard..."
        cat << 'EOF' | run_as_user "cat > ~/.config/autostart/touchui.desktop"
[Desktop Entry]
Type=Application
Name=Touch UI
Exec=sh -c 'xfconf-query -c xsettings -p /Xft/DPI -s 144 --create -t int; onboard &'
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
EOF
    fi
fi

if [ "$BROW_CHOICE" == "2" ] || [ "$BROW_CHOICE" == "3" ]; then
    echo "--> Configuring Hardware Accelerated Chromium..."
    cat << 'EOF' | run_in_debian "cat > /usr/local/bin/chromium-hw"
#!/bin/bash
exec /usr/bin/chromium --enable-features=Vulkan,VulkanFromANGLE,DefaultANGLEVulkan "$@"
EOF
    run_in_debian "chmod +x /usr/local/bin/chromium-hw"
    run_in_debian "sed -i 's|Exec=/usr/bin/chromium|Exec=/usr/local/bin/chromium-hw|g' /usr/share/applications/chromium.desktop || true"
fi

# --- [6] Add-ons (IDE, Box64, Dev Tools) ---
echo -e "\n${C_BLUE}>>> [6/8] Installing Masterclass Add-ons...${C_RESET}"

if [ "$DEV_CHOICE" == "1" ]; then
    echo "--> Installing Developer Toolkit..."
    run_in_debian "DEBIAN_FRONTEND=noninteractive apt-get install -y git build-essential python3 python3-pip python3-venv nodejs npm golang"
    run_as_user "curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y"
fi

if [ "$IDE_CHOICE" == "1" ]; then
    echo "--> Installing Reasonix Desktop..."
    run_in_debian "URL=\$(curl -s https://api.github.com/repos/esengine/DeepSeek-Reasonix/releases/latest | grep 'browser_download_url.*reasonix-linux-arm64.tar.gz' | cut -d '\"' -f 4) && wget -O /tmp/reasonix.tar.gz \$URL || true"
    run_in_debian "mkdir -p /opt/reasonix && tar -xzf /tmp/reasonix.tar.gz -C /opt/reasonix || true"
    run_in_debian "find /opt/reasonix -type f -executable -name 'reasonix*' -exec ln -sf {} /usr/local/bin/reasonix \;"
    run_in_debian "mkdir -p /usr/share/applications && cat << 'EOF' > /usr/share/applications/reasonix.desktop
[Desktop Entry]
Name=Reasonix Desktop
Exec=/usr/local/bin/reasonix
Type=Application
Categories=Development;
EOF"
elif [ "$IDE_CHOICE" == "2" ]; then
    echo "--> Installing Cursor IDE..."
    run_in_debian "curl -fsSL https://downloads.cursor.com/keys/anysphere.asc | gpg --dearmor | tee /etc/apt/keyrings/cursor.gpg > /dev/null"
    run_in_debian "echo \"deb [arch=amd64,arm64 signed-by=/etc/apt/keyrings/cursor.gpg] https://downloads.cursor.com/aptrepo stable main\" | tee /etc/apt/sources.list.d/cursor.list > /dev/null"
    run_in_debian "apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y cursor"
elif [ "$IDE_CHOICE" == "3" ]; then
    echo "--> Installing Visual Studio Code..."
    run_in_debian "curl -fSsL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | tee /usr/share/keyrings/vscode.gpg > /dev/null"
    run_in_debian "echo \"deb [arch=amd64,arm64,armhf signed-by=/usr/share/keyrings/vscode.gpg] https://packages.microsoft.com/repos/vscode stable main\" > /etc/apt/sources.list.d/vscode.list"
    run_in_debian "apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y code"
fi

if [ "$CLI_CHOICE" == "1" ] || [ "$CLI_CHOICE" == "3" ]; then
    echo "--> Installing Reasonix CLI..."
    run_in_debian "DEBIAN_FRONTEND=noninteractive apt-get install -y nodejs npm"
    run_in_debian "npm install -g reasonix"
fi
if [ "$CLI_CHOICE" == "2" ] || [ "$CLI_CHOICE" == "3" ]; then
    echo "--> Installing Aider CLI..."
    run_in_debian "DEBIAN_FRONTEND=noninteractive apt-get install -y python3 python3-pip python3-venv pipx"
    run_as_user "pipx install aider-chat"
fi

if [ "$GAMING_CHOICE" == "1" ]; then
    echo "--> Installing Pro-Gamer Windows Emulation (Box86/64, Wine, DXVK, VKD3D)..."
    run_in_debian "dpkg --add-architecture armhf"
    run_in_debian "wget https://ryanfortner.github.io/box64-debs/box64.list -O /etc/apt/sources.list.d/box64.list"
    run_in_debian "wget -qO- https://ryanfortner.github.io/box64-debs/KEY.gpg | gpg --dearmor -o /etc/apt/trusted.gpg.d/box64-debs-archive-keyring.gpg"
    run_in_debian "wget https://ryanfortner.github.io/box86-debs/box86.list -O /etc/apt/sources.list.d/box86.list"
    run_in_debian "wget -qO- https://ryanfortner.github.io/box86-debs/KEY.gpg | gpg --dearmor -o /etc/apt/trusted.gpg.d/box86-debs-archive-keyring.gpg"
    run_in_debian "apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y box64 box86 wine winetricks libc6:armhf p7zip-full fonts-wine"
    
    cat << 'EOF' | run_in_debian "cat > /usr/local/bin/install-windows-graphics"
#!/bin/bash
echo "Initializing wine prefix and installing .NET (Mono) and HTML (Gecko) engines..."
wineboot -u
sleep 5
echo "Installing DirectX translation layers (DXVK, VKD3D, D8VK)..."
winetricks -q dxvk vkd3d d8vk
echo "=========================================================="
echo "SUCCESS! Your Windows graphics layer is fully upgraded."
echo "=========================================================="
EOF
    run_in_debian "chmod +x /usr/local/bin/install-windows-graphics"

    echo "--> Configuring EXE Double-Click & Zenity GUI Launcher..."
    # 1. MIME Type for double-clicking EXE
    run_as_user "mkdir -p ~/.local/share/applications"
    cat << 'EOF' | run_as_user "cat > ~/.local/share/applications/wine.desktop"
[Desktop Entry]
Type=Application
Name=Wine Windows Program Loader
Exec=wine start /unix %f
MimeType=application/x-ms-dos-executable;application/x-msi;application/x-msdownload;
Icon=wine
NoDisplay=true
EOF
    run_as_user "xdg-mime default wine.desktop application/x-ms-dos-executable application/x-msi application/x-msdownload"

    # 2. Zenity Desktop Launcher Tool
    cat << 'EOF' | run_as_user "cat > ~/Desktop/Run_Windows_App.desktop"
[Desktop Entry]
Version=1.0
Type=Application
Name=🎮 Run Windows App
Comment=Select and run an .exe file visually
Exec=sh -c 'FILE=$(zenity --file-selection --title="Select a Windows Installer or App (.exe)" --file-filter="Executables (exe msi) | *.exe *.msi" --file-filter="All files | *"); if [ -n "$FILE" ]; then wine start /unix "$FILE"; fi'
Icon=wine
Terminal=false
Categories=Utility;
EOF
    run_as_user "chmod +x ~/Desktop/Run_Windows_App.desktop"
fi

echo "--> Configuring GPU Tests..."
cat << 'EOF' | run_in_debian "cat > /usr/local/bin/gpu-test"
#!/bin/bash
echo -e "\033[1;36m=== Vulkan Information ===\033[0m"
vulkaninfo | grep -i "device name" || echo "Vulkan not available."
echo -e "\n\033[1;36m=== OpenGL Information ===\033[0m"
glxinfo | grep -i "opengl renderer" || echo "OpenGL not available."
echo -e "\033[1;32mGPU Test Complete!\033[0m"
EOF
run_in_debian "chmod +x /usr/local/bin/gpu-test"


# --- [7] Configuration and Aliases ---
echo -e "\n${C_BLUE}>>> [7/8] Configuring Aliases and Power Profiles...${C_RESET}"
USER_BASHRC="/home/$NEW_USER/.bashrc"
TERMUX_BASHRC="$HOME/.bashrc"

run_as_user "echo '' >> $USER_BASHRC"
run_as_user "echo 'export PULSE_SERVER=127.0.0.1' >> $USER_BASHRC"
run_as_user "echo 'export PATH=\"\$PATH:\$HOME/.local/bin\"' >> $USER_BASHRC"

echo "" >> $TERMUX_BASHRC
echo "# --- Debian & Audio Aliases ---" >> $TERMUX_BASHRC
echo "export PROOT_NO_SECCOMP=1" >> $TERMUX_BASHRC
echo "alias debian='proot-distro login debian --user $NEW_USER --shared-tmp --bind /sdcard:/sdcard'" >> $TERMUX_BASHRC
echo "alias debian-root='proot-distro login debian --shared-tmp --bind /sdcard:/sdcard'" >> $TERMUX_BASHRC
echo "alias start-audio='pulseaudio --start --exit-idle-time=-1 && pactl load-module module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1'" >> $TERMUX_BASHRC
echo "alias backup-debian='tar -czvf /sdcard/Download/debian-backup.tar.gz -C \$PREFIX/var/lib/proot-distro/installed-rootfs debian'" >> $TERMUX_BASHRC
echo "alias restore-debian='rm -rf \$PREFIX/var/lib/proot-distro/installed-rootfs/debian/* && tar -xzvf /sdcard/Download/debian-backup.tar.gz -C \$PREFIX/var/lib/proot-distro/installed-rootfs'" >> $TERMUX_BASHRC

if $WANT_VNC; then
    run_as_user "mkdir -p ~/.vnc"
    cat << EOF | run_as_user "cat > ~/.vnc/xstartup"
#!/bin/bash
unset SESSION_MANAGER
unset DBUS_SESSION_BUS_ADDRESS
export PULSE_SERVER=127.0.0.1
exec dbus-launch $START_CMD
EOF
    run_as_user "chmod +x ~/.vnc/xstartup"

    VNC_SCRIPT_PATH="/home/$NEW_USER/start_vnc.sh"
    cat << EOF | run_as_user "cat > $VNC_SCRIPT_PATH"
#!/bin/bash
vncserver -kill :1 >/dev/null 2>&1 || true
rm -rf /tmp/.X1-lock /tmp/.X11-unix/X1
vncserver :1 -geometry 1920x1080 -depth 24
EOF
    run_as_user "chmod +x $VNC_SCRIPT_PATH"
    
    run_as_user "echo \"alias startvnc='~/start_vnc.sh'\" >> $USER_BASHRC"
    run_as_user "echo \"alias stopvnc='vncserver -kill :1'\" >> $USER_BASHRC"
fi

if $WANT_X11; then
    # Generate os-power script
    cat << EOF > $HOME/os-power
#!/bin/bash
echo -e "\n\033[1;33m>>> Select Power Profile\033[0m"
echo "1) 🟢 Power Saver (No GPU Accel, No Animations, Low CPU)"
echo "2) 🟡 Balanced (Standard GPU Accel)"
echo "3) 🔴 Performance (GPU Overclock, Max CPU Dynarec)"
read -p "Choose [2]: " pmode
pmode=\${pmode:-2}

export DISPLAY=:0
export PULSE_SERVER=127.0.0.1
export PROOT_NO_SECCOMP=1
unset TU_DEBUG
unset BOX64_DYNAREC_BIGBLOCK
unset BOX64_DYNAREC_STRONGMEM
DISABLE_COMPOSITOR=0

if [ "\$pmode" == "1" ]; then
    echo "Starting in Power Saver Mode..."
    export GALLIUM_DRIVER=llvmpipe
    DISABLE_COMPOSITOR=1
elif [ "\$pmode" == "2" ]; then
    echo "Starting in Balanced Mode..."
EOF
    if [ "$HW_CHOICE" == "1" ]; then
        echo "    export MESA_LOADER_DRIVER_OVERRIDE=zink" >> $HOME/os-power
        echo "    export VK_ICD_FILENAMES=\$PREFIX/share/vulkan/icd.d/freedreno_icd.aarch64.json" >> $HOME/os-power
        echo "    export GALLIUM_DRIVER=zink" >> $HOME/os-power
    elif [ "$HW_CHOICE" == "2" ]; then
        echo "    export GALLIUM_DRIVER=virpipe" >> $HOME/os-power
        echo "    virgl_test_server_android &" >> $HOME/os-power
    fi
    cat << EOF >> $HOME/os-power
elif [ "\$pmode" == "3" ]; then
    echo "Starting in Performance Mode..."
EOF
    if [ "$HW_CHOICE" == "1" ]; then
        echo "    export MESA_LOADER_DRIVER_OVERRIDE=zink" >> $HOME/os-power
        echo "    export VK_ICD_FILENAMES=\$PREFIX/share/vulkan/icd.d/freedreno_icd.aarch64.json" >> $HOME/os-power
        echo "    export GALLIUM_DRIVER=zink" >> $HOME/os-power
        echo "    export TU_DEBUG=noconform" >> $HOME/os-power
    elif [ "$HW_CHOICE" == "2" ]; then
        echo "    export GALLIUM_DRIVER=virpipe" >> $HOME/os-power
        echo "    virgl_test_server_android &" >> $HOME/os-power
    fi
    cat << EOF >> $HOME/os-power
    export BOX64_DYNAREC_BIGBLOCK=1
    export BOX64_DYNAREC_STRONGMEM=1
fi

termux-x11 :0 & sleep 3
proot-distro login debian --user $NEW_USER --shared-tmp --bind /sdcard:/sdcard -- /bin/bash -c "
    export DISPLAY=:0; export PULSE_SERVER=127.0.0.1;
    if [ \\\"\$DISABLE_COMPOSITOR\\\" == \\\"1\\\" ]; then
        xfconf-query -c xfwm4 -p /general/use_compositing -s false || true
    else
        xfconf-query -c xfwm4 -p /general/use_compositing -s true || true
    fi
    dbus-launch --exit-with-session $START_CMD
"
EOF
    chmod +x $HOME/os-power
    echo "alias start-x11='~/os-power'" >> $TERMUX_BASHRC
fi

# --- [8] Final Output ---
echo ""
echo -e "${C_GREEN}=================================================${C_RESET}"
echo -e "${C_GREEN}          SETUP COMPLETE!                        ${C_RESET}"
echo -e "${C_GREEN}=================================================${C_RESET}"
echo -e "${C_YELLOW}IMPORTANT: Restart Termux or run 'source ~/.bashrc' for aliases to load!${C_RESET}"
echo ""
echo -e "1. Run '${C_CYAN}start-audio${C_RESET}' in Termux first if you want sound."
echo -e "2. Run '${C_CYAN}start-x11${C_RESET}' to pick your Battery Profile and launch the desktop."
echo ""
echo -e "${C_CYAN}--- V8 Tips (GUI Edition) ---${C_RESET}"
echo -e "- Just DOUBLE-CLICK any .exe file to run it!"
echo -e "- Use the '🎮 Run Windows App' tool on your desktop for a visual file picker."
echo ""
echo -e "${C_GREEN}=================================================${C_RESET}"
echo -e "${C_CYAN}           Created by Antigravity                ${C_RESET}"
echo -e "${C_GREEN}=================================================${C_RESET}"
