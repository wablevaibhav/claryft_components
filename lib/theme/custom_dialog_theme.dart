import 'package:claryft_components/claryft_components.dart';
import 'package:flutter/material.dart';

class CustomDialogTheme {
  CustomDialogTheme._();

  // Light Theme
  static DialogTheme lightDialogTheme = DialogTheme(
    backgroundColor: AppColors.whiteColor,
    titleTextStyle: CustomTextTheme.lightTextTheme.titleLarge?.copyWith(color: AppColors.blackColor),
    contentTextStyle: CustomTextTheme.lightTextTheme.bodyMedium?.copyWith(color: AppColors.blackColor),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  );

  // Dark Theme
  static DialogTheme darkDialogTheme = DialogTheme(
    backgroundColor: AppColors.blackColor,
    titleTextStyle: CustomTextTheme.darkTextTheme.titleLarge?.copyWith(color: AppColors.whiteColor),
    contentTextStyle: CustomTextTheme.darkTextTheme.bodyMedium?.copyWith(color: AppColors.whiteColor),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  );
}
