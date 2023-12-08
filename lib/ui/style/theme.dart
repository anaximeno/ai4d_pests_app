import 'package:flutter/material.dart';

abstract class Theming {
  static final theme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: mainColor,
    ),
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        color: secondaryColor,
        fontSize: 34,
      ),
    ),
    useMaterial3: true,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        height: 1.75,
        letterSpacing: 1,
      ),
      bodyLarge: TextStyle(
        height: 2,
      ),
    ),
  );

  static const mainColor = Color(0xffab162b);

  static const secondaryColor = Color(0xff2c2a2b);
}
