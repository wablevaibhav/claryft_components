import 'package:claryft_components/claryft_components.dart';
import 'package:flutter/material.dart';

class CustomTabBarTheme {
  CustomTabBarTheme._();

  // Light Tab Bar Theme
  static TabBarThemeData lightTabBarTheme = TabBarThemeData(
    labelColor: AppColors.primaryColor,
    unselectedLabelColor: AppColors.greyColor,
    indicatorColor: AppColors.primaryColor,
  );

  // Dark Tab Bar Theme
  static TabBarThemeData darkTabBarTheme = TabBarThemeData(
    labelColor: AppColors.primaryColor,
    unselectedLabelColor: AppColors.greyColor.withValues(alpha: 0.7),
    indicatorColor: AppColors.primaryColor,
  );
}
