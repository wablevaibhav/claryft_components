import 'package:claryft_components/claryft_components.dart';
import 'package:flutter/material.dart';

class CustomOutlinedButtonTheme {
  CustomOutlinedButtonTheme._();

  // Light Outlined Button Theme
  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: AppColors.blackColor,
      side: BorderSide(color: AppColors.primaryColor),
      textStyle: GoogleFonts.inter(fontSize: 16),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    ),
  );

  // Dark Outlined Button Theme
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: AppColors.whiteColor,
      side: const BorderSide(color: AppColors.primaryColor),
      textStyle: GoogleFonts.inter(fontSize: 16),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    ),
  );
}
