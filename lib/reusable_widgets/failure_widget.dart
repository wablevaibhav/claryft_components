import 'package:claryft_components/app_colors.dart';
import 'package:claryft_components/claryft_components.dart';
import 'package:claryft_components/reusable_widgets/app_button.dart';
import 'package:claryft_components/ui_helpers.dart';
import 'package:flutter/material.dart';

class FailureWidget extends StatelessWidget {
  final String message;
  final void Function()? onRetry;
  final String? errorDetails;
  final TextStyle? textStyle;
  final TextStyle? errorDetailsTextStyle;

  const FailureWidget({
    super.key,
    required this.message,
    required this.onRetry,
    this.errorDetails,
    this.textStyle,
    this.errorDetailsTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: const EdgeInsets.all(16),
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.error_outline, color: AppColors.errorColor, size: 48),
              UIHelpers.smallSpace,
              Text(
                message,
                style:
                    textStyle ??
                    AppTypography.small.copyWith(color: AppColors.blackColor),
                textAlign: TextAlign.center,
              ),
              if (errorDetails != null) ...[
                UIHelpers.tinySpace,
                Text(
                  errorDetails ?? "",
                  style:
                      errorDetailsTextStyle ??
                      AppTypography.smallHint.copyWith(
                        color: AppColors.darkGreyColor,
                      ),
                  textAlign: TextAlign.center,
                ),
              ],
              UIHelpers.regularSpace,
              AppButton(
                onPressed: onRetry,
                prefixIcon: Icon(Icons.refresh),
                text: "Retry",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
