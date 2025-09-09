import 'package:claryft_components/claryft_components.dart';
import 'package:flutter/material.dart';

class ClaryftFailureWidget extends StatelessWidget {
  final VoidCallback? onTap;
  final String title;
  final String message;
  final TextStyle? titleStyle;
  final TextStyle? messageStyle;
  final IconData icon;
  final EdgeInsets padding;
  final double borderRadius;

  const ClaryftFailureWidget({
    super.key,
    this.onTap,
    this.title = "Oops!",
    this.message = "There was an error retrieving this resource. Tap to try again.",
    this.titleStyle,
    this.messageStyle,
    this.icon = Icons.error_outline,
    this.padding = const EdgeInsets.all(16),
    this.borderRadius = 8,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      key: key?.withSuffix("inkwell"),
      onTap: onTap,
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.errorColor.withValues(alpha: 0.8),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        padding: padding,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(key: key?.withSuffix("icon"), icon, color: AppColors.whiteColor).withSemantics(),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    key: key?.withSuffix("title"),
                    title,
                    style: titleStyle ?? AppTypography.hint.copyWith(color: AppColors.whiteColor, fontWeight: FontWeight.bold),
                  ).withSemantics(),
                  const SizedBox(height: 4),
                  Text(
                    key: key?.withSuffix("message"),
                    message,
                    style: messageStyle ?? AppTypography.small.copyWith(color: AppColors.whiteColor, overflow: TextOverflow.clip),
                  ).withSemantics(),
                ],
              ),
            ),
          ],
        ),
      ),
    ).withSemantics();
  }
}
