import 'package:dhood_app/presentation/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemes {
  AppThemes._();

  static ThemeData darkTheme(BuildContext context) {
    return ThemeData(
        fontFamily: 'Montserrat',
        textTheme: GoogleFonts.montserratTextTheme(),
        scaffoldBackgroundColor: const Color(0xFF0E0F0E),
        colorScheme: AppColors.darkColorScheme());
  }

  static ThemeData lightheme(BuildContext context) {
    return ThemeData(
        fontFamily: 'Montserrat',
        textTheme: GoogleFonts.montserratTextTheme(),
        scaffoldBackgroundColor: const Color(0xFFF2F2F2),
        colorScheme: AppColors.lightColorScheme());
  }

}
