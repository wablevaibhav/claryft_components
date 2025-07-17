import 'package:claryft_components/claryft_components.dart';
import 'package:flutter/material.dart';

class CustomTheme {
  CustomTheme._();

  // Light Theme
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: AppColors.primaryColor,
    disabledColor: AppColors.greyColor,
    dividerColor: AppColors.greyColor.withValues(alpha: 0.7),
    scaffoldBackgroundColor: AppColors.whiteColor,
    cardColor: AppColors.cardColor,
    textTheme: CustomTextTheme.lightTextTheme,
    primaryTextTheme: CustomTextTheme.lightTextTheme,
    elevatedButtonTheme: CustomElevatedButtonTheme.lightElevatedButtonTheme,
    appBarTheme: CustomAppBarTheme.lightAppBarTheme,
    bottomSheetTheme: CustomBottomSheetTheme.lightBottomSheetTheme,
    checkboxTheme: CustomCheckBoxTheme.lightCustomCheckBoxTheme,
    outlinedButtonTheme: CustomOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: CustomTextFieldTheme.lightInputDecorationTheme,
    cardTheme: CustomCardTheme.lightCardTheme,
    textButtonTheme: CustomTextButtonTheme.lightTextButtonTheme,
    expansionTileTheme: CustomExpansionTileTheme.lightExpansionTileTheme,
    tooltipTheme: CustomTooltipTheme.lightTooltipTheme,
    dividerTheme: DividerThemeData(color: AppColors.greyColor.withValues(alpha: 0.6), thickness: 1, space: 0),
    listTileTheme: CustomListTileTheme.lightListTileTheme,
    navigationBarTheme: CustomNavigationBarTheme.lightNavigationBarTheme,
    bottomNavigationBarTheme: CustomBottomNavigationTheme.lightBottomNavigationBarTheme,
    progressIndicatorTheme: CustomProgressIndicatorTheme.lightProgressIndicatorTheme,
    iconTheme: IconThemeData(color: AppColors.primaryColor),
    snackBarTheme: CustomSnackbarTheme.lightSnackbarTheme,
    tabBarTheme: CustomTabBarTheme.lightTabBarTheme,
    popupMenuTheme: CustomPopupMenuTheme.lightPopupMenuTheme,
    dialogTheme: CustomDialogTheme.lightDialogTheme,
    radioTheme: CustomRadioTheme.lightRadioTheme,
  );

  // Dark Theme
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.blackColor,
    cardColor: AppColors.blackColor,
    textTheme: CustomTextTheme.darkTextTheme,
    primaryTextTheme: CustomTextTheme.darkTextTheme,
    elevatedButtonTheme: CustomElevatedButtonTheme.darkElevatedButtonTheme,
    appBarTheme: CustomAppBarTheme.darkAppBarTheme,
    bottomSheetTheme: CustomBottomSheetTheme.darkBottomSheetTheme,
    checkboxTheme: CustomCheckBoxTheme.darkCustomCheckBoxTheme,
    outlinedButtonTheme: CustomOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: CustomTextFieldTheme.darkInputDecorationTheme,
    cardTheme: CustomCardTheme.darkCardTheme,
    textButtonTheme: CustomTextButtonTheme.darkTextButtonTheme,
    expansionTileTheme: CustomExpansionTileTheme.darkExpansionTileTheme,
    tooltipTheme: CustomTooltipTheme.darkTooltipTheme,
    dividerTheme: DividerThemeData(color: AppColors.greyColor.withValues(alpha: 0.6), thickness: 1, space: 0),
    listTileTheme: CustomListTileTheme.darkListTileTheme,
    navigationBarTheme: CustomNavigationBarTheme.darkNavigationBarTheme,
    bottomNavigationBarTheme: CustomBottomNavigationTheme.darkBottomNavigationBarTheme,
    progressIndicatorTheme: CustomProgressIndicatorTheme.darkProgressIndicatorTheme,
    iconTheme: IconThemeData(color: AppColors.primaryColor),
    snackBarTheme: CustomSnackbarTheme.darkSnackbarTheme,
    tabBarTheme: CustomTabBarTheme.darkTabBarTheme,
    popupMenuTheme: CustomPopupMenuTheme.darkPopupMenuTheme,
    dialogTheme: CustomDialogTheme.darkDialogTheme,
    radioTheme: CustomRadioTheme.darkRadioTheme,
  );
}
