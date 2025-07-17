import 'package:flutter/material.dart';

class DropdownItem {
  final String label;
  final Widget? image;
  final bool? isAssetImage;
  final String? imageUrl;
  final IconData? icon;
  final Color? iconColor;

  DropdownItem({
    required this.label,
    this.image,
    this.isAssetImage,
    this.imageUrl,
    this.icon,
    this.iconColor,
  });
}
