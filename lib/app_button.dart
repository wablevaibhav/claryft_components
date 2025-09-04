import 'package:claryft_components/claryft_components.dart';
import 'package:flutter/material.dart';

class AppButton extends StatefulWidget {
  final String text;
  final String? loadingText;
  final TextStyle? titleStyle;
  final TextStyle? loadingTextStyle;
  final void Function()? onPressed;
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
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  bool hovering = false;

  @override
  Widget build(BuildContext context) {
    final effectiveOnTap = (widget.disabled || widget.loading) ? null : widget.onPressed;

    final baseColor = widget.color ?? AppColors.primaryColor;

    final bgColor = () {
      if (widget.disabled) {
        return widget.outlined ? AppColors.transparentColor : widget.disabledColor ?? AppColors.greyColor;
      }
      if (hovering) {
        return darken(baseColor, 0.1);
      }
      return widget.outlined ? AppColors.transparentColor : baseColor;
    }();

    final borderColor = () {
      if (widget.disabled || widget.outlined) {
        return widget.disabledColor ?? AppColors.greyColor;
      }
      return baseColor;
    }();

    final effectiveTextColor = () {
      if (widget.disabled || widget.outlined) {
        return widget.disabledTextColor ?? (widget.outlined ? AppColors.blackColor : AppColors.whiteColor);
      }
      return widget.textColor ?? (widget.outlined ? borderColor : AppColors.whiteColor);
    }();

    Widget buildLoadingContent() {
      final loadingIndicator = SizedBox(
        width: 16,
        height: 16,
        child:
            CircularProgressIndicator(
              key: widget.key?.withSuffix("_loading_indicator"),
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(effectiveTextColor),
            ).withSemantics(),
      );

      if (widget.loadingText != null && widget.loadingText?.isNotEmpty == true) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            loadingIndicator,
            UIHelpers.tinySpace,
            Text(
              key: widget.key?.withSuffix("_loading_text"),
              widget.loadingText ?? "",
              style:
                  widget.loadingTextStyle ?? AppTypography.hint.copyWith(color: effectiveTextColor, fontWeight: FontWeight.w600),
            ).withSemantics(),
          ],
        );
      } else {
        return loadingIndicator;
      }
    }

    Widget buildContent() {
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (widget.prefixIcon != null) ...[widget.prefixIcon!, UIHelpers.tinySpace],
          Text(
            key: widget.key?.withSuffix("_text"),
            widget.text,
            style: widget.titleStyle ?? AppTypography.hint.copyWith(color: effectiveTextColor, fontWeight: FontWeight.w600),
          ).withSemantics(),
          if (widget.suffixIcon != null) ...[UIHelpers.tinySpace, widget.suffixIcon!],
        ],
      );
    }

    return MouseRegion(
      key: widget.key?.withSuffix("_mouse_region"),
      onEnter: (_) => setState(() => hovering = true),
      onExit: (_) => setState(() => hovering = false),
      child:
          InkWell(
            key: widget.key?.withSuffix("_inkwell"),
            onTap: effectiveOnTap,
            borderRadius: BorderRadius.circular(8),
            child: Container(
              height: widget.height,
              width: widget.width,
              padding: widget.padding ?? const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(12),
                border: widget.outlined ? Border.all(color: borderColor, width: 0.3) : null,
              ),
              child: widget.loading ? buildLoadingContent() : buildContent(),
            ),
          ).withSemantics(),
    ).withSemantics();
  }

  Color darken(Color color, [double amount = .1]) {
    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
    return hslDark.toColor();
  }
}
