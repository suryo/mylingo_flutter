import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:shared_preferences/shared_preferences.dart';

class ChooseThemeScreen extends StatefulWidget {
  @override
  _ChooseThemeScreenState createState() => _ChooseThemeScreenState();
}

class _ChooseThemeScreenState extends State<ChooseThemeScreen> {
  List<Map<String, dynamic>> themes = [];
  String currentLevel = "";

  @override
  void initState() {
    super.initState();
    _loadThemes();
  }

  Future<void> _loadThemes() async {
    final prefs = await SharedPreferences.getInstance();
    currentLevel = prefs.getString('level') ?? 'Beginner';

    // Daftar file JSON (bisa juga di-generate otomatis kalau dynamic)
    final List<String> themeFiles = [
      "alphabet.json", "animals.json", "body_parts.json", "buildings.json",
      "clothes.json", "colors.json", "daily_activities.json", "days_of_week.json",
      "drink.json", "family.json", "feelings.json", "food.json",
      "fruits.json", "holiday.json", "hobbies.json", "months_of_year.json",
      "numbers.json","occupation.json", "places.json", "rooms.json", "school_supplies.json",
      "seasons.json", "shapes.json", "space.json", "time.json",
      "toys.json", "transportation.json", "vegetables.json", "weather.json"
    ];

    List<Map<String, dynamic>> loadedThemes = [];

    for (String file in themeFiles) {
      final jsonStr = await rootBundle.loadString('assets/data/$file');
      final data = json.decode(jsonStr);
      loadedThemes.add({
        'title': data['theme'],
        'filename': file,
      });
    }

    setState(() {
      themes = loadedThemes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pilih Tema - Level: $currentLevel")),
      body: themes.isEmpty
          ? Center(child: CircularProgressIndicator())
          : GridView.builder(
              padding: EdgeInsets.all(12),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.8,
              ),
              itemCount: themes.length,
              itemBuilder: (context, index) {
                final item = themes[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/learning',
                      arguments: {
                        'filename': item['filename'],
                        'level': currentLevel,
                      },
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.indigo.shade50,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(8),
                    child: Text(
                      item['title'],
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
