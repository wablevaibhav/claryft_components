import 'package:claryft_components/claryft_components.dart';
import 'package:flutter/material.dart';

enum AppButtonState { normal, loading, disabled }

enum AppButtonType { filled, outlined }

class AppButton extends StatefulWidget {
  final String text;
  final String? loadingText;
  final TextStyle? textStyle;
  final TextStyle? loadingTextStyle;
  final void Function()? onPressed;
  final EdgeInsets? padding;
  final Color? color;
  final Color? textColor;
  final Color? disabledColor;
  final Color? disabledTextColor;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final double? height;
  final double? width;
  final double borderRadius;
  final Color? borderColor;
  final AppButtonState state;
  final AppButtonType type;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.loadingText,
    this.textStyle,
    this.loadingTextStyle,
    this.padding,
    this.color,
    this.textColor,
    this.disabledColor,
    this.disabledTextColor,
    this.prefixIcon,
    this.suffixIcon,
    this.height,
    this.width,
    this.borderRadius = 10,
    this.borderColor,
    this.state = AppButtonState.normal,
    this.type = AppButtonType.filled,
  });

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  bool hovering = false;

  @override
  Widget build(BuildContext context) {
    final isDisabled = widget.state == AppButtonState.disabled;
    final isLoading = widget.state == AppButtonState.loading;

    final effectiveOnTap = (isDisabled || isLoading) ? null : widget.onPressed;

    final baseColor = widget.color ?? AppColors.primaryColor;
    final effectiveBorderColor = widget.borderColor ?? baseColor;

    final bgColor = () {
      if (widget.type == AppButtonType.outlined) return Colors.transparent;
      if (isDisabled) return widget.disabledColor ?? AppColors.disabledColor;
      return hovering ? darken(baseColor) : baseColor;
    }();

    final border =
        widget.type == AppButtonType.outlined || isDisabled
            ? Border.all(color: isDisabled ? widget.disabledColor ?? AppColors.disabledColor : effectiveBorderColor, width: 0.8)
            : null;

    final textColor = () {
      if (isDisabled) return widget.disabledTextColor ?? AppColors.whiteColor;
      if (widget.type == AppButtonType.outlined) {
        return widget.textColor ?? effectiveBorderColor;
      }
      return widget.textColor ?? Colors.white;
    }();

    final borderRadius = BorderRadius.circular(widget.borderRadius);

    Widget buildContent() {
      final content = <Widget>[
        if (widget.prefixIcon != null) ...[widget.prefixIcon!, UIHelpers.tinySpace],
        Text(widget.text, style: widget.textStyle ?? AppTypography.hint.copyWith(color: textColor, fontWeight: FontWeight.w400)),
        if (widget.suffixIcon != null) ...[UIHelpers.tinySpace, widget.suffixIcon!],
      ];

      return Row(mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.center, children: content);
    }

    Widget buildLoading() {
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (widget.loadingText?.isNotEmpty ?? false)
            Text(
              widget.loadingText!,
              style: widget.loadingTextStyle ?? AppTypography.hint.copyWith(color: textColor, fontWeight: FontWeight.w500),
            ),
          if (widget.loadingText?.isNotEmpty ?? false) UIHelpers.tinySpace,
          const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2)),
        ],
      );
    }

    return MouseRegion(
      onEnter: (_) => setState(() => hovering = true),
      onExit: (_) => setState(() => hovering = false),
      child: InkWell(
        borderRadius: borderRadius,
        onTap: effectiveOnTap,
        child: Container(
          height: widget.height,
          width: widget.width,
          padding: widget.padding ?? const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(color: bgColor, border: border, borderRadius: borderRadius),
          child: isLoading ? buildLoading() : buildContent(),
        ),
      ),
    );
  }

  Color darken(Color color, [double amount = .1]) {
    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
    return hslDark.toColor();
  }
}
