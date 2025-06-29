# 📘 MyLingo – Aplikasi Belajar Bahasa Inggris Interaktif

**MyLingo** adalah aplikasi edukasi berbasis Flutter yang dirancang untuk membantu pengguna — terutama anak-anak — dalam melatih pelafalan bahasa Inggris melalui metode pengenalan suara (*speech recognition*) dan pelafalan sistematis (*phonetic awareness*). Aplikasi ini sepenuhnya **offline**, ringan, dan mudah digunakan.

---

## 🎯 Tujuan Aplikasi
MyLingo bertujuan:
- Membantu anak-anak dan pemula belajar pelafalan kata dalam bahasa Inggris
- Memberikan pengalaman belajar interaktif menggunakan suara
- Menyediakan pembelajaran berdasarkan tema dan level
- Menjadi solusi edukatif yang bisa digunakan tanpa koneksi internet

---

## 🔧 Teknologi yang Digunakan

| Teknologi          | Deskripsi                                     |
|--------------------|-----------------------------------------------|
| Flutter            | Framework utama aplikasi mobile               |
| Dart               | Bahasa pemrograman utama                      |
| speech_to_text     | Plugin untuk pengenalan suara (Speech Input) |
| flutter_tts        | Plugin untuk Text-to-Speech (Voice Output)   |
| audioplayers       | Plugin untuk memainkan suara feedback         |
| shared_preferences | Untuk menyimpan data lokal pengguna           |

---

## 📂 Struktur Fitur & Folder

```plaintext
lib/
├── main.dart
├── screens/
│   ├── splash_screen.dart
│   ├── register_screen.dart
│   ├── login_screen.dart
│   ├── dashboard_screen.dart
│   ├── intro_screen.dart
│   ├── choose_level_screen.dart
│   ├── choose_theme_screen.dart
│   └── learning_screen.dart
assets/
├── data/          # berisi 29 file JSON tema (dengan field word + ipa)
└── sounds/        # bip.mp3, ding.mp3, tetot.mp3
```

---

## 📈 Tahapan Pengembangan

### 🔹 1. **Prototype**
- Fungsi dasar pengenalan kata menggunakan `speech_to_text`
- Navigasi antar kata secara berurutan
- Feedback suara benar/salah

---

### 🔹 2. **Alpha_1**
Fokus: Struktur dasar aplikasi
- Splash screen
- Register dan login screen (data lokal)
- Auto-route berdasarkan status pengguna
- Dashboard menu awal

---

### 🔹 3. **Alpha_2**
Fokus: Navigasi tema dan level
- Menu: About App, Start Learning, Pilih Level
- 29 tema ditampilkan dalam bentuk grid
- Level Beginner/Intermediate/Advanced tersimpan
- Tampilan informasi user (nama dan level)

---

### 🔹 4. **Alpha_3**
Fokus: Halaman Latihan (Learning)
- Menampilkan kata/frasa dari file JSON
- Speech-to-text validasi pelafalan
- Feedback suara `ding` dan `tetot`
- Navigasi soal dalam satu sesi

---

### 🔹 5. **Alpha_4**
Fokus: Fitur Fonetik dan Suara
- ✅ Penambahan tampilan **IPA (International Phonetic Alphabet)**
- ✅ **Text-to-Speech (TTS)** untuk setiap kata/frasa
- ✅ Pilihan aksen: **English (US)** & **English (UK)**
- ✅ UI tombol pelafalan dan rekam dalam satu baris
- ✅ Font dan layout proporsional, ramah anak

---

## 📦 Total Tema yang Tersedia (29)

```text
Alphabet, Animals, Body Parts, Buildings, Clothes, Colors, Daily Activities,
Days of the Week, Drink, Family, Feelings, Food, Fruits, Holiday, Hobbies,
Months of the Year, Occupation, Places, Rooms in the House, School Supplies,
Seasons, Shapes, Sun Earth Moon Stars, Time, Toys, Transportation, Vegetables,
Weather, Tools
```

---

## 🚀 Status Saat Ini

✅ **Versi: Alpha_4**  
📱 **Platform: Android (Flutter)**  
📡 **Mode: Offline, Interaktif, Fonetik**

---

## 📌 Rencana Berikutnya (Beta)
- Statistik dan progress belajar
- Kuis akhir tema / sertifikat belajar
- Visualisasi gambar pendukung
- Sinkronisasi cloud (opsional)

---

## 🧑‍💻 Developer
- Dosen & Fullstack Developer
- Dibuat dengan semangat edukasi dan literasi digital
