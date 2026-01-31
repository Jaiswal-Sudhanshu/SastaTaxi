import 'package:flutter/material.dart';
import 'package:sasta_taxi/core/theme/color_palette.dart';
import 'package:sasta_taxi/core/constants/app_constants.dart';

/// Custom decorations for consistent UI elements
class AppDecorations {
  AppDecorations._();
  
  // Card Decorations
  static BoxDecoration get primaryCard => BoxDecoration(
        color: ColorPalette.pureWhite,
        borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
        boxShadow: [
          BoxShadow(
            color: ColorPalette.textPrimary.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      );
  
  static BoxDecoration get elevatedCard => BoxDecoration(
        color: ColorPalette.pureWhite,
        borderRadius: BorderRadius.circular(AppConstants.borderRadiusLarge),
        boxShadow: [
          BoxShadow(
            color: ColorPalette.textPrimary.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      );
  
  static BoxDecoration get comparisonCard => BoxDecoration(
        color: ColorPalette.cardBackground,
        borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
        border: Border.all(
          color: ColorPalette.textLight,
          width: 1.5,
        ),
      );
  
  // Gradient Decorations
  static BoxDecoration get primaryGradient => BoxDecoration(
        gradient: const LinearGradient(
          colors: ColorPalette.primaryGradient,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
      );
  
  static BoxDecoration get secondaryGradient => BoxDecoration(
        gradient: const LinearGradient(
          colors: ColorPalette.secondaryGradient,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
      );
  
  static BoxDecoration get savingsGradient => BoxDecoration(
        gradient: const LinearGradient(
          colors: ColorPalette.savingsGradient,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(AppConstants.borderRadiusSmall),
      );
  
  // Input Decorations
  static InputDecoration searchInputDecoration({
    required String hint,
    Widget? prefixIcon,
    Widget? suffixIcon,
  }) =>
      InputDecoration(
        hintText: hint,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: ColorPalette.softGray,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
          borderSide: const BorderSide(
            color: ColorPalette.vibrantOrange,
            width: 2,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppConstants.defaultPadding,
          vertical: AppConstants.defaultPadding,
        ),
      );
  
  // Badge Decorations
  static BoxDecoration get successBadge => BoxDecoration(
        color: ColorPalette.successGreen.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppConstants.borderRadiusSmall),
      );
  
  static BoxDecoration get warningBadge => BoxDecoration(
        color: ColorPalette.warningAmber.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppConstants.borderRadiusSmall),
      );
  
  static BoxDecoration get errorBadge => BoxDecoration(
        color: ColorPalette.errorRed.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppConstants.borderRadiusSmall),
      );
}
