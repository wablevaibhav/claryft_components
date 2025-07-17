import 'package:claryft_components/claryft_components.dart';
import 'package:flutter/material.dart';

class CustomProgressIndicatorTheme {
  CustomProgressIndicatorTheme._();

  // Light Progress Indicator Theme
  static ProgressIndicatorThemeData lightProgressIndicatorTheme = ProgressIndicatorThemeData(
    color: AppColors.primaryColor,
    circularTrackColor: AppColors.greyColor.withValues(alpha: 0.3),
    linearTrackColor: AppColors.greyColor.withValues(alpha: 0.3),
  );

  // Dark Progress Indicator Theme
  static ProgressIndicatorThemeData darkProgressIndicatorTheme = ProgressIndicatorThemeData(
    color: AppColors.primaryColor,
    circularTrackColor: AppColors.greyColor.withValues(alpha: 0.3),
    linearTrackColor: AppColors.greyColor.withValues(alpha: 0.3),
  );
}
