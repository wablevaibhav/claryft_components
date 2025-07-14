import 'package:flutter/material.dart';
import 'package:claryft_components/claryft_components.dart';
import 'package:iconsax/iconsax.dart';

class UserProfileHeader extends StatelessWidget {
  final String name;
  final String role;
  final String? avatarUrl;
  final VoidCallback? onLogout;
  final VoidCallback? onProfile;
  final VoidCallback? onSettings;

  const UserProfileHeader({
    super.key,
    required this.name,
    required this.role,
    this.avatarUrl,
    this.onLogout,
    this.onProfile,
    this.onSettings,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      verticalDirection: VerticalDirection.up,
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: Colors.white,
          backgroundImage: avatarUrl != null && avatarUrl!.isNotEmpty ? NetworkImage(avatarUrl!) : null,
          child:
              avatarUrl == null || avatarUrl!.isEmpty
                  ? Text(
                    name.isNotEmpty ? name[0].toUpperCase() : "?",
                    style: AppTypography.normal.copyWith(fontWeight: FontWeight.bold, color: AppColors.primaryColor),
                  )
                  : null,
        ),
        const Gap(8),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: AppTypography.small.copyWith(fontWeight: FontWeight.w600, fontSize: 12, color: AppColors.whiteColor),
            ),
            Text(role, style: AppTypography.small.copyWith(color: AppColors.greyColor, fontSize: 10)),
          ],
        ),
        _ProfileDropdownMenu(onLogout: onLogout, onProfile: onProfile, onSettings: onSettings),
      ],
    );
  }
}

class _ProfileDropdownMenu extends StatelessWidget {
  final VoidCallback? onLogout;
  final VoidCallback? onSettings;
  final VoidCallback? onProfile;

  const _ProfileDropdownMenu({this.onLogout, this.onSettings, this.onProfile});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      offset: const Offset(0, 50),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: AppColors.cardColor,
      elevation: 8,
      icon: Icon(Iconsax.arrow_circle_down, size: 28, color: AppColors.whiteColor),
      itemBuilder:
          (context) => [
            PopupMenuItem(
              value: 1,
              onTap: onProfile,
              child: ListTile(leading: const Icon(Icons.person_outline), title: Text("My Profile", style: AppTypography.small)),
            ),
            PopupMenuItem(
              value: 2,
              onTap: onSettings,
              child: ListTile(leading: const Icon(Icons.settings_outlined), title: Text("Settings", style: AppTypography.normal)),
            ),
            const PopupMenuDivider(),
            PopupMenuItem(
              value: 3,
              onTap: onLogout,
              child: ListTile(
                leading: const Icon(Icons.logout, color: Colors.redAccent),
                title: Text("Logout", style: AppTypography.small.copyWith(color: Colors.redAccent)),
              ),
            ),
          ],
    );
  }
}
