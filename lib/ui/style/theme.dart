import 'package:flutter/material.dart';

abstract class Theming {
  static final theme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xffab162b),
    ),
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 34,
        color: Color(0xff2c2a2b),
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
}
