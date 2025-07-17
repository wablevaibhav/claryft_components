import 'package:claryft_components/claryft_components.dart';
import 'package:flutter/material.dart';

class CustomTextTheme {
  CustomTextTheme._();

  // Light Text Theme
  static TextTheme lightTextTheme = TextTheme(
    displayLarge: GoogleFonts.inter(fontSize: 32, fontWeight: FontWeight.bold, color: AppColors.blackColor),
    displayMedium: GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.blackColor),
    displaySmall: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.blackColor),
    headlineLarge: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.blackColor),
    headlineMedium: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.blackColor),
    headlineSmall: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.blackColor),
    bodyLarge: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.normal, color: AppColors.blackColor),
    bodyMedium: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.normal, color: AppColors.blackColor),
    bodySmall: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.normal, color: AppColors.blackColor),
    titleLarge: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.blackColor),
    titleMedium: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.blackColor),
    titleSmall: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.blackColor),
    labelLarge: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.normal, color: AppColors.blackColor),
    labelMedium: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.normal, color: AppColors.blackColor),
    labelSmall: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.normal, color: AppColors.blackColor),
  );

  // Dark Text Theme
  static TextTheme darkTextTheme = TextTheme(
    displayLarge: GoogleFonts.inter(fontSize: 32, fontWeight: FontWeight.bold, color: AppColors.whiteColor),
    displayMedium: GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.whiteColor),
    displaySmall: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.whiteColor),
    headlineLarge: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.whiteColor),
    headlineMedium: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.whiteColor),
    headlineSmall: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.whiteColor),
    bodyLarge: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.normal, color: AppColors.whiteColor),
    bodyMedium: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.normal, color: AppColors.whiteColor),
    bodySmall: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.normal, color: AppColors.whiteColor),
    titleLarge: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.whiteColor),
    titleMedium: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.whiteColor),
    titleSmall: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.whiteColor),
    labelLarge: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.normal, color: AppColors.whiteColor),
    labelMedium: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.normal, color: AppColors.whiteColor),
    labelSmall: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.normal, color: AppColors.whiteColor),
  );
}
