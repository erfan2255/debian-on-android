<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>

<div align="center">
    <img src="https://raw.githubusercontent.com/debian-infra/artwork/main/logo/debian-logo-256.png" alt="Debian Logo" width="150"/>
    <h1>Debian-On-Android</h1>
    <p><strong>by CoreLand</strong></p>
    <h3>Turn your Android device into a portable Linux PC.</h3>
    <p>A simple, one-line command to install a full Debian (XFCE) desktop environment on any Android device using Termux.</p>
    <p>
        <img src="https://img.shields.io/github/license/YourUsername/Debian-On-Android?style=flat-square" alt="License">
        <img src="https://img.shields.io/github/last-commit/YourUsername/Debian-On-Android?style=flat-square" alt="Last Commit">
        <img src="https://img.shields.io/github/downloads/YourUsername/Debian-On-Android/total?style=flat-square" alt="Downloads">
        <a href="https://opensource.org"><img src="https://badges.frapsoft.com/os/v1/open-source.svg?v=103" alt="Open Source"></a>
        <a href="https://hits.seeyoufarm.com"><img src="https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2FYourUsername%2FDebian-On-Android&count_bg=%2379C83D&title_bg=%23555555&icon=&icon_color=%23E7E7E7&title=visitors&edge_flat=false"/></a>
    </p>
</div>

<hr>

<h3>► Purpose</h3>
<p>The goal of this project is to provide a seamless and fully automated way for users to get a powerful, feature-rich Debian desktop experience on their Android device without needing root access. It's designed for developers, students, and Linux enthusiasts who want a portable and persistent computing environment.</p>

<hr>

<h3>► Features</h3>
<ul>
    <li><strong>🚀 Fully Automated:</strong> The script handles everything from initial setup to user creation and software installation.</li>
    <li><strong>🖥️ Full Desktop Environment:</strong> Installs the lightweight and user-friendly XFCE desktop.</li>
    <li><strong>📚 Essential Software:</strong> Comes pre-loaded with Firefox ESR for web browsing and the complete LibreOffice suite for productivity.</li>
    <li><strong>✨ User-Friendly:</strong> Interactive prompts for username, password, and VNC screen resolution.</li>
    <li><strong>⚡ Convenient Aliases:</strong> Includes simple shortcuts (<code>startvnc</code>, <code>stopvnc</code>, <code>exit</code>) for easy management.</li>
    <li><strong>🌍 Timezone Pre-configured:</strong> Sets the system timezone to Asia/Tehran by default.</li>
</ul>

<hr>

<h3>► Requirements</h3>
<ul>
    <li>An Android device (phone or tablet).</li>
    <li>The <a href="https://f-droid.org/en/packages/com.termux/">Termux</a> app installed.</li>
    <li>A VNC Viewer app (e.g., <a href="https://play.google.com/store/apps/details?id=com.realvnc.viewer.android">RealVNC</a>, <a href="https://play.google.com/store/apps/details?id=com.gaurav.avnc">AVNC</a>) installed on your Android device.</li>
    <li>Approximately 4-5 GB of free storage space.</li>
</ul>

<hr>

<h3>► Installation & Usage</h3>

<h4>1. Run the Installer</h4>
<p>Paste the one-line command below into your Termux terminal and press Enter.</p>
<pre><code>bash -c "$(curl -fsSL https://raw.githubusercontent.com/erfan2255/debian-on-android/main/setup.sh)"</code></pre>

<h4>2. Follow the Prompts</h4>
<p>The script will guide you through creating a username and password for your new Debian system.</p>

<h4>3. Log In</h4>
<p>After the installation is complete, a <code>debian</code> alias will be created in Termux. To log in, simply type:</p>
<pre><code>debian</code></pre>

<h4>4. Start the VNC Server</h4>
<p>Once you are logged into your Debian environment, start the graphical desktop by typing:</p>
<pre><code>startvnc</code></pre>
<blockquote>The first time you run this, you will be asked to select a screen resolution and set a VNC-specific password.</blockquote>

<h4>5. Connect with a VNC Client</h4>
<p>Open your VNC Viewer app and create a new connection to the following address:</p>
<pre><code>localhost:1</code></pre>
<p>Enter the VNC password you created in the previous step. You will now see your Debian desktop!</p>

<h4>6. Stop the VNC Server</h4>
<p>When you are finished with your session, you can stop the VNC server from inside Debian by typing:</p>
<pre><code>stopvnc</code></pre>

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
            <td style="padding: 8px;"><strong>Desktop Environment</strong></td>
            <td style="padding: 8px;">XFCE 4</td>
        </tr>
        <tr>
            <td style="padding: 8px;"><strong>Web Browser</strong></td>
            <td style="padding: 8px;">Firefox ESR</td>
        </tr>
        <tr>
            <td style="padding: 8px;"><strong>Office Suite</strong></td>
            <td style="padding: 8px;">LibreOffice (Writer, Calc, Impress, etc.)</td>
        </tr>
        <tr>
            <td style="padding: 8px;"><strong>VNC Server</strong></td>
            <td style="padding: 8px;">TigerVNC</td>
        </tr>
        <tr>
            <td style="padding: 8px;"><strong>System Utilities</strong></td>
            <td style="padding: 8px;"><code>sudo</code>, <code>nano</code>, <code>adduser</code>, and more.</td>
        </tr>
    </tbody>
</table>

<hr>

<h3>► Screenshots</h3>
<p>Here is a preview of the Debian 13 XFCE desktop environment you will be installing.</p>
<p><em>(Note: You will need to take your own screenshots, upload them to a <code>screenshots</code> folder in your repository, and update the links below.)</em></p>

<div style="display: flex; justify-content: center; align-items: center; flex-wrap: wrap; gap: 2rem; margin-top: 1rem;">
    <div style="text-align: center;">
        <img src="https://raw.githubusercontent.com/YourUsername/Debian-On-Android/main/screenshots/screenshot1.png" alt="Debian Login" style="width: 400px; max-width: 90%; border-radius: 15px; box-shadow: 0 10px 20px rgba(0,0,0,0.1);"/>
        <p><strong>Login Screen</strong></p>
    </div>
    <div style="text-align: center;">
        <img src="https://raw.githubusercontent.com/YourUsername/Debian-On-Android/main/screenshots/screenshot2.png" alt="Debian Desktop" style="width: 400px; max-width: 90%; border-radius: 15px; box-shadow: 0 10px 20px rgba(0,0,0,0.1);"/>
        <p><strong>Desktop View</strong></p>
    </div>
</div>

<hr>

<h3>► Show Your Support</h3>
<p>If you find this project useful, please give it a ⭐ to show your support!</p>

<h3>► License</h3>
<p>This project is licensed under the MIT License. See the <a href="https://github.com/YourUsername/Debian-On-Android/blob/main/LICENSE">LICENSE</a> file for details.</p>

</body>
</html>


