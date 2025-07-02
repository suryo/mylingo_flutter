import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/intro_screen.dart';
import 'screens/choose_level_screen.dart';
import 'screens/choose_theme_screen.dart';
import 'screens/learning_screen.dart';
import 'screens/score_history_screen.dart'; // Tambahkan import



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
        '/intro': (context) => IntroScreen(),
        '/choose-theme': (context) => ChooseThemeScreen(),
        '/choose-level': (context) => ChooseLevelScreen(),
        // Tambahkan route:
'/score-history': (context) => ScoreHistoryScreen(),

      },
      // ⬇️ Untuk route yang butuh parameter
      onGenerateRoute: (settings) {
        if (settings.name == '/learning') {
          final args = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
            builder: (context) => LearningScreen(
              filename: args['filename'],
              level: args['level'],
            ),
          );
        }
        return null;
      },
    );
  }
}
