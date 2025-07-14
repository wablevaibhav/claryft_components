import 'package:claryft_components/ui_helpers.dart';
import 'package:flutter/material.dart';

enum SnackBarType { success, error, info, warning }

class ClaryftSnackBar {
  static void show(
    BuildContext context, {
    required String message,
    SnackBarType type = SnackBarType.info,
    Duration duration = const Duration(seconds: 3),
  }) {
    Color bgColor;
    IconData icon;

    switch (type) {
      case SnackBarType.success:
        bgColor = Colors.green;
        icon = Icons.check_circle_outline_sharp;
        break;
      case SnackBarType.error:
        bgColor = Colors.red;
        icon = Icons.error_outline;
        break;
      case SnackBarType.info:
        bgColor = Colors.blue;
        icon = Icons.info_outline;
        break;
      case SnackBarType.warning:
        bgColor = Colors.amber;
        icon = Icons.warning_amber_outlined;
        break;
    }

    final overlay = Overlay.of(context);
    if (overlay == null) return;

    late OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(
      builder:
          (context) => Positioned(
            bottom: 50,
            right: 16,
            child: Material(
              color: Colors.transparent,
              child: Container(
                constraints: const BoxConstraints(maxWidth: 300),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: bgColor, width: 1),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(icon, color: Colors.white),
                    UIHelpers.smallSpace,
                    Flexible(
                      child: Text(
                        message,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    UIHelpers.smallSpace,
                    InkWell(
                      onTap: () {
                        overlayEntry.remove();
                      },
                      child: const Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
    );

    overlay.insert(overlayEntry);

    // Remove after duration if not already removed
    Future.delayed(duration, () {
      if (overlayEntry.mounted) {
        overlayEntry.remove();
      }
    });
  }
}
