import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'provider.dart';

class BlocsDemo extends StatelessWidget {
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        title: 'Log Me In!',
        home: Scaffold(
          body: LoginScreen(),
        ),
      ),
    );
  }
}