import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(MyLingoApp());
}

class MyLingoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyLingo Prototype',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        // '/register': (context) => RegisterScreen(), // disiapkan nanti
        // '/dashboard': (context) => DashboardScreen(), // disiapkan nanti
      },
    );
  }
}
