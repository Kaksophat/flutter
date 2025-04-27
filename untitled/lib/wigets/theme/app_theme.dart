import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'Raleway',
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.28,
          color: Color(0xFF202020),
        ),
        displayMedium: TextStyle(
          fontSize: 21,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.21,
          color: Color(0xFF202020),
        ),
        displaySmall: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          letterSpacing: -0.18,
          color: Color(0xFF202020),
        ),
        bodyLarge: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w500,
          letterSpacing: -0.17,
          color: Colors.black,
        ),
        bodyMedium: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          fontFamily: 'Nunito Sans',
          color: Colors.black,
        ),
      ),
    );
  }
}
