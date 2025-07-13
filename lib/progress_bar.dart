import 'package:claryft_components/claryft_components.dart';
import 'package:flutter/material.dart';

class CustomLinearProgressBar extends StatelessWidget {
  final double progress;
  final Color color;
  final Color backgroundColor;

  const CustomLinearProgressBar({
    super.key,
    required this.progress,
    required this.color,
    this.backgroundColor = const Color(0xFFE5E5E5),
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${(progress * 100).toInt()}%',
          style: AppTypography.normal.copyWith(fontWeight: FontWeight.w500, fontSize: 12, color: color),
        ),
        const Gap(4),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(value: progress, color: color, backgroundColor: backgroundColor, minHeight: 4),
        ),
      ],
    );
  }
}

class CustomCircularProgressBar extends StatelessWidget {
  final double progress;
  final double size;
  final bool isFilled;
  final Color color;
  final Color backgroundColor;

  const CustomCircularProgressBar({
    super.key,
    required this.progress,
    this.size = 48,
    this.isFilled = true,
    required this.color,
    this.backgroundColor = const Color(0xFFE5E5E5),
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: size,
          height: size,
          child: CircularProgressIndicator(
            value: progress,
            strokeWidth: isFilled ? 6 : 3,
            backgroundColor: backgroundColor,
            valueColor: AlwaysStoppedAnimation<Color>(color),
          ),
        ),
        Text(
          '${(progress * 100).toInt()}%',
          style: AppTypography.normal.copyWith(fontSize: size * 0.28, fontWeight: FontWeight.bold, color: color),
        ),
      ],
    );
  }
}
