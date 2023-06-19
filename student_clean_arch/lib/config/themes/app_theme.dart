import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static getApplicationTheme() {
    return ThemeData(
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedIconTheme: IconThemeData(color: Colors.red),
          selectedItemColor: Colors.red,
          unselectedIconTheme: IconThemeData(color: Colors.black),
          unselectedItemColor: Colors.black,
          backgroundColor: Colors.yellow,
        ),
    );
  }
}
