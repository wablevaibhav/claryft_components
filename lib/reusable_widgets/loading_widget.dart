import 'package:claryft_components/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingWidget extends StatelessWidget {
  final double? width, height, radius;
  final Color baseColor, highlightColor;
  const LoadingWidget({
    super.key,
    required this.width,
    required this.height,
    this.radius = 0.0,
    this.baseColor = AppColors.whiteColor,
    this.highlightColor = const Color(0xFFDCC9FF),
  });
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius ?? 0),
      child: Shimmer.fromColors(
        baseColor: baseColor,
        highlightColor: highlightColor,
        child: Container(
          width: width,
          height: height,
          color: AppColors.whiteColor,
        ),
      ),
    );
  }
}
