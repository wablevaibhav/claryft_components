import 'package:claryft_components/ui_helpers.dart';
import 'package:flutter/material.dart';

enum SnackBarType { success, error, info }

class AppSnackBar {
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
        icon = Icons.check_circle;
        break;
      case SnackBarType.error:
        bgColor = Colors.red;
        icon = Icons.error;
        break;
      case SnackBarType.info:
        bgColor = Colors.blue;
        icon = Icons.info;
    }

    final overlay = Overlay.of(context);

    final overlayEntry = OverlayEntry(
      builder:
          (context) => Positioned(
            top: 50,
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
                  color: Colors.white,
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
                    Icon(icon, color: bgColor),
                    UIHelpers.smallSpace,
                    Flexible(
                      child: Text(
                        message,
                        style: const TextStyle(color: Colors.blueGrey),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
    );

    overlay.insert(overlayEntry);

    Future.delayed(duration, () {
      overlayEntry.remove();
    });
  }
}
