import 'package:claryft_components/claryft_components.dart';
import 'package:flutter/material.dart';

class FailureWidget extends StatelessWidget {
  final Function()? onTap;
  const FailureWidget({super.key, this.onTap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.errorColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.error, color: AppColors.whiteColor),
              UIHelpers.smallSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Oops!",
                      style: AppTypography.hint.copyWith(
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    UIHelpers.smallSpace,
                    Text(
                      "There was an error retrieving this resource. click here to try again",
                      style: AppTypography.small.copyWith(
                        color: AppColors.whiteColor,
                        overflow: TextOverflow.clip,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
