import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Main Colors
  static const Color primaryColor = Color(0xFF4F46E5); // Indigo
  static const Color primaryLight = Color(0xFF818CF8); // Indigo Light
  static const Color successColor = Color(0xFF10B981); // Emerald
  static const Color errorColor = Color(0xFFEF4444); // Red

  // Background and Surface Colors
  static const Color lightBackgroundColor = Color(0xFFF9FAFB);
  static const Color darkBackgroundColor = Color(0xFF111827);
  static const Color lightCardColor = Colors.white;
  static const Color darkCardColor = Color(0xFF1F2937);

  // Light Theme
  static ThemeData get lightTheme {
    final baseTheme = ThemeData.light();
    return baseTheme.copyWith(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: lightBackgroundColor,
      colorScheme: const ColorScheme.light(
        primary: primaryColor,
        secondary: successColor,
        surface: lightBackgroundColor,
      ),
      textTheme: GoogleFonts.plusJakartaSansTextTheme(baseTheme.textTheme),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        scrolledUnderElevation: 0, // Removes shadow on scroll in Material 3
        backgroundColor: lightBackgroundColor,
        foregroundColor: Colors.black87,
        centerTitle: true,
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        color: lightCardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: Colors.grey.shade200, width: 1),
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
      ),
    );
  }

  // Dark Theme
  static ThemeData get darkTheme {
    final baseTheme = ThemeData.dark();
    return baseTheme.copyWith(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: darkBackgroundColor,
      colorScheme: const ColorScheme.dark(
        primary: primaryColor,
        secondary: successColor,
        surface: darkBackgroundColor,
      ),
      textTheme: GoogleFonts.plusJakartaSansTextTheme(baseTheme.textTheme),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: darkBackgroundColor,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        color: darkCardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: Colors.grey.shade800, width: 1),
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
      ),
    );
  }
}
