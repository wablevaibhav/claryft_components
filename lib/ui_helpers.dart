import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';

class UIHelpers {
  static hideKeyBoard() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  static const Widget tinySpace = Gap(5.0);
  static const Widget smallSpace = Gap(10.0);
  static const Widget regularSpace = Gap(15.0);
  static const Widget smallRegularSpace = Gap(20.0);
  static const Widget mediumSpace = Gap(30.0);
  static const Widget largeSpace = Gap(35.0);

  static const EdgeInsets paddingTiny = EdgeInsets.all(5.0);
  static const EdgeInsets paddingSmall = EdgeInsets.all(10.0);
  static const EdgeInsets paddingRegular = EdgeInsets.all(15.0);
  static const EdgeInsets paddingMedium = EdgeInsets.all(20.0);
  static const EdgeInsets paddingLarge = EdgeInsets.all(30.0);

  static const EdgeInsets marginTiny = EdgeInsets.all(5.0);
  static const EdgeInsets marginSmall = EdgeInsets.all(10.0);
  static const EdgeInsets marginRegular = EdgeInsets.all(15.0);
  static const EdgeInsets marginMedium = EdgeInsets.all(20.0);
  static const EdgeInsets marginLarge = EdgeInsets.all(30.0);

  static const Widget verticalDividerSmall = Divider(height: 10.0, color: Colors.grey);
  static const Widget verticalDividerRegular = Divider(height: 15.0, color: Colors.grey);
  static const Widget verticalDividerMedium = Divider(height: 30.0, color: Colors.grey);
  static const Widget horizontalDivider = VerticalDivider(width: 1.0, color: Colors.grey);

  static Widget verticalDivider(double height) => Divider(height: height, color: Colors.grey);
  static Widget horizontalDividerDynamic(double width) => VerticalDivider(width: width, color: Colors.grey);

  static double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
  static double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

  static double screenHeightPercentage(BuildContext context, {double percentage = 1}) => screenHeight(context) * percentage;

  static double screenWidthPercentage(BuildContext context, {double percentage = 1}) => screenWidth(context) * percentage;

  static double screenHeightFraction(BuildContext context, {int dividedBy = 1, double offsetBy = 0}) =>
      (screenHeight(context) - offsetBy) / dividedBy;

  static double screenWidthFraction(BuildContext context, {int dividedBy = 1, double offsetBy = 0}) =>
      (screenWidth(context) - offsetBy) / dividedBy;

  static double halfScreenWidth(BuildContext context) => screenWidthFraction(context, dividedBy: 2);
  static double halfScreenHeight(BuildContext context) => screenHeightFraction(context, dividedBy: 2);
  static double thirdScreenWidth(BuildContext context) => screenWidthFraction(context, dividedBy: 3);

  static double getResponsiveFontSize(BuildContext context, {double? fontSize, double? max}) {
    max ??= 100;
    var responsiveSize = min(screenWidthFraction(context, dividedBy: 10) * ((fontSize ?? 100) / 100), max);
    return responsiveSize;
  }
}
