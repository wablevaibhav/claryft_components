import 'package:claryft_components/claryft_components.dart';
import 'package:flutter/material.dart';

class CustomRadioTheme {
  CustomRadioTheme._();

  // Light Theme
  static RadioThemeData lightRadioTheme = RadioThemeData(
    fillColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
      if (states.contains(WidgetState.selected)) {
        return AppColors.primaryColor;
      }
      return AppColors.greyColor.withValues(alpha: 0.7);
    }),
  );

  // Dark Theme
  static RadioThemeData darkRadioTheme = RadioThemeData(
    fillColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
      if (states.contains(WidgetState.selected)) {
        return AppColors.primaryColor;
      }
      return AppColors.greyColor.withValues(alpha: 0.7);
    }),
  );
}
