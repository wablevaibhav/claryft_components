import 'package:claryft_components/claryft_components.dart';
import 'package:flutter/material.dart';

class EmptyStateWidget extends StatelessWidget {
  final Widget? icon;
  final String message;
  final String? buttonText;
  final VoidCallback? onButtonPressed;

  const EmptyStateWidget({super.key, this.icon, required this.message, this.buttonText, this.onButtonPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon ?? Icon(Icons.error_outline_outlined),
          UIHelpers.smallSpace,
          Text(message, textAlign: TextAlign.center, style: AppTypography.small.copyWith(color: AppColors.blackColor)),
          if (buttonText != null && onButtonPressed != null) ...[
            UIHelpers.smallSpace,
            AppButton(onPressed: onButtonPressed, text: buttonText ?? ""),
          ],
        ],
      ),
    );
  }
}
