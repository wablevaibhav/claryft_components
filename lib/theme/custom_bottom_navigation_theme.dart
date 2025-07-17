import 'package:claryft_components/claryft_components.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationTheme {
  CustomBottomNavigationTheme._();

  // Light Bottom Navigation Theme
  static BottomNavigationBarThemeData lightBottomNavigationBarTheme = BottomNavigationBarThemeData(
    backgroundColor: AppColors.whiteColor,
    selectedItemColor: AppColors.primaryColor,
    unselectedItemColor: AppColors.greyColor,
    selectedLabelStyle: CustomTextTheme.lightTextTheme.bodyMedium?.copyWith(color: AppColors.blackColor),
    unselectedLabelStyle: CustomTextTheme.lightTextTheme.bodyMedium?.copyWith(color: AppColors.greyColor),
    type: BottomNavigationBarType.fixed,
    showUnselectedLabels: true,
    showSelectedLabels: true,
  );

  // Dark Bottom Navigation Theme
  static BottomNavigationBarThemeData darkBottomNavigationBarTheme = BottomNavigationBarThemeData(
    backgroundColor: AppColors.blackColor,
    selectedItemColor: AppColors.primaryColor,
    unselectedItemColor: AppColors.greyColor,
    selectedLabelStyle: CustomTextTheme.darkTextTheme.bodyMedium?.copyWith(color: AppColors.whiteColor),
    unselectedLabelStyle: CustomTextTheme.darkTextTheme.bodyMedium?.copyWith(color: AppColors.greyColor),
    type: BottomNavigationBarType.fixed,
    showUnselectedLabels: true,
    showSelectedLabels: true,
  );
}
