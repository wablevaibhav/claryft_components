import 'package:claryft_components/app_colors.dart';
import 'package:flutter/material.dart';

class AppTooltip extends StatelessWidget {
  final Widget child;
  final String message;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final double? verticalOffset;
  final bool? preferBelow;

  const AppTooltip({
    super.key,
    required this.child,
    required this.message,
    this.textStyle,
    this.backgroundColor,
    this.padding,
    this.verticalOffset,
    this.preferBelow,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: message,
      textStyle: textStyle,
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.blackColor.withOpacity(0.9),
        borderRadius: BorderRadius.circular(4),
      ),
      padding:
          padding ?? const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      verticalOffset: verticalOffset ?? 16,
      preferBelow: preferBelow ?? true,
      child: child,
    );
  }
}
