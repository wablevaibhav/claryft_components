import 'package:claryft_components/app_colors.dart';
import 'package:claryft_components/theme/custom_text_theme.dart';
import 'package:flutter/material.dart';

class CustomTextButtonTheme {
  CustomTextButtonTheme._();

  // Light Text Button Theme
  static TextButtonThemeData lightTextButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColors.primaryColor,
      backgroundColor: AppColors.whiteColor,
      textStyle: CustomTextTheme.lightTextTheme.labelLarge,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      iconColor: AppColors.primaryColor,
      iconSize: 24,
    ),
  );

  // Dark Text Button Theme
  static TextButtonThemeData darkTextButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColors.primaryColor,
      backgroundColor: AppColors.blackColor,
      textStyle: CustomTextTheme.darkTextTheme.labelLarge,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      iconColor: AppColors.primaryColor,
      iconSize: 24,
    ),
  );
}
