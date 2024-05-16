import 'package:flutter/material.dart';

final appTheme = ThemeData(
  useMaterial3: true,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: const MaterialStatePropertyAll<Color>(
        Color(0xFF416FDF),
      ),
      elevation: const MaterialStatePropertyAll<double>(5),
      padding: const MaterialStatePropertyAll<EdgeInsets>(
        EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 18,
        ),
      ),
      shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    ),
  ),
);
