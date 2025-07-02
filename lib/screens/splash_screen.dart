import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), checkFirstLaunch);
  }

  Future<void> checkFirstLaunch() async {
    final prefs = await SharedPreferences.getInstance();
    final isRegistered = prefs.getBool('isRegistered') ?? false;
    final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    if (!isRegistered) {
      Navigator.pushReplacementNamed(context, '/register');
    } else if (!isLoggedIn) {
      Navigator.pushReplacementNamed(context, '/login');
    } else {
      Navigator.pushReplacementNamed(context, '/dashboard');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Center(
            child: Image.asset(
              'assets/images/splash/splash.png',
              width: 200,
            ),
          ),
          Spacer(),
          Text(
            'Powered by:',
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/logo/twh.png', height: 30),
              SizedBox(width: 20),
              Image.asset('assets/images/logo/uwp.png', height: 30),
            ],
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
