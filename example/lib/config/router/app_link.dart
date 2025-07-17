import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

enum AppRoute { dashboard, tiles }

extension AppRouteExtension on AppRoute {
  String get path {
    switch (this) {
      case AppRoute.dashboard:
        return '/dashboard';
      case AppRoute.tiles:
        return '/tiles';
    }
  }

  String get name {
    switch (this) {
      case AppRoute.dashboard:
        return 'Dashboard';
      case AppRoute.tiles:
        return 'Tiles';
    }
  }

  IconData get icon {
    switch (this) {
      case AppRoute.dashboard:
        return Icons.dashboard;
      case AppRoute.tiles:
        return Icons.grid_view;
    }
  }
}
