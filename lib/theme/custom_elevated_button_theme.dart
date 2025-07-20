import 'package:claryft_components/claryft_components.dart';
import 'package:flutter/material.dart';

class CustomElevatedButtonTheme {
  CustomElevatedButtonTheme._();

  // Light Elevated Button Theme
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      backgroundColor: AppColors.primaryColor,
      foregroundColor: AppColors.whiteColor,
      disabledBackgroundColor: AppColors.greyColor,
      disabledForegroundColor: AppColors.greyColor,
      side: const BorderSide(color: AppColors.primaryColor),
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 24),
      textStyle: GoogleFonts.inter(fontSize: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );

  // Dark Elevated Button Theme
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      backgroundColor: AppColors.primaryColor,
      foregroundColor: AppColors.whiteColor,
      disabledBackgroundColor: AppColors.greyColor,
      disabledForegroundColor: AppColors.greyColor,
      side: const BorderSide(color: AppColors.primaryColor),
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 24),
      textStyle: GoogleFonts.inter(fontSize: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );
}
