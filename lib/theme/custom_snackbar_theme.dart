import 'package:claryft_components/claryft_components.dart';
import 'package:flutter/material.dart';

class CustomSnackbarTheme {
  CustomSnackbarTheme._();

  // Light Snackbar Theme
  static final lightSnackbarTheme = SnackBarThemeData(
    backgroundColor: AppColors.whiteColor.withValues(alpha: 0.8),
    contentTextStyle: CustomTextTheme.lightTextTheme.bodyMedium,
    actionTextColor: AppColors.primaryColor,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    behavior: SnackBarBehavior.floating,
  );

  // Dark Snackbar Theme
  static final darkSnackbarTheme = SnackBarThemeData(
    backgroundColor: AppColors.blackColor.withValues(alpha: 0.8),
    contentTextStyle: CustomTextTheme.darkTextTheme.bodyMedium?.copyWith(color: AppColors.blackColor),
    actionTextColor: AppColors.primaryColor,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    behavior: SnackBarBehavior.floating,
  );
}
