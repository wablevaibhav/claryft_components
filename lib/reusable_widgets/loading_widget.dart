import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final String? message; // Optional loading text
  final Color? color; // Loader color
  final double size; // Loader size

  const LoadingWidget({super.key, this.message, this.color, this.size = 32});

  @override
  Widget build(BuildContext context) {
    final effectiveColor = color ?? Theme.of(context).primaryColor;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: size,
            height: size,
            child: CircularProgressIndicator(
              strokeWidth: 2.5,
              valueColor: AlwaysStoppedAnimation<Color>(effectiveColor),
            ),
          ),
          if (message != null && message!.isNotEmpty) ...[
            const SizedBox(height: 12),
            Text(
              message!,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: Colors.grey[700]),
            ),
          ],
        ],
      ),
    );
  }
}
