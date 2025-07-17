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
                onPressed: () {},
                child: Text(
                  'Go to Example Page',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.whiteColor),
                ),
              ),
              Gap(12),
              OutlinedButton(onPressed: () {}, child: Text('Go to Example Page', style: Theme.of(context).textTheme.bodySmall)),
              Gap(12),
              TextField(decoration: InputDecoration(labelText: 'Enter text', hintText: 'Type something...')),
              Gap(12),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Enter your name',
                  hintText: 'John Doe',

                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
                ),
              ),
              Gap(12),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text('This is a card widget', style: Theme.of(context).textTheme.bodyMedium),
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
                                child: Text(
                                  'This is a bottom sheet',
                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.blackColor),
                                ),
                              ),
                            ),
                      );
                    },
                    child: Text(
                      'Click Me',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.primaryColor),
                    ),
                  );
                },
              ),
              Gap(12),
              Divider(color: AppColors.greyColor.withValues(alpha: 0.6), thickness: 1),
              Gap(12),
              ExpansionTile(
                title: Text('Expansion Tile', style: Theme.of(context).textTheme.headlineSmall),
                children: [
                  ListTile(
                    title: Text('Item 1', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.blackColor)),
                  ),
                  ListTile(
                    title: Text('Item 2', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.blackColor)),
                  ),
                  ListTile(
                    title: Text('Item 3', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.blackColor)),
                  ),
                ],
              ),
              Gap(12),
              Tooltip(message: 'This is a tooltip', child: Text('Hover over me', style: Theme.of(context).textTheme.bodyMedium)),
            ],
          ),
        ),
      ),
    );
  }
}
