import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // 🔥 Brand Colors (Perfect match for Meal Monkey!)
  static const Color primaryColor = Color(0xFFFF6C44); // Vibrant orange

  // ☀️ Light Colors (Updated for pure white bg)
  static const Color lightBg = Color(0xFFFFFFFF);        // Pure white (like Meal Monkey)
  static const Color lightSurface = Color(0xFFFFFFFF);   // White for cards
  static const Color lightText = Color(0xFF121223);       // Dark near-black
  static const Color lightSecondaryText = Color(0xFF6B6B6B); // Medium gray

  // 🌙 Dark Colors (Bonus – original design is light-only, but this looks good)
  static const Color darkBg = Color(0xFF121212);
  static const Color darkSurface = Color(0xFF1E1E1E);
  static const Color darkText = Color(0xFFEDEDED);
  static const Color darkSecondaryText = Color(0xFFB0B0B0);

  // ☀️ Light Theme
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: lightBg,

    colorScheme: ColorScheme.light(
      primary: primaryColor,
      surface: lightSurface,
   
      onSurface: lightText,           // Main text/icons
      
      secondary: primaryColor,        // Optional: use orange as secondary too
    ),

    textTheme: GoogleFonts.poppinsTextTheme().copyWith(
      headlineLarge: const TextStyle(     // For big titles
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: lightText,
      ),
      titleLarge: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: lightText,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        color: lightSecondaryText,
      ),
      labelLarge: const TextStyle(        // Button text
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        elevation: 4,
        shadowColor: primaryColor.withValues(alpha: 0.3),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
    ),

    cardTheme: const CardThemeData(
      color: lightSurface,
      elevation: 8,
      shadowColor: Colors.black26,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: lightSurface,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: primaryColor, width: 2),
      ),
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: lightBg,
      elevation: 0,
      foregroundColor: lightText,
      centerTitle: true,
    ),
  );

  // 🌙 Dark Theme (Optional improvements)
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: darkBg,

    colorScheme: ColorScheme.dark(
      primary: primaryColor,
      surface: darkSurface,
      onSurface: darkText,
    ),

    textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme).copyWith(
      titleLarge: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: darkText,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        color: darkSecondaryText,
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    ),

    cardTheme: CardThemeData(
      color: darkSurface,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: darkSurface,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
    ),
  );
}