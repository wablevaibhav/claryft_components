import 'package:claryft_components/claryft_components.dart';
import 'package:flutter/material.dart';

class CustomTooltipTheme {
  CustomTooltipTheme._();

  // Light Tooltip Theme
  static TooltipThemeData lightTooltipTheme = TooltipThemeData(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    decoration: BoxDecoration(color: AppColors.blackColor.withValues(alpha: 0.9), borderRadius: BorderRadius.circular(4)),
    textStyle: CustomTextTheme.lightTextTheme.bodyMedium?.copyWith(color: AppColors.whiteColor),
    verticalOffset: 16,
    preferBelow: true,
  );

  // Dark Tooltip Theme
  static TooltipThemeData darkTooltipTheme = TooltipThemeData(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    verticalOffset: 16,
    preferBelow: true,
    decoration: BoxDecoration(color: AppColors.greyColor.withValues(alpha: 0.9), borderRadius: BorderRadius.circular(4)),
    textStyle: CustomTextTheme.darkTextTheme.bodyMedium?.copyWith(color: AppColors.whiteColor),
  );
}
