import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sasta_taxi/core/theme/color_palette.dart';

/// Main theme configuration for SastaTaxi app
class SastaTaxiTheme {
  SastaTaxiTheme._();
  
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      
      // Color Scheme
      colorScheme: const ColorScheme.light(
        primary: ColorPalette.vibrantOrange,
        secondary: ColorPalette.deepBlue,
        tertiary: ColorPalette.goldenYellow,
        surface: ColorPalette.pureWhite,
        error: ColorPalette.errorRed,
        onPrimary: ColorPalette.pureWhite,
        onSecondary: ColorPalette.pureWhite,
        onSurface: ColorPalette.textPrimary,
        onError: ColorPalette.pureWhite,
      ),
      
      // Scaffold Background
      scaffoldBackgroundColor: ColorPalette.softGray,
      
      // App Bar Theme
      appBarTheme: AppBarTheme(
        backgroundColor: ColorPalette.pureWhite,
        foregroundColor: ColorPalette.textPrimary,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: ColorPalette.textPrimary,
        ),
        iconTheme: const IconThemeData(
          color: ColorPalette.textPrimary,
        ),
      ),
      
      // Card Theme
      cardTheme: CardTheme(
        color: ColorPalette.pureWhite,
        elevation: 2,
        shadowColor: ColorPalette.textPrimary.withOpacity(0.1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      
      // Elevated Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorPalette.vibrantOrange,
          foregroundColor: ColorPalette.pureWhite,
          elevation: 0,
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 16,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      
      // Text Button Theme
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: ColorPalette.vibrantOrange,
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          textStyle: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      
      // Outlined Button Theme
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: ColorPalette.vibrantOrange,
          side: const BorderSide(
            color: ColorPalette.vibrantOrange,
            width: 1.5,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 14,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      
      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: ColorPalette.softGray,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: ColorPalette.vibrantOrange,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: ColorPalette.errorRed,
            width: 1.5,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        hintStyle: GoogleFonts.inter(
          fontSize: 14,
          color: ColorPalette.textTertiary,
        ),
      ),
      
      // Icon Theme
      iconTheme: const IconThemeData(
        color: ColorPalette.textSecondary,
        size: 24,
      ),
      
      // Floating Action Button Theme
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: ColorPalette.vibrantOrange,
        foregroundColor: ColorPalette.pureWhite,
        elevation: 4,
      ),
      
      // Chip Theme
      chipTheme: ChipThemeData(
        backgroundColor: ColorPalette.softGray,
        selectedColor: ColorPalette.vibrantOrange,
        labelStyle: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 8,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      
      // Divider Theme
      dividerTheme: DividerThemeData(
        color: ColorPalette.textLight,
        thickness: 1,
        space: 1,
      ),
      
      // Bottom Navigation Bar Theme
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: ColorPalette.pureWhite,
        selectedItemColor: ColorPalette.vibrantOrange,
        unselectedItemColor: ColorPalette.textTertiary,
        elevation: 8,
        type: BottomNavigationBarType.fixed,
      ),
      
      // Text Theme
      textTheme: GoogleFonts.interTextTheme().copyWith(
        displayLarge: GoogleFonts.poppins(
          fontSize: 32,
          fontWeight: FontWeight.w700,
          color: ColorPalette.textPrimary,
        ),
        displayMedium: GoogleFonts.poppins(
          fontSize: 28,
          fontWeight: FontWeight.w600,
          color: ColorPalette.textPrimary,
        ),
        displaySmall: GoogleFonts.poppins(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: ColorPalette.textPrimary,
        ),
        headlineMedium: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: ColorPalette.textPrimary,
        ),
        titleLarge: GoogleFonts.poppins(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: ColorPalette.textPrimary,
        ),
        bodyLarge: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: ColorPalette.textPrimary,
        ),
        bodyMedium: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: ColorPalette.textSecondary,
        ),
        labelLarge: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
  
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(
        primary: ColorPalette.vibrantOrange,
        secondary: ColorPalette.deepBlue,
        tertiary: ColorPalette.goldenYellow,
        surface: Color(0xFF1A1A2E),
        error: ColorPalette.errorRed,
        onPrimary: ColorPalette.pureWhite,
        onSecondary: ColorPalette.pureWhite,
        onSurface: ColorPalette.pureWhite,
        onError: ColorPalette.pureWhite,
      ),
      scaffoldBackgroundColor: const Color(0xFF0F0F1E),
      // Additional dark theme properties can be added here
    );
  }
}
