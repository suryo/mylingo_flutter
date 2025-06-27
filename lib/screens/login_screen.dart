import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login MyLingo'), centerTitle: true),
      body: Center(
        child: ElevatedButton(
          child: Text("Masuk ke Dashboard"),
          onPressed: () {
            // sementara, tampilkan snackbar saja
            Navigator.pushReplacementNamed(context, '/dashboard');
          },
        ),
      ),
    );
  }
}
