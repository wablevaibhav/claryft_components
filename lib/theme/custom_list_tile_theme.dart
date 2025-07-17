import 'package:claryft_components/claryft_components.dart';
import 'package:flutter/material.dart';

class CustomListTileTheme {
  CustomListTileTheme._();

  // Light ListTile Theme
  static ListTileThemeData lightListTileTheme = ListTileThemeData(
    textColor: AppColors.blackColor,
    iconColor: AppColors.primaryColor,
    tileColor: AppColors.cardColor,
    selectedColor: AppColors.primaryColor,
    style: ListTileStyle.list,
    selectedTileColor: AppColors.cardColor.withValues(alpha: 0.1),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    minLeadingWidth: 0,
    minVerticalPadding: 8,
    horizontalTitleGap: 8,
    dense: true,
    visualDensity: VisualDensity.compact,
  );

  // Dark ListTile Theme
  static ListTileThemeData darkListTileTheme = ListTileThemeData(
    textColor: AppColors.whiteColor,
    iconColor: AppColors.primaryColor,
    tileColor: AppColors.cardColor,
    selectedColor: AppColors.primaryColor,
    style: ListTileStyle.list,
    selectedTileColor: AppColors.cardColor.withValues(alpha: 0.1),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    minLeadingWidth: 0,
    minVerticalPadding: 8,
    horizontalTitleGap: 8,
    dense: true,
    visualDensity: VisualDensity.compact,
  );
}
