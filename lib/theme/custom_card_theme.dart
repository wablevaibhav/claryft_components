import 'package:claryft_components/claryft_components.dart';
import 'package:flutter/material.dart';

class CustomCardTheme {
  CustomCardTheme._();

  // Light Card Theme
  static CardTheme lightCardTheme = CardTheme(
    color: AppColors.cardColor,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
    shadowColor: AppColors.shadowColor,
    elevation: 4.0,
    margin: EdgeInsets.all(8.0),
  );

  // Dark Card Theme
  static CardTheme darkCardTheme = CardTheme(
    color: AppColors.blackColor,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
    shadowColor: AppColors.shadowColor,
    elevation: 4.0,
    margin: EdgeInsets.all(8.0),
  );
}
