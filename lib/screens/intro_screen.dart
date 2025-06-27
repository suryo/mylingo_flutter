import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {
  final List<String> infoTexts = [
    "📘 **Apa itu MyLingo?**\n\nMyLingo adalah aplikasi pembelajaran bahasa Inggris yang menyenangkan dan interaktif, khususnya untuk anak-anak.",
    "🎧 **Belajar Lewat Suara**\n\nMyLingo membantu melatih pelafalan kata melalui fitur speech-to-text. Anak bisa mengucapkan kata dan langsung tahu apakah pengucapannya sudah benar.",
    "🧠 **Level Pembelajaran**\n\nAplikasi ini terdiri dari 3 level: Beginner, Intermediate, dan Advanced. Pilih sesuai kemampuan.",
    "🌐 **Offline Mode**\n\nMyLingo bekerja sepenuhnya offline. Tidak butuh internet!",
    "🎯 **Cara Mulai**\n\n1. Pilih level\n2. Klik 'Start Learning'\n3. Pilih tema, dan mulai latihan pelafalan!",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pengenalan Aplikasi")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
          itemCount: infoTexts.length,
          separatorBuilder: (context, index) => SizedBox(height: 16),
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.indigo.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.all(16),
              child: Text(
                infoTexts[index],
                style: TextStyle(fontSize: 16),
              ),
            );
          },
        ),
      ),
    );
  }
}
