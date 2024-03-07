import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static ColorScheme lightColorScheme() {
    return const ColorScheme.light(
      primary: Color(0xFFA8DEEA),
      background: Color(0xFFF2F2F2),
      surface: Color(0xFF261F20),
    ).copyWith(
        onPrimary:   const Color(0xFFA8DEEA),
        onSecondary: const Color(0xFF261F20));
  }

  static ColorScheme darkColorScheme() {
    return const ColorScheme.dark(
      primary: Color(0xFFA8DEEA),
      background: Color(0xFF261F20),
      surface: Color(0xFFA8DEEA),
    ).copyWith(
        onPrimary: const Color(0xFF261F20),
        onSecondary:   const Color(0xFFF2F2F2));
  }
}
