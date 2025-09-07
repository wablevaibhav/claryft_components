import 'package:claryft_components/claryft_components.dart';
import 'package:flutter/material.dart';

enum LabelType { success, error, info, warning, custom }

class StatusLabel extends StatelessWidget {
  final String text;
  final LabelType type;
  final Color? backgroundColor;
  final Color? textColor;
  final IconData? icon;
  final EdgeInsetsGeometry padding;

  const StatusLabel({
    super.key,
    required this.text,
    this.type = LabelType.info,
    this.backgroundColor,
    this.textColor,
    this.icon,
    this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
  });

  @override
  Widget build(BuildContext context) {
    final Map<LabelType, Color> defaultBgColors = {
      LabelType.success: AppColors.successColor.withValues(alpha: 0.1),
      LabelType.error: AppColors.errorColor.withValues(alpha: 0.1),
      LabelType.info: AppColors.infoColor.withValues(alpha: 0.1),
      LabelType.warning: AppColors.warningColor.withValues(alpha: 0.1),
      LabelType.custom: AppColors.greyColor.withValues(alpha: 0.1),
    };

    final Map<LabelType, Color> defaultTextColors = {
      LabelType.success: AppColors.successColor.withValues(alpha: 0.8),
      LabelType.error: AppColors.errorColor.withValues(alpha: 0.8),
      LabelType.info: AppColors.infoColor.withValues(alpha: 0.8),
      LabelType.warning: AppColors.warningColor.withValues(alpha: 0.8),
      LabelType.custom: AppColors.greyColor.withValues(alpha: 0.8),
    };

    final bg = backgroundColor ?? defaultBgColors[type]!;
    final fg = textColor ?? defaultTextColors[type]!;

    return Container(
      key: key?.withSuffix("container"),
      padding: padding,
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(16)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[Icon(icon, color: fg, size: 14), const Gap(4)],
          Text(
            key: key?.withSuffix("text"),
            text,
            style: AppTypography.hint.copyWith(color: fg, fontWeight: FontWeight.w500),
          ).withSemantics(),
        ],
      ),
    );
  }
}
