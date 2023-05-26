import 'package:bottom_navigation/theme/app_color_constant.dart';
import 'package:flutter/material.dart';

// this class for styling theme of app bar, buttons, text
class AppTheme {
  // private constructor
  AppTheme._();

  static getApplicationTheme() {
    return ThemeData(
      colorScheme: const ColorScheme.light(
        primary: Colors.blue,
      ),
      fontFamily: 'Montserrat',
      useMaterial3: true,

      // for app bar theme
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: AppColorConstant.appBarColor,
        centerTitle: true,
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
      ),

      // for bottom navigation theme
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.green,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.yellow,
      ),
    );
  }
}
