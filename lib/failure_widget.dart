import 'package:claryft_components/claryft_components.dart';
import 'package:flutter/material.dart';

class FailureWidget extends StatelessWidget {
  final Function()? onTap;
  const FailureWidget({super.key, this.onTap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      key: key?.withSuffix("_inkwell"),
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(color: AppColors.errorColor, borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(key: key?.withSuffix("_icon"), Icons.error, color: AppColors.whiteColor).withSemantics(),
              UIHelpers.smallSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      key: key?.withSuffix("_oops_text"),
                      "Oops!",
                      style: AppTypography.hint.copyWith(color: AppColors.whiteColor, fontWeight: FontWeight.bold),
                    ).withSemantics(),
                    UIHelpers.smallSpace,
                    Text(
                      key: key?.withSuffix("_description_text"),
                      "There was an error retrieving this resource. click here to try again",
                      style: AppTypography.small.copyWith(color: AppColors.whiteColor, overflow: TextOverflow.clip),
                    ).withSemantics(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ).withSemantics();
  }
}
