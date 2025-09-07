import 'package:claryft_components/claryft_components.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final String? loadingText;
  final TextStyle? titleStyle;
  final TextStyle? loadingTextStyle;
  final VoidCallback? onPressed;
  final EdgeInsets? padding;
  final bool loading;
  final bool outlined;
  final bool disabled;
  final Color? color;
  final Color? textColor;
  final Color? disabledColor;
  final Color? disabledTextColor;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final double? height;
  final double? width;

  const AppButton({
    super.key,
    required this.text,
    this.loadingText,
    required this.onPressed,
    this.loading = false,
    this.outlined = false,
    this.disabled = false,
    this.color,
    this.textColor,
    this.disabledColor,
    this.disabledTextColor,
    this.prefixIcon,
    this.suffixIcon,
    this.height,
    this.width,
    this.loadingTextStyle,
    this.titleStyle,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveOnTap = (disabled || loading) ? null : onPressed;
    final baseColor = color ?? AppColors.primaryColor;

    final effectiveTextColor =
        disabled
            ? disabledTextColor ?? (outlined ? AppColors.greyColor : AppColors.whiteColor)
            : textColor ?? (outlined ? baseColor : AppColors.whiteColor);

    Widget buildLoadingContent() {
      final loader = SizedBox(
        width: 16,
        height: 16,
        child:
            CircularProgressIndicator(
              key: key?.withSuffix("loading_indicator"),
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(effectiveTextColor),
            ).withSemantics(),
      );

      if (loadingText != null && loadingText!.isNotEmpty) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            loader,
            UIHelpers.tinySpace,
            Text(
              key: key?.withSuffix("loading_text"),
              loadingText!,
              style: loadingTextStyle ?? AppTypography.hint.copyWith(color: effectiveTextColor, fontWeight: FontWeight.w400),
            ).withSemantics(),
          ],
        );
      }
      return loader;
    }

    Widget buildContent() {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (prefixIcon != null) ...[prefixIcon!, UIHelpers.tinySpace],
          Text(
            key: key?.withSuffix("text"),
            text,
            style: titleStyle ?? AppTypography.hint.copyWith(color: effectiveTextColor, fontWeight: FontWeight.w600),
          ).withSemantics(),
          if (suffixIcon != null) ...[UIHelpers.tinySpace, suffixIcon!],
        ],
      );
    }

    final child = loading ? buildLoadingContent() : buildContent();

    final ButtonStyle style = ButtonStyle(
      minimumSize: WidgetStateProperty.all(Size(width ?? 64, height ?? 44)),
      padding: WidgetStateProperty.all(padding ?? const EdgeInsets.symmetric(horizontal: 14, vertical: 12)),
      foregroundColor: WidgetStateProperty.all(effectiveTextColor),
      backgroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
        if (outlined) return AppColors.transparentColor;
        if (disabled) return disabledColor ?? AppColors.greyColor;
        return baseColor;
      }),
      side:
          outlined
              ? WidgetStateProperty.all(
                BorderSide(color: disabled ? (disabledColor ?? AppColors.greyColor) : baseColor, width: 1),
              )
              : null,
      shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
    );

    final button =
        outlined
            ? OutlinedButton(key: key?.withSuffix("outlined_button"), onPressed: effectiveOnTap, style: style, child: child)
            : ElevatedButton(key: key?.withSuffix("elevated_button"), onPressed: effectiveOnTap, style: style, child: child);

    return button.withSemantics();
  }
}
