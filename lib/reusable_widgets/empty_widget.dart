import 'package:claryft_components/reusable_widgets/app_button.dart';
import 'package:claryft_components/ui_helpers.dart';
import 'package:flutter/material.dart';

class EmptyStateWidget extends StatelessWidget {
  final Widget icon;
  final String message;
  final String? buttonText;
  final VoidCallback? onButtonPressed;

  const EmptyStateWidget({
    super.key,
    required this.icon,
    required this.message,
    this.buttonText,
    this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          UIHelpers.regularSpace,
          Text(
            message,
            textAlign: TextAlign.center,
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(color: Colors.grey[600]),
          ),
          if (buttonText != null && onButtonPressed != null) ...[
            UIHelpers.regularSpace,
            ClaryftButton(onPressed: onButtonPressed, text: buttonText ?? ""),
          ],
        ],
      ),
    );
  }
}
