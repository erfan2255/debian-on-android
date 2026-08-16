<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>

<div align="left">
    <a href="README-FA.md">Persian</a>
</div>

<div align="center">
    <img src="https://github.com/erfan2255/debian-on-android/blob/main/Images/Openlogo-debianV2.svg" alt="Debian Logo" width="100"/>
    <h1>Ultimate OS - Debian 13 on Android - V13 Masterclass</h1>
    <h3>Turn your Android device into a portable Linux PC & Windows Gaming Powerhouse</h3>
    <p>A simple, one-line command to install a deeply optimized, hardware-accelerated Debian environment with AI coding agents and full Windows emulation on any Android device using Termux.</p>
    <p>
        <img src="https://img.shields.io/github/license/erfan2255/Debian-On-Android?style=square" alt="License">
        <img src="https://img.shields.io/github/last-commit/erfan2255/Debian-On-Android?style=square" alt="Last Commit">
        <a href="https://opensource.org"><img src="https://badges.frapsoft.com/os/v1/open-source.svg?v=103" alt="Open Source"></a>
    </p>
</div>

<hr>

<h3>► Purpose</h3>
<p>The goal of this project is to provide a seamless and fully automated way for users to get a powerful, feature-rich OS experience on their Android device without needing root access. It has evolved into a "Desktop Replacement" designed for developers, pro-gamers, and AI enthusiasts who want to unlock the absolute limit of their Snapdragon processors.</p>

<hr>

<h3>► Masterclass Features (V13 Updates)</h3>
<ul>
    <li><strong>🚀 VIP Graphical Setup:</strong> Beautiful, full-screen curses-based TUI installer (Dialog). Use your arrow keys to select your OS features visually instead of typing in a standard terminal.</li>
    <li><strong>🤖 Google Antigravity 2.0 & AI Hub:</strong> Native ARM64 integration of Google Antigravity 2.0 and Antigravity CLI (`agy`), alongside Cursor IDE, VS Code, and Aider.</li>
    <li><strong>🎮 Pro-Gamer Windows Emulation:</strong> Built-in Box86/Box64 and Wine integration. Automatically installs DXVK, VKD3D (DirectX 12), and D8VK for flawless AAA gaming.</li>
    <li><strong>⚙️ Universal Windows Libraries:</strong> 1-click GUI tool to permanently inject Visual C++ Redistributables (2010-2015) and DX compilers to stop DLL errors on WineHQ.</li>
    <li><strong>📚 MS Office Compatibility:</strong> Native 1-click GUI tool to prepare your environment for MS Office (Word, Excel, PowerPoint) and SPSS via `winetricks`.</li>
    <li><strong>🖱️ Terminal-Free Windows Apps:</strong> Double-click `.exe` files directly in your Linux file manager to run them, or use the visual "Run Windows App" GUI tool!</li>
    <li><strong>🛒 Debian Software Center:</strong> Install massive Linux apps (Telegram, Discord, GIMP, OBS Studio, Blender, VS Code) using a visual checkbox GUI. Zero terminal required!</li>
    <li><strong>🔋 OS-Power Management System:</strong> Switch seamlessly between 🟢 Power Saver (Software rendering), 🟡 Balanced, and 🔴 Performance (Turnip GPU Overclocking) modes to save battery.</li>
    <li><strong>📱 The Magic Desktop:</strong> Automatically synchronizes your Android `Downloads`, `DCIM`, and `Documents` folders to your Linux desktop.</li>
    <li><strong>👆 Tablet Touch Optimizations:</strong> Dedicated Tablet Mode that enables High DPI UI scaling and the Onboard virtual keyboard for flawless touch controls on devices like the Poco F3 or Pad 7.</li>
    <li><strong>🌐 Hardware Accelerated Web:</strong> Choose between Firefox ESR or a specially configured Chromium browser with Vulkan flags for 1080p/4K 60fps video playback.</li>
</ul>

<hr>

<h3>► Requirements</h3>
<ul>
    <li>An Android device (phone or tablet) - Snapdragon processors recommended for Turnip 3D acceleration.</li>
    <li>The <a href="https://f-droid.org/en/packages/com.termux/">Termux</a> app installed via F-Droid.</li>
    <li>The <a href="https://github.com/termux/termux-x11">Termux-X11</a> app or a VNC Viewer installed.</li>
    <li>Approximately 5-8 GB of free storage space.</li>
</ul>

<hr>

<h3>► Installation & Usage</h3>

<h4>1. Run the Installer</h4>
<p>Paste the one-line command below into your Termux terminal and press Enter.</p>
<pre><code>bash -c "$(curl -fsSL https://raw.githubusercontent.com/erfan2255/debian-on-android/main/setup.sh)"</code></pre>

<h4>2. Build Your Ultimate OS</h4>
<p>The script will launch the V13 VIP interactive wizard. You can choose your Display Server (X11/VNC), GPU Drivers (Turnip/VirGL), Desktop Environment (XFCE/LXQt/i3), Browser, AI tools (Google Antigravity, Cursor, VS Code, Reasonix), and Windows Gaming options.</p>

<h4>3. Log In and Pick a Power Profile</h4>
<p>After the installation is complete, a <code>start-x11</code> alias will be created in Termux. To launch your desktop, simply type:</p>
<pre><code>start-x11</code></pre>
<blockquote>You will instantly be greeted by the <strong>OS-Power</strong> menu. Select 1 (Power Saver), 2 (Balanced), or 3 (Performance) depending on your battery needs, and your desktop will launch!</blockquote>

<h4>4. Advanced Pro-Tips</h4>
<ul>
    <li><strong>Audio:</strong> If you want sound, type <code>start-audio</code> in Termux before launching your desktop.</li>
    <li><strong>Backups:</strong> Type <code>backup-debian</code> in Termux to create a full system snapshot in your Android Downloads folder. Type <code>restore-debian</code> to recover it.</li>
    <li><strong>Graphics Test:</strong> Type <code>gpu-test</code> inside Debian to verify your Vulkan/OpenGL acceleration is working.</li>
    <li><strong>Standalone AI IDEs:</strong> Install Google Antigravity 2.0 & Reasonix Desktop on any Debian/Ubuntu system:
        <pre><code>bash -c "$(curl -fsSL https://raw.githubusercontent.com/erfan2255/debian-on-android/main/install-ai-ides.sh)"</code></pre>
    </li>
</ul>

<hr>

<h3>► What's Included?</h3>
<table width="100%" style="border-collapse: collapse;">
    <thead>
        <tr style="border-bottom: 1px solid #ddd;">
            <th style="padding: 8px; text-align: left;">Component</th>
            <th style="padding: 8px; text-align: left;">Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td style="padding: 8px;"><strong>Operating System</strong></td>
            <td style="padding: 8px;">Debian 13 (Trixie)</td>
        </tr>
        <tr>
            <td style="padding: 8px;"><strong>Graphics Drivers</strong></td>
            <td style="padding: 8px;">Mesa-Zink, Turnip, VirGL</td>
        </tr>
        <tr>
            <td style="padding: 8px;"><strong>Windows Translation</strong></td>
            <td style="padding: 8px;">Box64, Box86, Wine, DXVK, VKD3D, D8VK</td>
        </tr>
        <tr>
            <td style="padding: 8px;"><strong>Desktop Environment</strong></td>
            <td style="padding: 8px;">XFCE 4 / LXQt / i3wm</td>
        </tr>
        <tr>
            <td style="padding: 8px;"><strong>Productivity & AI</strong></td>
            <td style="padding: 8px;">Google Antigravity 2.0 / CLI (`agy`), Cursor, VS Code, Reasonix, Aider, LibreOffice</td>
        </tr>
    </tbody>
</table>

<hr>

<h3>► Screenshots</h3>
<p>Here is a preview of the Debian 13 XFCE desktop environment you will be installing.</p>

<div style="display: flex; justify-content: center; align-items: center; flex-wrap: wrap; gap: 2rem; margin-top: 1rem;">
    <div style="text-align: center;">
        <img src="https://github.com/erfan2255/debian-on-android/blob/main/Images/IMG_20250823_181327.png" alt="Debian info" style="width: 400px; max-width: 90%; border-radius: 15px; box-shadow: 0 10px 20px rgba(0,0,0,0.1);"/>
        <p><strong>Debian info</strong></p>
    </div>
    <div style="text-align: center;">
        <img src="https://github.com/erfan2255/debian-on-android/blob/main/Images/IMG_20250823_181349.png" alt="Libre Office" style="width: 400px; max-width: 90%; border-radius: 15px; box-shadow: 0 10px 20px rgba(0,0,0,0.1);"/>
        <p><strong>Libre Office</strong></p>
    </div>
</div>

<hr>

<h3>► Show Your Support</h3>
<p>If you find this project useful, please give it a ⭐ to show your support!</p>

<h3>► License</h3>
<p>This project is licensed under the MIT License. See the <a href="https://github.com/erfan2255/Debian-On-Android/blob/main/LICENSE">LICENSE</a> file for details.</p>

<hr>
<div align="center">
    <p><strong>by Erfan2255 & CoreLand</strong></p>
</div>

</body>
</html>
