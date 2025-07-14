import 'package:claryft_components/claryft_components.dart';
import 'package:flutter/material.dart';

enum DialogType { info, success, warning, error, confirm }

class DialogHelpers {
  static Future<void> showCustomDialog({
    required BuildContext context,
    required String title,
    required String message,
    DialogType type = DialogType.info,
    String confirmText = "OK",
    VoidCallback? onConfirm,
    String? cancelText,
    VoidCallback? onCancel,
    bool dismissible = true,
    Color? cancelTextColor,
    Color? confirmTextColor,
  }) {
    IconData icon;
    Color color;

    switch (type) {
      case DialogType.success:
        icon = Icons.check_circle;
        color = AppColors.successColor;
        break;
      case DialogType.warning:
        icon = Icons.warning;
        color = AppColors.warningColor;
        break;
      case DialogType.error:
        icon = Icons.error;
        color = AppColors.errorColor;
        break;
      case DialogType.confirm:
        icon = Icons.help;
        color = AppColors.greyColor;
        break;
      default:
        icon = Icons.info;
        color = AppColors.infoColor;
    }

    return showDialog(
      barrierDismissible: dismissible,
      context: context,
      builder:
          (_) => AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            titlePadding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
            contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            actionsPadding: const EdgeInsets.only(right: 16, bottom: 12),
            title: Row(
              children: [
                Icon(icon, color: color),
                const Gap(12),
                Expanded(child: Text(title, style: AppTypography.small.copyWith(fontWeight: FontWeight.bold))),
              ],
            ),
            content: Text(message, style: AppTypography.hint),
            actions: [
              if (cancelText != null)
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    onCancel?.call();
                  },
                  child: Text(
                    cancelText,
                    style: AppTypography.small.copyWith(color: cancelTextColor ?? AppColors.textSecondaryColor),
                  ),
                ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  onConfirm?.call();
                },
                child: Text(
                  confirmText,
                  style: AppTypography.small.copyWith(color: confirmTextColor ?? AppColors.textSecondaryColor),
                ),
              ),
            ],
          ),
    );
  }

  /// Quick wrappers
  static Future<void> showInfo(BuildContext context, String message, {String title = "Info"}) =>
      showCustomDialog(context: context, title: title, message: message, type: DialogType.info);

  static Future<void> showSuccess(BuildContext context, String message, {String title = "Success"}) =>
      showCustomDialog(context: context, title: title, message: message, type: DialogType.success);

  static Future<void> showError(BuildContext context, String message, {String title = "Error"}) =>
      showCustomDialog(context: context, title: title, message: message, type: DialogType.error);

  static Future<void> showWarning(BuildContext context, String message, {String title = "Warning"}) =>
      showCustomDialog(context: context, title: title, message: message, type: DialogType.warning);

  static Future<void> showConfirm({
    required BuildContext context,
    required String message,
    required VoidCallback onConfirm,
    VoidCallback? onCancel,
    String title = "Are you sure?",
    String confirmText = "Yes",
    String cancelText = "Cancel",
    Color? confirmTextColor,
    Color? cancelTextColor,
  }) => showCustomDialog(
    context: context,
    title: title,
    message: message,
    type: DialogType.confirm,
    confirmText: confirmText,
    cancelText: cancelText,
    onConfirm: onConfirm,
    onCancel: onCancel,
    cancelTextColor: cancelTextColor,
    confirmTextColor: confirmTextColor,
  );
}
