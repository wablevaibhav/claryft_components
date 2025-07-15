import 'package:flutter/material.dart';

class DropdownItem {
  final String label;
  final String? imageUrl;
  final IconData? icon;
  final bool? isAssetImage;
  final Widget? image;
  final Color? iconColor;
  DropdownItem({
    required this.label,
    this.icon,
    this.imageUrl,
    this.isAssetImage = false,
    this.image,
    this.iconColor,
  });
  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is DropdownItem && label == other.label;
  @override
  int get hashCode => label.hashCode;
}
