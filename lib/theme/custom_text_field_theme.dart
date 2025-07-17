import 'package:claryft_components/claryft_components.dart';
import 'package:flutter/material.dart';

class CustomTextFieldTheme {
  CustomTextFieldTheme._();

  // Light Text Field Theme
  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    focusColor: AppColors.primaryColor,
    prefixIconColor: AppColors.greyColor,
    suffixIconColor: AppColors.greyColor,
    labelStyle: CustomTextTheme.lightTextTheme.bodyMedium?.copyWith(
      fontSize: 14,
      color: AppColors.blackColor.withValues(alpha: 0.8),
    ),
    hintStyle: CustomTextTheme.lightTextTheme.bodyMedium?.copyWith(fontSize: 14, color: AppColors.greyColor),
    errorStyle: CustomTextTheme.lightTextTheme.bodyMedium?.copyWith(fontSize: 12, color: AppColors.errorColor),
    floatingLabelStyle: GoogleFonts.inter(color: AppColors.blackColor.withValues(alpha: 0.8)),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(color: AppColors.greyColor, width: 1),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(color: Colors.black12, width: 1),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(color: AppColors.greyColor, width: 1),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(color: AppColors.errorColor, width: 1),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(color: AppColors.warningColor, width: 1),
    ),
  );

  // Dark Text Field Theme
  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: AppColors.greyColor,
    suffixIconColor: AppColors.greyColor,
    labelStyle: CustomTextTheme.darkTextTheme.bodyMedium?.copyWith(
      fontSize: 14,
      color: AppColors.whiteColor.withValues(alpha: 0.8),
    ),
    hintStyle: CustomTextTheme.darkTextTheme.bodyMedium?.copyWith(fontSize: 14, color: AppColors.greyColor),
    errorStyle: CustomTextTheme.darkTextTheme.bodyMedium?.copyWith(fontSize: 12, color: AppColors.errorColor),
    floatingLabelStyle: CustomTextTheme.darkTextTheme.bodyMedium?.copyWith(
      fontSize: 14,
      color: AppColors.whiteColor.withValues(alpha: 0.8),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(color: AppColors.greyColor, width: 1),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(color: Colors.white12, width: 1),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(color: AppColors.greyColor, width: 1),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(color: AppColors.errorColor, width: 1),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(color: AppColors.warningColor, width: 1),
    ),
  );
}
