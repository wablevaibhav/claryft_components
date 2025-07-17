import 'package:claryft_components/claryft_components.dart';
import 'package:flutter/material.dart';

class CustomExpansionTileTheme {
  CustomExpansionTileTheme._();

  // Light Expansion Tile Theme
  static ExpansionTileThemeData lightExpansionTileTheme = ExpansionTileThemeData(
    iconColor: AppColors.primaryColor,
    textColor: AppColors.blackColor,
    backgroundColor: AppColors.cardColor,
    collapsedIconColor: AppColors.greyColor,
    collapsedTextColor: AppColors.greyColor,
  );

  // Dark Expansion Tile Theme
  static ExpansionTileThemeData darkExpansionTileTheme = ExpansionTileThemeData(
    iconColor: AppColors.primaryColor,
    textColor: AppColors.whiteColor,
    backgroundColor: AppColors.cardColor,
    collapsedIconColor: AppColors.greyColor,
    collapsedTextColor: AppColors.greyColor,
  );
}
