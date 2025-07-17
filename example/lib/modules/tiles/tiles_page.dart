import 'package:claryft_components/claryft_components.dart';
import 'package:example/config/navigation/main_scaffold.dart';
import 'package:example/config/router/app_link.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TilesPage extends StatelessWidget {
  const TilesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () {
                ClaryftSnackBar.show(context, message: 'This is info snackbar', type: SnackBarType.success);
              },
              child: Text('Show Info Snackbar', style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white)),
            ),
            ElevatedButton(
              onPressed: () {
                ClaryftSnackBar.show(context, message: 'This is error snackbar', type: SnackBarType.error);
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(AppColors.errorColor),
                foregroundColor: WidgetStateProperty.all(Colors.white),
                side: WidgetStateProperty.all(BorderSide(color: AppColors.errorColor)),
              ),
              child: Text('Show Error Snackbar', style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white)),
            ),
            ElevatedButton(
              onPressed: () {
                ClaryftSnackBar.show(context, message: 'This is warning snackbar', type: SnackBarType.warning);
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(AppColors.warningColor),
                foregroundColor: WidgetStateProperty.all(Colors.white),
                side: WidgetStateProperty.all(BorderSide(color: AppColors.warningColor)),
              ),
              child: Text('Show Warning Snackbar', style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white)),
            ),
            ElevatedButton(
              onPressed: () {
                ClaryftSnackBar.show(context, message: 'This is success snackbar', type: SnackBarType.success);
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(AppColors.successColor),
                foregroundColor: WidgetStateProperty.all(Colors.white),
                side: WidgetStateProperty.all(BorderSide(color: AppColors.successColor)),
              ),
              child: Text('Show Success Snackbar', style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white)),
            ),
            ListTile(
              leading: Icon(Icons.grid_view),
              title: Text('Tile Example', style: Theme.of(context).textTheme.bodyMedium),
              onTap: () {},
              trailing: Icon(Icons.arrow_forward_ios, size: 16),
            ),
            LinearProgressIndicator(
              value: 0.5,
              backgroundColor: AppColors.greyColor.withValues(alpha: 0.3),
              color: AppColors.primaryColor,
            ),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                StatusLabel(icon: Icons.info, text: 'Status Label', type: LabelType.info),
                StatusLabel(icon: Icons.warning, text: 'Warning Label', type: LabelType.warning),
                StatusLabel(text: 'Error Label', type: LabelType.error, icon: Icons.error),
                StatusLabel(text: 'Success Label', type: LabelType.success, icon: Icons.check_circle),
              ],
            ),
            PopupMenuButton(
              child: Text('Show Popup Menu', style: Theme.of(context).textTheme.bodyMedium),
              itemBuilder: (context) {
                return [
                  PopupMenuItem(value: 'option1', child: Text('Option 1', style: Theme.of(context).textTheme.bodyMedium)),
                  PopupMenuItem(value: 'option2', child: Text('Option 2', style: Theme.of(context).textTheme.bodyMedium)),
                ];
              },
              onSelected: (value) {
                ClaryftSnackBar.show(context, message: 'Selected: $value', type: SnackBarType.info);
              },
            ),

            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Dialog Title', style: Theme.of(context).textTheme.titleLarge),
                      content: Text('This is a dialog content.', style: Theme.of(context).textTheme.bodyMedium),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text(
                            'Close',
                            style: Theme.of(context).textTheme.labelMedium?.copyWith(color: AppColors.primaryColor),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Dialog', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.primaryColor)),
            ),
            RadioListTile(
              title: Text('Radio Option 1', style: Theme.of(context).textTheme.bodyMedium),
              value: 'option1',
              groupValue: 'option1',
              onChanged: (value) {
                ClaryftSnackBar.show(context, message: 'Selected: $value', type: SnackBarType.info);
              },
            ),
            RadioListTile(
              title: Text('Radio Option 2', style: Theme.of(context).textTheme.bodyMedium),
              value: 'option2',
              groupValue: 'option1',
              onChanged: (value) {
                ClaryftSnackBar.show(context, message: 'Selected: $value', type: SnackBarType.info);
              },
            ),
            Text('This is a tiles page example with various components.', style: Theme.of(context).textTheme.bodyMedium),
            Text('You can customize the components as per your needs.', style: Theme.of(context).textTheme.bodyMedium),
            Text('Enjoy building your Flutter applications!', style: Theme.of(context).textTheme.bodyMedium),
            Text('For more information, visit the documentation.', style: Theme.of(context).textTheme.bodyMedium),
            Text('Thank you for using Claryft Components!', style: Theme.of(context).textTheme.bodyMedium),
            Text('Have a great day!', style: Theme.of(context).textTheme.bodyMedium),
            Text('Explore more components in the library.', style: Theme.of(context).textTheme.bodyMedium),
            Text('Feel free to contribute to the project.', style: Theme.of(context).textTheme.bodyMedium),
            Text('Your feedback is appreciated.', style: Theme.of(context).textTheme.bodyMedium),
            Text('Happy coding!', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ),
      selectedRoute: AppRoute.tiles,
      onMenuTap: (route) {
        if (route != AppRoute.tiles.path) {
          context.go(route);
        }
      },
    );
  }
}
