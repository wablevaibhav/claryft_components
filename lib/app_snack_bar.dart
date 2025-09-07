import 'package:claryft_components/claryft_components.dart';
import 'package:flutter/material.dart';

enum SnackBarType { success, error, info, warning }

class ClaryftSnackBar {
  static void show(
    BuildContext context, {
    Key? key,
    required String message,
    SnackBarType type = SnackBarType.info,
    Duration duration = const Duration(seconds: 3),
  }) {
    final config = _configForType(type);
    final overlay = Overlay.of(context);

    late OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(
      builder:
          (context) => Positioned(
            bottom: 50,
            right: 16,
            child: Material(
              color: Colors.transparent,
              child: ConstrainedBox(
                constraints: const BoxConstraints(minWidth: 80, maxWidth: 280),
                child: IntrinsicWidth(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: config.color,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(color: AppColors.blackColor.withValues(alpha: 0.15), blurRadius: 8, offset: const Offset(0, 4)),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(key: key?.withSuffix("icon"), config.icon, color: AppColors.whiteColor, size: 18).withSemantics(),
                        UIHelpers.smallSpace,
                        Flexible(
                          child:
                              Text(
                                key: key?.withSuffix("message"),
                                message,
                                style: AppTypography.small.copyWith(color: AppColors.whiteColor),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ).withSemantics(),
                        ),
                        UIHelpers.smallSpace,
                        GestureDetector(
                          key: key?.withSuffix("close_gesture_detector"),
                          onTap: () {
                            if (overlayEntry.mounted) {
                              overlayEntry.remove();
                            }
                          },
                          child:
                              Icon(
                                key: key?.withSuffix("close_icon"),
                                Icons.close,
                                color: AppColors.whiteColor,
                                size: 18,
                              ).withSemantics(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
    );

    overlay.insert(overlayEntry);

    Future.delayed(duration, () {
      if (overlayEntry.mounted) {
        overlayEntry.remove();
      }
    });
  }

  static _SnackBarConfig _configForType(SnackBarType type) {
    switch (type) {
      case SnackBarType.success:
        return _SnackBarConfig(AppColors.successColor, Icons.check_circle_outline);
      case SnackBarType.error:
        return _SnackBarConfig(AppColors.errorColor, Icons.error_outline);
      case SnackBarType.info:
        return _SnackBarConfig(AppColors.infoColor, Icons.info_outline);
      case SnackBarType.warning:
        return _SnackBarConfig(AppColors.warningColor, Icons.warning_amber_outlined);
    }
  }
}

class _SnackBarConfig {
  final Color color;
  final IconData icon;
  const _SnackBarConfig(this.color, this.icon);
}
