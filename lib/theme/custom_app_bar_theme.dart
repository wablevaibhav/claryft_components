import 'package:claryft_components/claryft_components.dart';
import 'package:flutter/material.dart';

class CustomAppBarTheme {
  CustomAppBarTheme._();

  // Dark App Bar Theme
  static final darkAppBarTheme = AppBarTheme(
    backgroundColor: AppColors.blackColor,
    surfaceTintColor: Colors.transparent,
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    iconTheme: IconThemeData(color: AppColors.blackColor, size: 24),
    actionsIconTheme: const IconThemeData(color: AppColors.whiteColor, size: 24),
    titleTextStyle: GoogleFonts.inter(fontSize: 18.0, color: AppColors.whiteColor, fontWeight: FontWeight.w600),
  );

  // Light AppBar Theme
  static final lightAppBarTheme = AppBarTheme(
    backgroundColor: AppColors.whiteColor,
    surfaceTintColor: AppColors.transparentColor,
    elevation: 0,
    scrolledUnderElevation: 0,
    centerTitle: false,
    iconTheme: IconThemeData(color: AppColors.blackColor, size: 24),
    actionsIconTheme: const IconThemeData(color: AppColors.blackColor, size: 24),
    titleTextStyle: GoogleFonts.inter(fontSize: 18.0, color: AppColors.blackColor, fontWeight: FontWeight.w600),
  );
}
