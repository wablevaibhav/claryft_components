import 'package:flutter/material.dart';

class FailureWidget extends StatelessWidget {
  final String message;
  final void Function()? onRetry;
  final String? errorDetails;

  const FailureWidget({
    super.key,
    required this.message,
    required this.onRetry,
    this.errorDetails,
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
              Icon(Icons.error_outline, color: Colors.red, size: 48),
              const SizedBox(height: 12),
              Text(
                message,
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
              if (errorDetails != null) ...[
                const SizedBox(height: 8),
                Text(
                  errorDetails ?? "",
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
              ],
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: onRetry,
                icon: Icon(Icons.refresh),
                label: Text('Retry'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
