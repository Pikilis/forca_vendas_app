import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(SalesForceApp());
}

class SalesForceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sales Force App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginScreen(),
    );
  }
}