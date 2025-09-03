import 'package:claryft_components/claryft_components.dart';
import 'package:example/config/router/app_link.dart';
import 'package:example/config/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainScaffold extends StatelessWidget {
  final Widget body;
  final AppRoute selectedRoute;
  final void Function(String route)? onMenuTap;
  final bool isScrollable;

  const MainScaffold({super.key, required this.body, required this.selectedRoute, this.onMenuTap, this.isScrollable = true});

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = UIHelpers.screenWidth(context) > 900;

    Widget buildSidebar() => Container(
      width: 255,
      color: const Color(0xFF1E293B),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.only(left: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  key: key?.withSuffix('app_logo_text'),
                  'Claryft',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white),
                ).withSemantics(),
                Text(
                  key: key?.withSuffix('app_logo_subtext'),
                  'Components',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white70),
                ).withSemantics(),
              ],
            ),
          ),
          UIHelpers.verticalDividerMedium,
          const SizedBox(height: 20),
          ...menuItems.map((item) => _buildMenuItem(context, item, isSelected: selectedRoute.path == item.route)),
        ],
      ),
    );

    return Scaffold(
      key: key?.withSuffix('main_scaffold'),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      bottomNavigationBar:
          Responsive.isMobileSize()
              ? NavigationBar(
                destinations:
                    menuItems.map((item) {
                      return NavigationDestination(
                        icon: Icon(item.icon, color: item.route == selectedRoute.path ? AppColors.whiteColor : Colors.black12),
                        label: item.title,
                      );
                    }).toList(),
                selectedIndex: menuItems.indexWhere((item) => item.route == selectedRoute.path),
                onDestinationSelected: (index) {
                  if (onMenuTap != null) {
                    onMenuTap!(menuItems[index].route);
                  } else {
                    context.go(menuItems[index].route);
                  }
                },
                backgroundColor: Colors.white,
              )
              : null,
      appBar:
          isDesktop
              ? null
              : AppBar(
                centerTitle: false,
                title:
                    Text(
                      key: key?.withSuffix('app_bar_title'),
                      selectedRoute.name,
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.black),
                    ).withSemantics(),
                backgroundColor: Colors.white,
              ),
      drawer: isDesktop ? null : buildSidebar(),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isDesktop) buildSidebar(),
          Expanded(
            child:
                isScrollable
                    ? CustomScrollView(
                      slivers: [
                        if (isDesktop)
                          SliverAppBar(
                            pinned: true,
                            title:
                                Text(
                                  key: key?.withSuffix('sliver_app_bar_title'),
                                  selectedRoute.name,
                                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.black),
                                ).withSemantics(),
                          ),
                        SliverToBoxAdapter(child: body),
                      ],
                    )
                    : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (isDesktop)
                          AppBar(
                            centerTitle: false,
                            title:
                                Text(
                                  key: key?.withSuffix('app_bar_title'),
                                  selectedRoute.name,
                                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.black),
                                ).withSemantics(),
                          ),
                        Expanded(child: body),
                      ],
                    ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, MenuItem item, {required bool isSelected}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: isSelected ? AppColors.primaryColor : null),
      child: ListTile(
        key: key?.withSuffix('menu_item_${item.title.toLowerCase()}'),
        leading: Icon(
          key: key?.withSuffix('menu_item_icon'),
          item.icon,
          color: Colors.white,
        ).withSemantics(label: item.title, isButton: true),
        title:
            Text(
              key: key?.withSuffix('menu_item_${item.title.toLowerCase()}'),
              item.title,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: isSelected ? Colors.white : Colors.white70),
            ).withSemantics(),
        onTap: () {
          if (onMenuTap != null) {
            onMenuTap!(item.route);
          } else {
            context.go(item.route);
          }
        },
      ),
    );
  }
}
