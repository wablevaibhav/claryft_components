import 'package:example/config/router/app_link.dart';
import 'package:example/modules/dashboard/pages/dashboard_page.dart';
import 'package:example/modules/tiles/tiles_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

AppRoute currentNavItem = AppRoute.dashboard;

class MenuItem {
  final IconData icon;
  final String title;
  final String route;
  final bool hasNotification;

  MenuItem({required this.icon, required this.title, required this.route, this.hasNotification = false});
}

List<MenuItem> menuItems = [
  MenuItem(icon: Icons.dashboard, title: 'Components', route: AppRoute.dashboard.path),
  MenuItem(icon: Icons.grid_view, title: 'Tiles', route: AppRoute.tiles.path),
];

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoute.dashboard.path,

  routes: [
    GoRoute(
      path: AppRoute.dashboard.path,
      name: AppRoute.dashboard.name,
      builder: (context, state) {
        return DashboardPage();
      },
      redirect: (context, state) => AppRoute.dashboard.path,
    ),
    GoRoute(
      path: AppRoute.tiles.path,
      name: AppRoute.tiles.name,
      builder: (context, state) {
        return const TilesPage();
      },
      redirect: (context, state) => AppRoute.tiles.path,
    ),
  ],
);
