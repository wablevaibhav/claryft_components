import 'package:claryft_components/claryft_components.dart';
import 'package:flutter/material.dart';

class ClaryftEmptyWidget extends StatelessWidget {
  final String title;
  final String? description;
  final TextStyle? titleStyle;
  final TextStyle? descriptionStyle;
  final String? buttonText;
  final TextStyle? buttonTextStyle;
  final VoidCallback? onButtonPressed;
  final String? imageAsset;
  final double imageHeight;
  final double spacing;
  final EdgeInsets padding;
  final CrossAxisAlignment alignment;

  const ClaryftEmptyWidget({
    super.key,
    required this.title,
    this.description,
    this.titleStyle,
    this.descriptionStyle,
    this.buttonText,
    this.buttonTextStyle,
    this.onButtonPressed,
    this.imageAsset,
    this.imageHeight = 160,
    this.spacing = 12,
    this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
    this.alignment = CrossAxisAlignment.center,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: alignment,
          children: [
            if (imageAsset != null) ...[
              Image.asset(imageAsset!, key: key?.withSuffix("image"), height: imageHeight, fit: BoxFit.contain),
            ],
            Text(
              title,
              key: key?.withSuffix("title"),
              textAlign: TextAlign.center,
              style: titleStyle ?? AppTypography.normal.copyWith(color: AppColors.blackColor, fontWeight: FontWeight.w500),
            ).withSemantics(),
            if (description != null) ...[
              Text(
                description!,
                key: key?.withSuffix("description"),
                textAlign: TextAlign.center,
                style: descriptionStyle ?? AppTypography.small.copyWith(color: AppColors.greyColor),
              ).withSemantics(),
            ],
            if (buttonText != null && onButtonPressed != null) ...[
              Gap(spacing),
              AppButton(
                key: key?.withSuffix("button"),
                onPressed: onButtonPressed,
                text: buttonText ?? "Action",
                titleStyle: buttonTextStyle ?? AppTypography.small.copyWith(color: AppColors.whiteColor),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
