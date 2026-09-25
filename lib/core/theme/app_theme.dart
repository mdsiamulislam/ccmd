import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTheme {
  static final ThemeData themeData = ThemeData(
    useMaterial3: true,

    // ---------------------------------------------------------------------------
    // COLORS
    // ---------------------------------------------------------------------------
    colorScheme: const ColorScheme.light(
      primary: AppColors.primaryColor,
      onPrimary: Colors.white,

      secondary: AppColors.primaryColor,
      onSecondary: Colors.white,

      error: AppColors.accentRed,
      onError: Colors.white,

      surface: AppColors.cardBackground,
      onSurface: AppColors.primaryText,

      outline: AppColors.borderColor,
    ),

    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.pageBackground,
    cardColor: AppColors.cardBackground,
    dividerColor: AppColors.dividerColor,

    // ---------------------------------------------------------------------------
    // TYPOGRAPHY
    // ---------------------------------------------------------------------------
    textTheme: GoogleFonts.interTextTheme(
      const TextTheme(
        // 28px / 700
        displayLarge: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w700,
          height: 34 / 28,
          color: AppColors.primaryText,
        ),

        // 22px / 700
        titleLarge: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w700,
          height: 28 / 22,
          color: AppColors.primaryText,
        ),

        // 18px / 600
        titleMedium: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          height: 24 / 18,
          color: AppColors.primaryText,
        ),

        // 16px / 600
        titleSmall: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          height: 22 / 16,
          color: AppColors.primaryText,
        ),

        // 14px / 400
        bodyMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          height: 20 / 14,
          color: AppColors.primaryText,
        ),

        // 12px / 400
        bodySmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          height: 16 / 12,
          color: AppColors.secondaryText,
        ),

        // 11px / 600
        labelSmall: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          height: 16 / 11,
          color: AppColors.secondaryText,
        ),
      ),
    ),

    // ---------------------------------------------------------------------------
    // APP BAR
    // ---------------------------------------------------------------------------
    appBarTheme: const AppBarTheme(
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: AppColors.cardBackground,
      foregroundColor: AppColors.primaryText,
      centerTitle: false,
      toolbarHeight: 56,
      titleTextStyle: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w700,
        color: AppColors.primaryText,
      ),
      iconTheme: IconThemeData(
        size: 24,
        color: AppColors.primaryText,
      ),
    ),

    // ---------------------------------------------------------------------------
    // CARDS
    // ---------------------------------------------------------------------------
    cardTheme: CardThemeData(
      color: AppColors.cardBackground,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(
          color: AppColors.borderColor,
          width: 1,
        ),
      ),
    ),

    // ---------------------------------------------------------------------------
    // DIVIDERS
    // ---------------------------------------------------------------------------
    dividerTheme: const DividerThemeData(
      color: AppColors.dividerColor,
      thickness: 1,
      space: 1,
    ),

    // ---------------------------------------------------------------------------
    // PRIMARY BUTTON
    // ---------------------------------------------------------------------------
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
        disabledBackgroundColor: AppColors.disabledBackground,
        disabledForegroundColor: AppColors.disabledText,

        minimumSize: const Size(double.infinity, 48),
        elevation: 0,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),

        textStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),

    // ---------------------------------------------------------------------------
    // SECONDARY / OUTLINED BUTTON
    // ---------------------------------------------------------------------------
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.primaryColor,
        disabledForegroundColor: AppColors.disabledText,

        minimumSize: const Size(double.infinity, 48),

        side: const BorderSide(
          color: AppColors.primaryColor,
          width: 1,
        ),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),

        textStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),

    // ---------------------------------------------------------------------------
    // TEXT BUTTON
    // ---------------------------------------------------------------------------
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primaryColor,
        disabledForegroundColor: AppColors.disabledText,

        minimumSize: const Size(44, 44),

        textStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),

    // ---------------------------------------------------------------------------
    // INPUT FIELDS
    // ---------------------------------------------------------------------------
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.cardBackground,

      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 14,
      ),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: AppColors.borderColor,
        ),
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: AppColors.borderColor,
        ),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: AppColors.primaryColor,
          width: 1.5,
        ),
      ),

      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: AppColors.accentRed,
        ),
      ),

      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: AppColors.accentRed,
          width: 1.5,
        ),
      ),

      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: AppColors.disabledBackground,
        ),
      ),

      labelStyle: const TextStyle(
        fontSize: 14,
        color: AppColors.secondaryText,
      ),

      floatingLabelStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppColors.primaryColor,
      ),

      hintStyle: const TextStyle(
        fontSize: 14,
        color: AppColors.mutedText,
      ),

      errorStyle: const TextStyle(
        fontSize: 12,
        color: AppColors.accentRed,
      ),
    ),

    // ---------------------------------------------------------------------------
    // ICONS
    // ---------------------------------------------------------------------------
    iconTheme: const IconThemeData(
      color: AppColors.secondaryText,
      size: 22,
    ),

    // ---------------------------------------------------------------------------
    // BOTTOM NAVIGATION
    // ---------------------------------------------------------------------------
    navigationBarTheme: NavigationBarThemeData(
      height: 68,
      backgroundColor: AppColors.cardBackground,
      elevation: 0,

      indicatorColor: AppColors.primaryLight,

      labelTextStyle: WidgetStateProperty.resolveWith(
            (states) {
          if (states.contains(WidgetState.selected)) {
            return const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: AppColors.primaryColor,
            );
          }

          return const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w400,
            color: AppColors.mutedText,
          );
        },
      ),

      iconTheme: WidgetStateProperty.resolveWith(
            (states) {
          if (states.contains(WidgetState.selected)) {
            return const IconThemeData(
              size: 24,
              color: AppColors.primaryColor,
            );
          }

          return const IconThemeData(
            size: 24,
            color: AppColors.secondaryText,
          );
        },
      ),
    ),

    // ---------------------------------------------------------------------------
    // CHECKBOX
    // ---------------------------------------------------------------------------
    checkboxTheme: CheckboxThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      side: const BorderSide(
        color: AppColors.borderColor,
      ),
      fillColor: WidgetStateProperty.resolveWith(
            (states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.primaryColor;
          }

          return Colors.transparent;
        },
      ),
    ),

    // ---------------------------------------------------------------------------
    // PROGRESS INDICATOR
    // ---------------------------------------------------------------------------
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.primaryColor,
    ),

    // ---------------------------------------------------------------------------
    // SNACKBAR
    // ---------------------------------------------------------------------------
    snackBarTheme: SnackBarThemeData(
      backgroundColor: AppColors.primaryText,
      contentTextStyle: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      behavior: SnackBarBehavior.floating,
    ),

    // ---------------------------------------------------------------------------
    // BOTTOM SHEET
    // ---------------------------------------------------------------------------
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: AppColors.cardBackground,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
    ),
  );
}