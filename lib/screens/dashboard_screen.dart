import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard MyLingo'),
      ),
      body: Center(
        child: Text(
          'Selamat datang di Dashboard!',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
