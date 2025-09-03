import 'package:flutter/material.dart';

extension SemanticsExtensions on Widget {
  Widget withSemantics({
    String? identifier,
    String? label,
    String? hint,
    bool isButton = false,
    bool isImage = false,
    bool isSelected = false,
    bool readOnly = false,
    bool enabled = true,
    bool container = false,
    VoidCallback? onTap,
    VoidCallback? onLongPress,
  }) {
    String id = label ?? ((key is ValueKey) ? (key as ValueKey).value.toString() : runtimeType.toString());
    return Semantics(
      identifier: id,
      label: label,
      container: container,
      hint: hint,
      button: isButton,
      image: isImage,
      selected: isSelected,
      readOnly: readOnly,
      enabled: enabled,
      onTap: onTap,
      onLongPress: onLongPress,
      child: this,
    );
  }
}

extension KeyExtension on Key? {
  ValueKey withSuffix(String suffix) {
    final String originalKey = (this as ValueKey).value.toString();
    return ValueKey('${originalKey}_$suffix');
  }

  String get keyToString => (this as ValueKey).value.toString();
}
