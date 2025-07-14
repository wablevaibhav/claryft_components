import 'package:claryft_components/ui_helpers.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final String? loadingText;
  final void Function()? onPressed;
  final bool loading;
  final bool outlined;
  final bool disabled;
  final Color? color;
  final Color? textColor;
  final Color? disabledColor;
  final Color? disabledTextColor;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

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
  });

  @override
  Widget build(BuildContext context) {
    final effectiveOnTap = (disabled || loading) ? null : onPressed;

    final bgColor = () {
      if (disabled) {
        return outlined ? Colors.transparent : disabledColor ?? Colors.grey;
      }
      return outlined ? Colors.transparent : color ?? Colors.blue.shade800;
    }();

    final borderColor = () {
      if (disabled || outlined) {
        return disabledColor ?? Colors.grey.shade300;
      }
      return color ?? Colors.blue.shade800;
    }();

    final effectiveTextColor = () {
      if (disabled || outlined) {
        return disabledTextColor ?? (outlined ? Colors.black : Colors.white);
      }
      return textColor ?? (outlined ? borderColor : Colors.white);
    }();

    Widget buildLoadingContent() {
      final loadingIndicator = SizedBox(
        width: 16,
        height: 16,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(effectiveTextColor),
        ),
      );

      if (loadingText != null && loadingText?.isNotEmpty == true) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              loadingText ?? "",
              style: TextStyle(
                color: effectiveTextColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            UIHelpers.tinySpace,
            loadingIndicator,
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
          if (prefixIcon != null) ...[prefixIcon!, UIHelpers.tinySpace],
          Text(
            text,
            style: TextStyle(
              color: effectiveTextColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          if (suffixIcon != null) ...[UIHelpers.tinySpace, suffixIcon!],
        ],
      );
    }

    return InkWell(
      onTap: effectiveOnTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(8),
          border: outlined ? Border.all(color: borderColor, width: 0.6) : null,
        ),
        child: loading ? buildLoadingContent() : buildContent(),
      ),
    );
  }
}
