import 'package:claryft_components/claryft_components.dart';
import 'package:flutter/material.dart';

class CustomNavigationBarTheme {
  CustomNavigationBarTheme._();

  // Light Navigation Bar Theme
  static NavigationBarThemeData lightNavigationBarTheme = NavigationBarThemeData(
    backgroundColor: AppColors.whiteColor,
    indicatorColor: AppColors.primaryColor,
    labelTextStyle: WidgetStateProperty.all(CustomTextTheme.lightTextTheme.bodyMedium?.copyWith(color: AppColors.blackColor)),
    iconTheme: WidgetStateProperty.all(IconThemeData(color: AppColors.primaryColor)),
    indicatorShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  );

  // Dark Navigation Bar Theme
  static NavigationBarThemeData darkNavigationBarTheme = NavigationBarThemeData(
    backgroundColor: AppColors.blackColor,
    indicatorColor: AppColors.primaryColor,
    labelTextStyle: WidgetStateProperty.all(CustomTextTheme.darkTextTheme.bodyMedium?.copyWith(color: AppColors.whiteColor)),
    iconTheme: WidgetStateProperty.all(IconThemeData(color: AppColors.primaryColor)),
    indicatorShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  );
}
