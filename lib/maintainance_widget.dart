import 'package:claryft_components/claryft_components.dart';
import 'package:flutter/material.dart';

enum MaintenanceState { maintenance, noInternet, notFound404, internalError500 }

class MaintenanceScreen extends StatelessWidget {
  final MaintenanceState state;
  final VoidCallback? onRetry;
  final String? title;
  final String? message;
  final String? buttonText;
  final ButtonStyle? buttonStyle;

  /// Optional per-state images. If an image is provided for a state it will be
  /// displayed instead of the default icon.
  final Map<MaintenanceState, ImageProvider>? stateImages;

  /// Size used for the icon or image. Defaults to 64.
  final double iconSize;

  const MaintenanceScreen({
    super.key,
    required this.state,
    this.onRetry,
    this.title,
    this.message,
    this.buttonText,
    this.stateImages,
    this.iconSize = 64,
    this.buttonStyle,
  });

  Widget _buildContent(BuildContext context) {
    Widget stateContent(
      BuildContext ctx,
      IconData icon,
      Color iconColor,
      String defaultTitle,
      String defaultMessage,
      String defaultButtonText,
      ImageProvider? image,
    ) {
      final textTheme = Theme.of(ctx).textTheme;
      return Column(
        key: key,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (image != null)
            Image(
              key: key?.withSuffix('image'),
              image: image,
              width: iconSize,
              height: iconSize,
              fit: BoxFit.contain,
            ).withSemantics()
          else
            Icon(
              key: key?.withSuffix('icon'),
              icon,
              size: iconSize,
              color: iconColor,
            ).withSemantics(),
          Gap(20),
          Text(
            key: key?.withSuffix('title'),
            title ?? defaultTitle,
            style: textTheme.headlineMedium,
          ).withSemantics(),
          Gap(10),
          Text(
            key: key?.withSuffix('message'),
            message ?? defaultMessage,
            style: textTheme.bodyMedium,
          ).withSemantics(),
          Gap(20),
          ElevatedButton(
            style:
                buttonStyle ??
                ButtonStyle(backgroundColor: WidgetStateProperty.all(AppColors.primaryColor)),
            key: key?.withSuffix('button'),
            onPressed: onRetry,
            child:
                Text(
                  key: key?.withSuffix('button_text'),
                  buttonText ?? defaultButtonText,
                  style: textTheme.bodyMedium?.copyWith(color: AppColors.whiteColor),
                ).withSemantics(),
          ).withSemantics(),
        ],
      ).withSemantics();
    }

    switch (state) {
      case MaintenanceState.maintenance:
        return stateContent(
          context,
          AppIcons.filterSettings,
          AppColors.primaryColor,
          'Site Under Maintenance',
          'We\'re making improvements. Please check back soon.',
          'Refresh',
          stateImages?[MaintenanceState.maintenance],
        );
      case MaintenanceState.noInternet:
        return stateContent(
          context,
          AppIcons.noInternet,
          Colors.redAccent,
          'No Internet Connection',
          'Please check your network and try again.',
          'Retry',
          stateImages?[MaintenanceState.noInternet],
        );
      case MaintenanceState.notFound404:
        return stateContent(
          context,
          AppIcons.serverError,
          Colors.orangeAccent,
          '404 - Page Not Found',
          'Sorry, we couldn\'t find what you\'re looking for.',
          'Go Home',
          stateImages?[MaintenanceState.notFound404],
        );
      case MaintenanceState.internalError500:
        return stateContent(
          context,
          AppIcons.warning,
          Colors.deepPurple,
          '500 - Internal Server Error',
          'Something went wrong. Please try later.',
          'Retry',
          stateImages?[MaintenanceState.internalError500],
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white, body: Center(child: _buildContent(context)));
  }
}
