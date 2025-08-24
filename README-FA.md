<!DOCTYPE html>
<html lang="fa" dir="rtl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>

<div align="left">
    <a href="README.md">English</a>
</div>

<div align="center">
    <img src="https://github.com/erfan2255/debian-on-android/blob/main/Images/Openlogo-debianV2.svg" alt="Debian Logo" width="100"/>
    <h1>دبیان ۱۳ روی اندروید</h1>
    <h3>دستگاه اندرویدی خود را به یک کامپیوتر لینوکس قابل حمل تبدیل کنید</h3>
    <p>یک دستور ساده و تک‌خطی برای نصب محیط دسکتاپ کامل دبیان (XFCE) روی هر دستگاه اندرویدی با استفاده از ترموکس</p>
    <p>
        <img src="https://img.shields.io/github/license/erfan2255/Debian-On-Android?style=square" alt="License">
        <img src="https://img.shields.io/github/last-commit/erfan2255/Debian-On-Android?style=square" alt="Last Commit">
        <img src="https://img.shields.io/github/downloads/erfan2255/Debian-On-Android/total?style=square" alt="Downloads">
        <a href="https://opensource.org"><img src="https://badges.frapsoft.com/os/v1/open-source.svg?v=103" alt="Open Source"></a>
    </p>
</div>

<hr>

<h3>◄ هدف</h3>
<p>هدف این پروژه ارائه یک روش یکپارچه و کاملاً خودکار برای کاربران است تا بتوانند یک تجربه دسکتاپ دبیان قدرتمند و غنی از امکانات را روی دستگاه اندرویدی خود بدون نیاز به دسترسی روت داشته باشند. این اسکریپت برای توسعه‌دهندگان، دانشجویان و علاقه‌مندان به لینوکس طراحی شده است که به دنبال یک محیط محاسباتی قابل حمل و پایدار هستند.</p>

<hr>

<h3>◄ ویژگی‌ها</h3>
<ul>
    <li><strong>🚀 کاملاً خودکار:</strong> اسکریپت همه چیز را از راه‌اندازی اولیه تا ایجاد کاربر و نصب نرم‌افزار مدیریت می‌کند.</li>
    <li><strong>🖥️ محیط دسکتاپ کامل:</strong> دسکتاپ سبک و کاربرپسند XFCE را نصب می‌کند.</li>
    <li><strong>📚 نرم‌افزارهای ضروری:</strong> با فایرفاکس ESR برای وب‌گردی و مجموعه کامل لیبره‌آفیس برای کارهای اداری از پیش بارگذاری شده است.</li>
    <li><strong>✨ کاربرپسند:</strong> دارای اعلان‌های تعاملی برای نام کاربری، رمز عبور و وضوح صفحه VNC.</li>
    <li><strong>⚡ دستورات میانبر راحت:</strong> شامل میانبرهای ساده برای مدیریت آسان.</li>
    <li><strong>🌍 منطقه زمانی از پیش تنظیم شده:</strong> منطقه زمانی سیستم به طور پیش‌فرض روی آسیا/تهران تنظیم می‌شود.</li>
</ul>

<hr>

<h3>◄ نیازمندی‌ها</h3>
<ul>
    <li>یک دستگاه اندرویدی (گوشی یا تبلت).</li>
    <li>برنامه <a href="https://f-droid.org/en/packages/com.termux/">ترموکس</a> نصب شده باشد.</li>
    <li>یک برنامه VNC Viewer (مانند <a href="https://play.google.com/store/apps/details?id=com.realvnc.viewer.android">RealVNC</a> یا <a href="https://play.google.com/store/apps/details?id=com.gaurav.avnc">AVNC</a>) روی دستگاه اندرویدی شما نصب شده باشد.</li>
    <li>تقریباً ۴ تا ۵ گیگابایت فضای ذخیره‌سازی آزاد.</li>
</ul>

<hr>

<h3>◄ نصب و استفاده</h3>

<h4>۱. اجرای نصب‌کننده</h4>
<p>دستور تک‌خطی زیر را در ترمینال ترموکس خود جای‌گذاری کرده و Enter را بزنید.</p>
<pre><code>bash -c "$(curl -fsSL https://raw.githubusercontent.com/erfan2255/debian-on-android/main/setup.sh)"</code></pre>

<h4>۲. دنبال کردن اعلان‌ها</h4>
<p>اسکریپت شما را برای ایجاد نام کاربری و رمز عبور برای سیستم دبیان جدیدتان راهنمایی می‌کند.</p>

<h4>۳. ورود به سیستم</h4>
<p>پس از اتمام نصب، یک میانبر با نام <code>debian</code> در ترموکس ایجاد می‌شود. برای ورود، به سادگی تایپ کنید:</p>
<pre><code>debian</code></pre>

<h4>۴. راه‌اندازی سرور VNC</h4>
<p>پس از ورود به محیط دبیان، دسکتاپ گرافیکی را با تایپ کردن دستور زیر راه‌اندازی کنید:</p>
<pre><code>startvnc</code></pre>
<blockquote>اولین باری که این دستور را اجرا می‌کنید، از شما خواسته می‌شود تا وضوح صفحه را انتخاب کرده و یک رمز عبور مخصوص VNC تنظیم کنید.</blockquote>

<h4>۵. اتصال با کلاینت VNC</h4>
<p>برنامه VNC Viewer خود را باز کرده و یک اتصال جدید به آدرس زیر ایجاد کنید:</p>
<pre><code>localhost:1</code></pre>
<p>رمز عبور VNC را که در مرحله قبل ایجاد کردید وارد کنید. اکنون دسکتاپ دبیان خود را خواهید دید!</p>

<h4>۶. متوقف کردن سرور VNC</h4>
<p>هنگامی که کارتان با جلسه تمام شد، می‌توانید سرور VNC را از داخل دبیان با تایپ کردن دستور زیر متوقف کنید:</p>
<pre><code>stopvnc</code></pre>

<hr>

<h3>◄ چه چیزهایی شامل می‌شود؟</h3>
<table width="100%" style="border-collapse: collapse;">
    <thead>
        <tr style="border-bottom: 1px solid #ddd;">
            <th style="padding: 8px; text-align: right;">جزء</th>
            <th style="padding: 8px; text-align: right;">توضیحات</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td style="padding: 8px;"><strong>سیستم عامل</strong></td>
            <td style="padding: 8px;">دبیان ۱۳ (Trixie)</td>
        </tr>
        <tr>
            <td style="padding: 8px;"><strong>محیط دسکتاپ</strong></td>
            <td style="padding: 8px;">XFCE 4</td>
        </tr>
        <tr>
            <td style="padding: 8px;"><strong>مرورگر وب</strong></td>
            <td style="padding: 8px;">Firefox ESR</td>
        </tr>
        <tr>
            <td style="padding: 8px;"><strong>مجموعه آفیس</strong></td>
            <td style="padding: 8px;">لیبره‌آفیس (رایتر، کالک، ایمپرس و غیره)</td>
        </tr>
        <tr>
            <td style="padding: 8px;"><strong>سرور VNC</strong></td>
            <td style="padding: 8px;">TigerVNC</td>
        </tr>
        <tr>
            <td style="padding: 8px;"><strong>ابزارهای سیستمی</strong></td>
            <td style="padding: 8px;"><code>sudo</code>, <code>nano</code>, <code>adduser</code>, و بیشتر.</td>
        </tr>
    </tbody>
</table>

<hr>

<h3>◄ تصاویر صفحه</h3>
<p>در اینجا پیش‌نمایشی از محیط دسکتاپ دبیان ۱۳ XFCE که نصب خواهید کرد، آمده است.</p>

<div style="display: flex; justify-content: center; align-items: center; flex-wrap: wrap; gap: 2rem; margin-top: 1rem;">
    <div style="text-align: center;">
        <img src="https://github.com/erfan2255/debian-on-android/blob/main/Images/IMG_20250823_181327.png" alt="Debian info" style="width: 400px; max-width: 90%; border-radius: 15px; box-shadow: 0 10px 20px rgba(0,0,0,0.1);"/>
        <p><strong>اطلاعات دبیان</strong></p>
    </div>
    <div style="text-align: center;">
        <img src="https://github.com/erfan2255/debian-on-android/blob/main/Images/IMG_20250823_181349.png" alt="Libre Office" style="width: 400px; max-width: 90%; border-radius: 15px; box-shadow: 0 10px 20px rgba(0,0,0,0.1);"/>
        <p><strong>لیبره‌آفیس</strong></p>
    </div>
</div>

<hr>

<h3>◄ حمایت خود را نشان دهید</h3>
<p>اگر این پروژه برای شما مفید بود، لطفاً با دادن یک ⭐ از آن حمایت کنید!</p>

<h3>◄ مجوز</h3>
<p>این پروژه تحت مجوز MIT منتشر شده است. برای جزئیات بیشتر به فایل <a href="https://github.com/erfan2255/Debian-On-Android/blob/main/LICENSE">LICENSE</a> مراجعه کنید.</p>

<hr>
<div align="center">
    <p><strong>توسط CoreLand</strong></p>
</div>

</body>
</html>
