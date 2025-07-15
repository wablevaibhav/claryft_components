import 'package:claryft_components/claryft_components.dart';
import 'package:flutter/material.dart';

class ClaryftSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color? activeColor;
  final Color? inactiveThumbColor;
  final Color? inactiveTrackColor;
  final double? height;
  final double? width;

  const ClaryftSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    this.activeColor,
    this.inactiveThumbColor,
    this.inactiveTrackColor,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 20,
      height: height ?? 18,
      child: Switch(
        value: value,
        onChanged: onChanged,
        activeColor: activeColor ?? AppColors.successColor,
        inactiveThumbColor: inactiveThumbColor ?? AppColors.greyColor,
        inactiveTrackColor: inactiveTrackColor ?? AppColors.darkGreyColor,
      ),
    );
  }
}
