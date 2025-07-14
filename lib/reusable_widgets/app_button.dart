// import 'package:claryft_components/ui_helpers.dart';
// import 'package:flutter/material.dart';

// class ClaryftButton extends StatelessWidget {
//   final String text;
//   final String? loadingText;
//   final void Function()? onPressed;
//   final bool loading;
//   final bool outlined;
//   final bool disabled;
//   final Color? color;
//   final Color? textColor;
//   final Color? disabledColor;
//   final Color? disabledTextColor;
//   final Widget? prefixIcon;
//   final Widget? suffixIcon;

//   const ClaryftButton({
//     super.key,
//     required this.text,
//     this.loadingText,
//     required this.onPressed,
//     this.loading = false,
//     this.outlined = false,
//     this.disabled = false,
//     this.color,
//     this.textColor,
//     this.disabledColor,
//     this.disabledTextColor,
//     this.prefixIcon,
//     this.suffixIcon,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final effectiveOnTap = (disabled || loading) ? null : onPressed;

//     final bgColor = () {
//       if (disabled) {
//         return outlined ? Colors.transparent : disabledColor ?? Colors.grey;
//       }
//       return outlined ? Colors.transparent : color ?? Colors.blue.shade800;
//     }();

//     final borderColor = () {
//       if (disabled || outlined) {
//         return disabledColor ?? Colors.grey.shade300;
//       }
//       return color ?? Colors.blue.shade800;
//     }();

//     final effectiveTextColor = () {
//       if (disabled || outlined) {
//         return disabledTextColor ?? (outlined ? Colors.black : Colors.white);
//       }
//       return textColor ?? (outlined ? borderColor : Colors.white);
//     }();

//     Widget buildLoadingContent() {
//       final loadingIndicator = SizedBox(
//         width: 16,
//         height: 16,
//         child: CircularProgressIndicator(
//           strokeWidth: 2,
//           valueColor: AlwaysStoppedAnimation<Color>(effectiveTextColor),
//         ),
//       );

//       if (loadingText != null && loadingText?.isNotEmpty == true) {
//         return Row(
//           mainAxisSize: MainAxisSize.min,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               loadingText ?? "",
//               style: TextStyle(
//                 color: effectiveTextColor,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//             UIHelpers.tinySpace,
//             loadingIndicator,
//           ],
//         );
//       } else {
//         return loadingIndicator;
//       }
//     }

//     Widget buildContent() {
//       return Row(
//         mainAxisSize: MainAxisSize.min,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           if (prefixIcon != null) ...[prefixIcon!, UIHelpers.tinySpace],
//           Text(
//             text,
//             style: TextStyle(
//               color: effectiveTextColor,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//           if (suffixIcon != null) ...[UIHelpers.tinySpace, suffixIcon!],
//         ],
//       );
//     }

//     return InkWell(
//       onTap: effectiveOnTap,
//       borderRadius: BorderRadius.circular(8),
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//         decoration: BoxDecoration(
//           color: bgColor,
//           borderRadius: BorderRadius.circular(8),
//           border: outlined ? Border.all(color: borderColor, width: 0.6) : null,
//         ),
//         child: loading ? buildLoadingContent() : buildContent(),
//       ),
//     );
//   }
// }
import 'package:claryft_components/ui_helpers.dart';
import 'package:flutter/material.dart';

class ClaryftButton extends StatefulWidget {
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

  const ClaryftButton({
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
  State<ClaryftButton> createState() => _ClaryftButtonState();
}

class _ClaryftButtonState extends State<ClaryftButton> {
  bool hovering = false;

  @override
  Widget build(BuildContext context) {
    final effectiveOnTap =
        (widget.disabled || widget.loading) ? null : widget.onPressed;

    final baseColor = widget.color ?? Colors.blue.shade800;

    final bgColor = () {
      if (widget.disabled) {
        return widget.outlined
            ? Colors.transparent
            : widget.disabledColor ?? Colors.grey;
      }
      if (hovering) {
        return darken(baseColor, 0.1);
      }
      return widget.outlined ? Colors.transparent : baseColor;
    }();

    final borderColor = () {
      if (widget.disabled || widget.outlined) {
        return widget.disabledColor ?? Colors.grey.shade800;
      }
      return baseColor;
    }();

    final effectiveTextColor = () {
      if (widget.disabled || widget.outlined) {
        return widget.disabledTextColor ??
            (widget.outlined ? Colors.black : Colors.white);
      }
      return widget.textColor ?? (widget.outlined ? borderColor : Colors.white);
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

      if (widget.loadingText != null &&
          widget.loadingText?.isNotEmpty == true) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.loadingText ?? "",
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
          if (widget.prefixIcon != null) ...[
            widget.prefixIcon!,
            UIHelpers.tinySpace,
          ],
          Text(
            widget.text,
            style: TextStyle(
              color: effectiveTextColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          if (widget.suffixIcon != null) ...[
            UIHelpers.tinySpace,
            widget.suffixIcon!,
          ],
        ],
      );
    }

    return MouseRegion(
      onEnter: (_) => setState(() => hovering = true),
      onExit: (_) => setState(() => hovering = false),
      child: InkWell(
        onTap: effectiveOnTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(12),
            border:
                widget.outlined
                    ? Border.all(color: borderColor, width: 0.3)
                    : null,
          ),
          child: widget.loading ? buildLoadingContent() : buildContent(),
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
