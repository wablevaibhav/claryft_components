import 'package:flutter/material.dart';

class AppSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color? activeColor;
  final Color? inactiveThumbColor;
  final Color? inactiveTrackColor;

  const AppSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    this.activeColor,
    this.inactiveThumbColor,
    this.inactiveTrackColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 20,
      height: 20,
      child: Switch(
        value: value,
        onChanged: onChanged,
        activeColor: activeColor ?? Theme.of(context).colorScheme.primary,
        inactiveThumbColor: inactiveThumbColor ?? Colors.grey,
        inactiveTrackColor: inactiveTrackColor ?? Colors.grey.shade300,
      ),
    );
  }
}
