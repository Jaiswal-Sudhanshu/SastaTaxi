import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sasta_taxi/core/theme/color_palette.dart';

/// Custom typography system using Poppins font family
class TypographySystem {
  TypographySystem._();
  
  // Heading Styles
  static TextStyle get h1 => GoogleFonts.poppins(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        color: ColorPalette.textPrimary,
        letterSpacing: -0.5,
      );
  
  static TextStyle get h2 => GoogleFonts.poppins(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        color: ColorPalette.textPrimary,
        letterSpacing: -0.3,
      );
  
  static TextStyle get h3 => GoogleFonts.poppins(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: ColorPalette.textPrimary,
      );
  
  static TextStyle get h4 => GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: ColorPalette.textPrimary,
      );
  
  static TextStyle get h5 => GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: ColorPalette.textPrimary,
      );
  
  // Body Text Styles
  static TextStyle get bodyLarge => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: ColorPalette.textPrimary,
        height: 1.5,
      );
  
  static TextStyle get bodyMedium => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: ColorPalette.textSecondary,
        height: 1.5,
      );
  
  static TextStyle get bodySmall => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: ColorPalette.textSecondary,
        height: 1.4,
      );
  
  // Special Text Styles
  static TextStyle get buttonText => GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.5,
      );
  
  static TextStyle get captionText => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: ColorPalette.textTertiary,
      );
  
  static TextStyle get overlineText => GoogleFonts.inter(
        fontSize: 10,
        fontWeight: FontWeight.w500,
        color: ColorPalette.textTertiary,
        letterSpacing: 1.2,
      );
  
  // Price Text Styles
  static TextStyle get priceHuge => GoogleFonts.poppins(
        fontSize: 36,
        fontWeight: FontWeight.w700,
        color: ColorPalette.vibrantOrange,
      );
  
  static TextStyle get priceLarge => GoogleFonts.poppins(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        color: ColorPalette.vibrantOrange,
      );
  
  static TextStyle get priceMedium => GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: ColorPalette.vibrantOrange,
      );
  
  // Label Styles
  static TextStyle get labelBold => GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: ColorPalette.textPrimary,
      );
  
  static TextStyle get labelMedium => GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: ColorPalette.textSecondary,
      );
}
