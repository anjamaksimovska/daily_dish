import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.green,
    textTheme: TextTheme(
      headlineMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.green),
      headlineSmall: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
    ),
  );
}
