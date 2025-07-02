import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScoreHistoryScreen extends StatefulWidget {
  @override
  _ScoreHistoryScreenState createState() => _ScoreHistoryScreenState();
}

class _ScoreHistoryScreenState extends State<ScoreHistoryScreen> {
  List<Map<String, dynamic>> _scores = [];

  @override
  void initState() {
    super.initState();
    _loadScores();
  }

  Future<void> _loadScores() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> stored = prefs.getStringList('scores') ?? [];
    List<Map<String, dynamic>> parsed = stored.map((e) => Map<String, dynamic>.from(json.decode(e))).toList();

    setState(() {
      _scores = parsed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Riwayat Skor")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _scores.isEmpty
            ? Center(child: Text("Belum ada data skor."))
            : ListView.separated(
                itemCount: _scores.length,
                separatorBuilder: (_, __) => Divider(),
                itemBuilder: (context, index) {
                  final entry = _scores[index];
                  return ListTile(
                    leading: Icon(Icons.history),
                    title: Text("📅 ${entry['date']}"),
                    subtitle: Text("✔️ Benar: ${entry['correct']}    ❌ Salah: ${entry['wrong']}",
                        style: TextStyle(fontSize: 14)),
                  );
                },
              ),
      ),
    );
  }
}
