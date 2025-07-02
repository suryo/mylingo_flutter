# MyLingo (Alpha 5)

MyLingo adalah aplikasi pembelajaran Bahasa Inggris berbasis Flutter yang menyenangkan dan interaktif, ditujukan khusus untuk anak-anak. Aplikasi ini melatih pelafalan, mengenal kata, dan belajar melalui suara, semuanya **offline** tanpa memerlukan koneksi internet.

---

## ✅ Status: Alpha_5

Versi ini merupakan kelanjutan dari pengembangan sebelumnya dengan berbagai peningkatan fitur.

---

## ✨ Fitur Utama Alpha_5

### 1. 🔤 Text-to-Speech + IPA
- Menampilkan simbol IPA (International Phonetic Alphabet)
- Tombol 🔊 Play untuk mendengarkan pengucapan
- Pilihan aksen English (US / UK)

### 2. ✔️❌ Penilaian Latihan
- Skor benar dan salah dihitung selama latihan
- Ditampilkan langsung saat latihan berlangsung

### 3. 💾 Penyimpanan Riwayat Skor
- Skor terakhir disimpan otomatis (maksimal 10)
- Tersedia halaman khusus “Riwayat Skor” dengan tanggal dan hasil

### 4. ⬅️➡️ Navigasi Soal
- Tombol Prev dan Next untuk berpindah antar soal
- Jika soal terakhir, muncul tombol “Simpan Skor” yang langsung mengarah ke riwayat

### 5. 🖼️ Logo Powered by
- Logo `twh` dan `uwp` ditampilkan di semua halaman (splash, dashboard, intro, dll)

---

## 🗂️ Struktur Navigasi

- SplashScreen
- RegisterPage
- LoginPage
- DashboardPage
- IntroScreen (Pengenalan Aplikasi)
- ChooseLevelScreen
- ChooseThemeScreen
- LearningScreen (utama)
- ScoreHistoryScreen (riwayat hasil latihan)

---

## 🔧 Teknologi & Library

- `Flutter`
- `shared_preferences` (penyimpanan data lokal)
- `speech_to_text`
- `flutter_tts`
- `intl` (format tanggal)
- `audioplayers`

---

## 🗓️ Timeline Rilis

| Tahap       | Fitur                          |
|-------------|--------------------------------|
| Prototype   | Splash, Login, Dashboard dasar |
| Alpha 1     | Register, Level, Tema, Learn   |
| Alpha 2     | Intro, Teks + Audio IPA        |
| Alpha 3     | UI Penyempurnaan Dashboard     |
| Alpha 4     | Speech-to-text + IPA + TTS     |
| **Alpha 5** | Penilaian, Riwayat, Navigasi   |

---

## 👥 Developer Note

Proyek ini dirancang untuk offline learning, namun ke depan akan disiapkan mode cloud-sync dan leaderboard untuk versi production.