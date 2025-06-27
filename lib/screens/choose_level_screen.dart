import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChooseLevelScreen extends StatelessWidget {
  final List<String> levels = ["Beginner", "Intermediate", "Advanced"];

  Future<void> _saveLevel(BuildContext context, String level) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('level', level);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Level \"$level\" disimpan!")),
    );

    // Kembali ke dashboard setelah pemilihan
    Navigator.pushReplacementNamed(context, '/dashboard');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pilih Level")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: levels.map((level) {
            return Card(
              elevation: 3,
              margin: EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                leading: Icon(Icons.school),
                title: Text(level, style: TextStyle(fontSize: 18)),
                trailing: Icon(Icons.arrow_forward),
                onTap: () => _saveLevel(context, level),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
