import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String userName = "";
  String userLevel = "";

  @override
  void initState() {
    super.initState();
    _loadUserInfo();
  }

  Future<void> _loadUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString('name') ?? 'User';
      userLevel = prefs.getString('level') ?? 'Belum dipilih';
    });
  }

  Widget _buildMenuCard(String title, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4,
        margin: EdgeInsets.all(12),
        child: Container(
          width: double.infinity,
          height: 100,
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              Icon(icon, size: 36, color: Colors.indigo),
              SizedBox(width: 16),
              Text(title, style: TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dashboard")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hi, $userName 👋", style: TextStyle(fontSize: 20)),
            Text(
              "Level: $userLevel",
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            SizedBox(height: 20),
            _buildMenuCard("📘 Pengenalan Aplikasi", Icons.info_outline, () {
              Navigator.pushNamed(context, '/intro');
            }),
            _buildMenuCard("🚀 Start Learning", Icons.play_circle_fill, () {
              Navigator.pushNamed(context, '/choose-theme');
            }),
            _buildMenuCard("🎯 Pilih Level", Icons.school, () {
              Navigator.pushNamed(context, '/choose-level');
            }),

            _buildMenuCard("📊 Riwayat Skor", Icons.bar_chart, () {
              Navigator.pushNamed(context, '/score-history');
            }),

            SizedBox(height: 40),
            Center(
              child: Text(
                'Powered by:',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/logo/twh.png', height: 32),
                SizedBox(width: 20),
                Image.asset('assets/images/logo/uwp.png', height: 32),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
