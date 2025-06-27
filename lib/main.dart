import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/intro_screen.dart';
import 'screens/choose_level_screen.dart';

void main() {
  runApp(MyLingoApp());
}

class MyLingoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyLingo',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/register': (context) => RegisterScreen(),
        '/login': (context) => LoginScreen(),
        '/dashboard': (context) => DashboardScreen(),
        '/intro': (context) => IntroScreen(), // (next)
        '/choose-theme': (context) => ChooseThemeScreen(), // (next)
        '/choose-level': (context) => ChooseLevelScreen(), // (next)
      },
    );
  }
}
