# 📘 MyLingo – Aplikasi Belajar Bahasa Inggris Interaktif

**MyLingo** adalah aplikasi edukasi berbasis Flutter yang dirancang untuk membantu pengguna — terutama anak-anak — dalam melatih pelafalan bahasa Inggris melalui metode pengenalan suara (*speech recognition*). Aplikasi ini sepenuhnya **offline**, ringan, dan mudah digunakan.

---

## 🎯 Tujuan Aplikasi
MyLingo bertujuan:
- Membantu anak-anak dan pemula belajar pelafalan kata dalam bahasa Inggris
- Memberikan pengalaman belajar interaktif menggunakan suara
- Menyediakan pembelajaran berdasarkan tema dan level
- Menjadi solusi edukatif yang bisa digunakan tanpa koneksi internet

---

## 🔧 Teknologi yang Digunakan

| Teknologi        | Deskripsi                                  |
|------------------|--------------------------------------------|
| Flutter          | Framework utama aplikasi mobile            |
| Dart             | Bahasa pemrograman utama                   |
| speech_to_text   | Plugin untuk pengenalan suara              |
| audioplayers     | Plugin untuk memainkan suara feedback      |
| shared_preferences | Untuk menyimpan data lokal pengguna      |

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
├── data/          # berisi 29 file JSON tema
└── sounds/        # bip.mp3, ding.mp3, tetot.mp3
```

---

## 📈 Tahapan Pengembangan

### 🔹 1. **Prototype**
- Fungsi dasar pengenalan kata menggunakan `speech_to_text`
- Tampil satu per satu kata dalam list
- Validasi suara dengan feedback audio (`ding`, `tetot`)
- Navigasi antar kata dengan `next`

---

### 🔹 2. **Alpha_1**
Fokus: Struktur dasar aplikasi
- ✅ Splash screen
- ✅ Register screen (nama, username, password) → data tersimpan di `SharedPreferences`
- ✅ Login screen dengan validasi lokal
- ✅ Auto-route berdasarkan status login/register
- ✅ Dashboard dengan 3 menu utama (tanpa grid tema)

---

### 🔹 3. **Alpha_2**
Fokus: Struktur menu & UI pembelajaran
- ✅ Dashboard menampilkan:
  - 📘 Pengenalan Aplikasi
  - 🚀 Start Learning
  - 🎯 Pilih Level
- ✅ Intro Screen menjelaskan penggunaan
- ✅ Pilih level (Beginner, Intermediate, Advanced)
- ✅ Start Learning → tampilkan 29 tema dalam grid 3 kolom
- ✅ Data tema diambil dari file JSON lokal
- ✅ Nama dan level user ditampilkan di dashboard

---

### 🔹 4. **Alpha_3**
Fokus: Implementasi sesi pembelajaran
- ✅ LearningScreen:
  - Load soal berdasarkan tema dan level
  - Tampilkan kata/frasa untuk diucapkan
  - Gunakan speech-to-text untuk validasi
  - Feedback audio: `ding.mp3` (benar), `tetot.mp3` (salah)
  - Navigasi antar soal
- ✅ Semua berjalan offline, ringan, dan stabil

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

✅ **Versi: Alpha_3**  
📱 **Platform: Android (Flutter)**  
📡 **Mode: Offline**

---

## 📌 Rencana Berikutnya (Beta)
- Statistik dan progress belajar
- Visualisasi gambar per tema
- Kuis akhir tema
- Mode tantangan
- Sinkronisasi cloud (opsional)

---

## 🧑‍💻 Developer
- Dosen & Fullstack Developer
- Dibuat dengan semangat edukasi dan literasi digital
