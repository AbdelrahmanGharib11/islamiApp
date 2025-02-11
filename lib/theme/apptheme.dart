import 'package:flutter/material.dart';

class Apptheme {
  static Color primary = Color(0xffE2BE7F);
  static Color white = Color(0xffFFFFFF);
  static Color black = Color(0xff202020);

  static ThemeData lighttheme = ThemeData(
      appBarTheme: AppBarTheme(
          backgroundColor: black,
          foregroundColor: primary,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: primary,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          )),
      scaffoldBackgroundColor: black,
      textTheme: TextTheme(
        headlineLarge: TextStyle(
          color: white,
          fontSize: 36,
          fontWeight: FontWeight.bold,
        ),
        headlineSmall: TextStyle(
          color: white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        titleLarge: TextStyle(
          color: white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        titleMedium: TextStyle(
          color: white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        titleSmall: TextStyle(
          color: white,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        bodyLarge: TextStyle(
          color: white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: primary,
        selectedItemColor: white,
        selectedLabelStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: white,
        ),
        showSelectedLabels: true,
        showUnselectedLabels: false,
      ));

  static ThemeData darktheme = ThemeData();
}
