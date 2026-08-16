<!DOCTYPE html>
<html lang="fa" dir="rtl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>

<div align="right">
    <a href="README.md">English</a>
</div>

<div align="center">
    <img src="https://github.com/erfan2255/debian-on-android/blob/main/Images/Openlogo-debianV2.svg" alt="Debian Logo" width="100"/>
    <h1>سیستم عامل نهایی - دبیان 13 روی اندروید - آپدیت فوق‌حرفه‌ای V13</h1>
    <h3>دستگاه اندرویدی خود را به یک کامپیوتر لینوکس قابل حمل و یک کنسول قدرتمند برای بازی‌های ویندوز تبدیل کنید</h3>
    <p>یک دستور ساده و تک‌خطی برای نصب یک محیط دبیان عمیقاً بهینه‌شده با شتاب‌دهنده سخت‌افزاری، همراه با ابزارهای برنامه‌نویسی هوش مصنوعی و شبیه‌ساز کامل ویندوز روی هر دستگاه اندرویدی با استفاده از Termux.</p>
    <p>
        <img src="https://img.shields.io/github/license/erfan2255/Debian-On-Android?style=square" alt="License">
        <img src="https://img.shields.io/github/last-commit/erfan2255/Debian-On-Android?style=square" alt="Last Commit">
        <a href="https://opensource.org"><img src="https://badges.frapsoft.com/os/v1/open-source.svg?v=103" alt="Open Source"></a>
    </p>
</div>

<hr>

<h3>► هدف</h3>
<p>هدف این پروژه ارائه روشی یکپارچه و کاملاً خودکار به کاربران برای داشتن یک سیستم عامل قدرتمند و پر از امکانات روی دستگاه اندرویدی است، بدون نیاز به دسترسی روت. این پروژه اکنون به یک "جایگزین دسکتاپ" تبدیل شده است که برای توسعه‌دهندگان، گیمرهای حرفه‌ای و علاقه‌مندان به هوش مصنوعی طراحی شده است تا بتوانند از حداکثر توان پردازنده‌های اسنپدراگون خود استفاده کنند.</p>

<hr>

<h3>► امکانات فوق‌حرفه‌ای (آپدیت‌های V13)</h3>
<ul>
    <li><strong>🚀 نصب گرافیکی VIP:</strong> یک نصب‌کننده TUI تمام‌صفحه و زیبا (Dialog). به جای تایپ کردن در ترمینال، از کلیدهای جهت‌نما برای انتخاب امکانات سیستم عامل خود به صورت بصری استفاده کنید.</li>
    <li><strong>🤖 پلتفرم گوگل آنتی‌گرویتی ۲.۰ و مرکز هوش مصنوعی:</strong> ادغام مستقیم نسخه بومی ARM64 نرم‌افزار Google Antigravity 2.0 و ترمینال هوشمند Antigravity CLI (`agy`) در کنار Cursor IDE، VS Code و Aider.</li>
    <li><strong>🎮 شبیه‌سازی ویندوز برای گیمرهای حرفه‌ای:</strong> یکپارچه‌سازی داخلی Box86/Box64 و Wine. نصب خودکار DXVK، VKD3D (DirectX 12) و D8VK برای اجرای بی‌نقص بازی‌های AAA.</li>
    <li><strong>⚙️ کتابخانه‌های سراسری ویندوز:</strong> یک ابزار گرافیکی با ۱ کلیک برای تزریق دائمی Visual C++ Redistributables (2010-2015) و کامپایلرهای DX برای جلوگیری از خطاهای DLL در WineHQ.</li>
    <li><strong>📚 سازگاری با مایکروسافت آفیس:</strong> یک ابزار گرافیکی داخلی برای آماده‌سازی محیط شما جهت اجرای MS Office (Word, Excel, PowerPoint) و نرم‌افزار SPSS از طریق `winetricks`.</li>
    <li><strong>🖱️ اجرای برنامه‌های ویندوز بدون ترمینال:</strong> روی فایل‌های `.exe` مستقیماً در فایل منیجر لینوکس خود دوبار کلیک کنید تا اجرا شوند، یا از ابزار گرافیکی "Run Windows App" استفاده کنید!</li>
    <li><strong>🛒 مرکز نرم‌افزار دبیان:</strong> برنامه‌های سنگین لینوکس (تلگرام، دیسکورد، GIMP، OBS Studio، بلندر، VS Code) را با استفاده از یک رابط تیک‌زدنی گرافیکی نصب کنید. بدون نیاز به ترمینال!</li>
    <li><strong>🔋 سیستم مدیریت مصرف انرژی:</strong> جابجایی روان بین حالت‌های 🟢 ذخیره انرژی (رندر نرم‌افزاری)، 🟡 متعادل، و 🔴 عملکرد بالا (اورکلاک پردازنده گرافیکی Turnip) برای حفظ باتری.</li>
    <li><strong>📱 دسکتاپ جادویی:</strong> همگام‌سازی خودکار پوشه‌های اندروید شما (Downloads, DCIM, Documents) با دسکتاپ لینوکس.</li>
    <li><strong>👆 بهینه‌سازی‌های لمسی برای تبلت:</strong> حالت اختصاصی تبلت که مقیاس‌پذیری UI بالا (High DPI) و کیبورد مجازی Onboard را برای کنترل‌های لمسی بی‌نقص روی دستگاه‌هایی مانند Poco F3 یا Pad 7 فعال می‌کند.</li>
    <li><strong>🌐 وب با شتاب‌دهنده سخت‌افزاری:</strong> بین Firefox ESR و یک مرورگر Chromium که به طور ویژه با فلگ‌های Vulkan برای پخش ویدیوی 1080p/4K با نرخ 60fps تنظیم شده است، انتخاب کنید.</li>
</ul>

<hr>

<h3>► پیش‌نیازها</h3>
<ul>
    <li>یک دستگاه اندرویدی (تلفن همراه یا تبلت) - پردازنده‌های اسنپدراگون برای شتاب‌دهنده سه‌بعدی Turnip توصیه می‌شوند.</li>
    <li>برنامه <a href="https://f-droid.org/en/packages/com.termux/">Termux</a> (نصب شده از طریق F-Droid).</li>
    <li>برنامه <a href="https://github.com/termux/termux-x11">Termux-X11</a> یا یک برنامه VNC Viewer.</li>
    <li>حدود ۵ تا ۸ گیگابایت فضای ذخیره‌سازی آزاد.</li>
</ul>

<hr>

<h3>► نصب و استفاده</h3>

<h4>۱. اجرای نصب‌کننده</h4>
<p>دستور تک‌خطی زیر را در ترمینال Termux خود جای‌گذاری کرده و دکمه Enter را بزنید.</p>
<pre><code>bash -c "$(curl -fsSL https://raw.githubusercontent.com/erfan2255/debian-on-android/main/setup.sh)"</code></pre>

<h4>۲. سیستم عامل نهایی خود را بسازید</h4>
<p>این اسکریپت جادوگر تعاملی و VIP نسخه V13 را اجرا می‌کند. شما می‌توانید سرور نمایش خود (X11/VNC)، درایورهای گرافیک (Turnip/VirGL)، محیط دسکتاپ (XFCE/LXQt/i3)، مرورگر، ابزارهای هوش مصنوعی (Google Antigravity, Cursor, VS Code, Reasonix) و تنظیمات بازی ویندوز را انتخاب کنید.</p>

<h4>۳. ورود و انتخاب پروفایل انرژی</h4>
<p>پس از اتمام نصب، یک دستور میانبر به نام <code>start-x11</code> در ترمینال Termux ایجاد می‌شود. برای اجرای دسکتاپ خود فقط کافیست تایپ کنید:</p>
<pre><code>start-x11</code></pre>
<blockquote>شما بلافاصله با منوی <strong>OS-Power</strong> روبرو می‌شوید. بر اساس نیاز باتری خود گزینه 1 (Power Saver)، 2 (Balanced) یا 3 (Performance) را انتخاب کنید و دسکتاپ شما بالا می‌آید!</blockquote>

<h4>۴. نکات حرفه‌ای و پیشرفته</h4>
<ul>
    <li><strong>صدا:</strong> اگر صدا می‌خواهید، قبل از راه‌اندازی دسکتاپ، دستور <code>start-audio</code> را در Termux وارد کنید.</li>
    <li><strong>بکاپ‌گیری:</strong> برای ایجاد یک اسنپ‌شات کامل از سیستم در پوشه Downloads اندروید، دستور <code>backup-debian</code> را در Termux تایپ کنید. برای بازیابی آن از دستور <code>restore-debian</code> استفاده کنید.</li>
    <li><strong>تست گرافیک:</strong> دستور <code>gpu-test</code> را در داخل دبیان تایپ کنید تا از کارکرد صحیح شتاب‌دهنده‌های Vulkan/OpenGL خود مطمئن شوید.</li>
    <li><strong>نصب مستقل برنامه‌های هوش مصنوعی:</strong> نصب مستقیم Google Antigravity 2.0 و Reasonix Desktop در هر لینوکس/دبیان دیگر با یک دستور:
        <pre><code>bash -c "$(curl -fsSL https://raw.githubusercontent.com/erfan2255/debian-on-android/main/install-ai-ides.sh)"</code></pre>
    </li>
</ul>

<hr>

<h3>► چه چیزهایی در این بسته وجود دارد؟</h3>
<table width="100%" style="border-collapse: collapse; text-align: right;" dir="rtl">
    <thead>
        <tr style="border-bottom: 1px solid #ddd;">
            <th style="padding: 8px;">مؤلفه</th>
            <th style="padding: 8px;">توضیحات</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td style="padding: 8px;"><strong>سیستم عامل</strong></td>
            <td style="padding: 8px;">Debian 13 (Trixie)</td>
        </tr>
        <tr>
            <td style="padding: 8px;"><strong>درایورهای گرافیک</strong></td>
            <td style="padding: 8px;">Mesa-Zink, Turnip, VirGL</td>
        </tr>
        <tr>
            <td style="padding: 8px;"><strong>ترجمه ویندوز</strong></td>
            <td style="padding: 8px;">Box64, Box86, Wine, DXVK, VKD3D, D8VK</td>
        </tr>
        <tr>
            <td style="padding: 8px;"><strong>محیط دسکتاپ</strong></td>
            <td style="padding: 8px;">XFCE 4 / LXQt / i3wm</td>
        </tr>
        <tr>
            <td style="padding: 8px;"><strong>بهره‌وری و هوش مصنوعی</strong></td>
            <td style="padding: 8px;">Google Antigravity 2.0 / CLI (`agy`), Cursor, VS Code, Reasonix, Aider, LibreOffice</td>
        </tr>
    </tbody>
</table>

<hr>

<h3>► تصاویر</h3>
<p>در اینجا پیش‌نمایشی از محیط دسکتاپ Debian 13 XFCE که قرار است نصب کنید آورده شده است.</p>

<div style="display: flex; justify-content: center; align-items: center; flex-wrap: wrap; gap: 2rem; margin-top: 1rem;">
    <div style="text-align: center;">
        <img src="https://github.com/erfan2255/debian-on-android/blob/main/Images/IMG_20250823_181327.png" alt="Debian info" style="width: 400px; max-width: 90%; border-radius: 15px; box-shadow: 0 10px 20px rgba(0,0,0,0.1);"/>
        <p><strong>اطلاعات دبیان</strong></p>
    </div>
    <div style="text-align: center;">
        <img src="https://github.com/erfan2255/debian-on-android/blob/main/Images/IMG_20250823_181349.png" alt="Libre Office" style="width: 400px; max-width: 90%; border-radius: 15px; box-shadow: 0 10px 20px rgba(0,0,0,0.1);"/>
        <p><strong>لیبره آفیس (Libre Office)</strong></p>
    </div>
</div>

<hr>

<h3>► حمایت از پروژه</h3>
<p>اگر این پروژه برای شما مفید بود، لطفاً با دادن یک ⭐ (ستاره) از آن حمایت کنید!</p>

<h3>► مجوز (License)</h3>
<p>این پروژه تحت مجوز MIT منتشر شده است. برای جزئیات بیشتر فایل <a href="https://github.com/erfan2255/Debian-On-Android/blob/main/LICENSE">LICENSE</a> را ببینید.</p>

<hr>
<div align="center">
    <p><strong>توسط CoreLand</strong></p>
</div>

</body>
</html>
