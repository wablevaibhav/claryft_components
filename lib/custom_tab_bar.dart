import 'package:claryft_components/claryft_components.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatefulWidget {
  final List<String> tabs;
  final List<Widget> views;
  final int initialIndex;
  final bool isScrollable;
  final TabController? controller;

  const CustomTabBar({
    super.key,
    required this.tabs,
    required this.views,
    this.initialIndex = 0,
    this.isScrollable = false,
    this.controller,
  });

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        widget.controller ?? TabController(length: widget.tabs.length, vsync: this, initialIndex: widget.initialIndex);
  }

  @override
  void dispose() {
    if (widget.controller == null) _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          isScrollable: widget.isScrollable,
          labelColor: AppColors.blackColor,
          unselectedLabelColor: AppColors.greyColor,
          labelStyle: AppTypography.normal.copyWith(fontWeight: FontWeight.w600),
          unselectedLabelStyle: AppTypography.normal.copyWith(fontWeight: FontWeight.w400),
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(width: 3, color: AppColors.primaryColor),
            insets: EdgeInsets.symmetric(horizontal: 16.0),
          ),
          tabs: widget.tabs.map((label) => Tab(text: label)).toList(),
        ),
        const Gap(12),
        Expanded(child: TabBarView(controller: _tabController, children: widget.views)),
      ],
    );
  }
}
