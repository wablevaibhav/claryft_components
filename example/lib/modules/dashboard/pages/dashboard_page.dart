import 'package:claryft_components/claryft_components.dart';
import 'package:example/config/router/app_link.dart';
import 'package:example/config/navigation/main_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      key: const ValueKey('dashboard_page'),
      selectedRoute: AppRoute.dashboard,
      onMenuTap: (route) {
        if (route != AppRoute.dashboard.path) {
          context.go(route);
        }
      },
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                key: const ValueKey('go_to_example_page_button'),
                onPressed: () {},
                child: Text(
                  'Go to Example Page',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.whiteColor),
                ),
              ).withSemantics(),
              Gap(12),
              OutlinedButton(
                key: const ValueKey('go_to_example_page_button'),
                onPressed: () {},
                child: Text('Go to Example Page', style: Theme.of(context).textTheme.bodySmall),
              ).withSemantics(),
              Gap(12),
              TextField(
                key: const ValueKey('text_field'),
                decoration: InputDecoration(labelText: 'Enter text', hintText: 'Type something...'),
              ).withSemantics(),
              Gap(12),
              TextFormField(
                key: const ValueKey('name_field'),
                decoration: InputDecoration(
                  labelText: 'Enter your name',
                  hintText: 'John Doe',

                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
                ),
              ).withSemantics(),
              Gap(12),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child:
                      Text(
                        key: const ValueKey('card_text'),
                        'This is a card widget',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ).withSemantics(),
                ),
              ),

              Gap(12),
              Builder(
                builder: (context) {
                  return TextButton(
                    onPressed: () {
                      showBottomSheet(
                        context: context,
                        builder:
                            (context) => Container(
                              padding: const EdgeInsets.all(16.0),
                              height: 400,
                              child: Center(
                                child:
                                    Text(
                                      key: const ValueKey('bottom_sheet_text'),
                                      'This is a bottom sheet',
                                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.blackColor),
                                    ).withSemantics(),
                              ),
                            ),
                      );
                    },
                    child:
                        Text(
                          key: const ValueKey('show_bottom_sheet_button'),
                          'Click Me',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.primaryColor),
                        ).withSemantics(),
                  );
                },
              ),
              Gap(12),
              Divider(color: AppColors.greyColor.withValues(alpha: 0.6), thickness: 1),
              Gap(12),
              ExpansionTile(
                key: const ValueKey('expansion_tile'),
                title:
                    Text(
                      key: const ValueKey('expansion_tile_title'),
                      'Expansion Tile',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ).withSemantics(),
                children: [
                  ListTile(
                    key: const ValueKey('expansion_tile_item_1'),
                    title:
                        Text(
                          key: const ValueKey('expansion_tile_item_1'),
                          'Item 1',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.blackColor),
                        ).withSemantics(),
                  ).withSemantics(),
                  ListTile(
                    key: const ValueKey('expansion_tile_item_2'),
                    title:
                        Text(
                          key: const ValueKey('expansion_tile_item_2'),
                          'Item 2',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.blackColor),
                        ).withSemantics(),
                  ).withSemantics(),
                  ListTile(
                    key: const ValueKey('expansion_tile_item_3'),
                    title:
                        Text(
                          'Item 3',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.blackColor),
                        ).withSemantics(),
                  ).withSemantics(),
                ],
              ).withSemantics(),
              Gap(12),
              Tooltip(
                key: const ValueKey('tooltip'),
                message: 'This is a tooltip',
                child:
                    Text(
                      key: const ValueKey('tooltip_text'),
                      'Hover over me',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ).withSemantics(),
              ).withSemantics(),
            ],
          ),
        ),
      ),
    );
  }
}
