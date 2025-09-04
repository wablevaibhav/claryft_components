import 'package:claryft_components/claryft_components.dart';
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
    this.baseColor = const Color(0xFFdadada),
    this.highlightColor = const Color(0xFFc6d1e7),
  });
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      key: key?.withSuffix("_cliprrect"),
      borderRadius: BorderRadius.circular(radius ?? 0),
      child:
          Shimmer.fromColors(
            key: key?.withSuffix("_shimmer"),
            baseColor: baseColor,
            highlightColor: highlightColor,
            child:
                Container(
                  key: key?.withSuffix("_container"),
                  width: width,
                  height: height,
                  color: AppColors.whiteColor,
                ).withSemantics(),
          ).withSemantics(),
    ).withSemantics();
  }
}
