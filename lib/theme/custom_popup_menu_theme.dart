import 'package:claryft_components/claryft_components.dart';
import 'package:flutter/material.dart';

class CustomPopupMenuTheme {
  CustomPopupMenuTheme._();

  // Light Theme
  static PopupMenuThemeData lightPopupMenuTheme = PopupMenuThemeData(
    color: AppColors.whiteColor,
    textStyle: CustomTextTheme.lightTextTheme.displaySmall?.copyWith(color: AppColors.blackColor),
    //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    // elevation: 4.0,
    //enableFeedback: true,
    shadowColor: AppColors.shadowColor.withValues(alpha: 0.2),
    surfaceTintColor: AppColors.whiteColor.withValues(alpha: 0.8),
    position: PopupMenuPosition.under,
    labelTextStyle: WidgetStatePropertyAll(
      GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: AppColors.blackColor,
      ).copyWith(color: AppColors.blackColor),
    ),
  );

  static PopupMenuThemeData darkPopupMenuTheme = PopupMenuThemeData(
    color: AppColors.blackColor,
    textStyle: CustomTextTheme.darkTextTheme.bodyMedium?.copyWith(color: AppColors.whiteColor),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    elevation: 4.0,
    enableFeedback: true,
    shadowColor: AppColors.shadowColor.withValues(alpha: 0.2),
    surfaceTintColor: AppColors.blackColor.withValues(alpha: 0.8),
    position: PopupMenuPosition.under,
    labelTextStyle: WidgetStatePropertyAll(CustomTextTheme.darkTextTheme.bodyMedium?.copyWith(color: AppColors.whiteColor)),
  );
}
