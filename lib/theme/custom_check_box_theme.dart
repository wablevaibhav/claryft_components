import 'package:claryft_components/claryft_components.dart';
import 'package:flutter/material.dart';

class CustomCheckBoxTheme {
  CustomCheckBoxTheme._();

  // Light Custom CheckBox Theme
  static CheckboxThemeData lightCustomCheckBoxTheme = CheckboxThemeData(
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return AppColors.primaryColor;
      }
      return Colors.transparent;
    }),
    checkColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return AppColors.whiteColor;
      }
      return AppColors.blackColor;
    }),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
  );

  // Dark Custom CheckBox Theme
  static CheckboxThemeData darkCustomCheckBoxTheme = CheckboxThemeData(
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return AppColors.primaryColor;
      }
      return Colors.transparent;
    }),
    checkColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return AppColors.whiteColor;
      }
      return AppColors.blackColor;
    }),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
  );
}
