import 'package:flutter/material.dart';

/// Extension on [Text] to add semantic labels and hints.
extension TextSemanticsExt on Text {
  Widget withSemantics({String? label, String? hint}) {
    String id = label ?? ((key is ValueKey) ? (key as ValueKey).value.toString() : runtimeType.toString());
    return Semantics(identifier: id, label: label, hint: hint, child: this);
  }
}

/// Extension on [Icon] to improve accessibility.
extension IconSemanticsExt on Icon {
  Widget withSemantics({String? label, String? hint, bool isButton = false, VoidCallback? onTap}) {
    String id = label ?? ((key is ValueKey) ? (key as ValueKey).value.toString() : runtimeType.toString());
    return Semantics(identifier: id, label: label, hint: hint, button: isButton, onTap: onTap, child: this);
  }
}

/// Extension on [ElevatedButton], [TextButton], [OutlinedButton].
extension ButtonSemanticsExt on Widget {
  Widget withButtonSemantics({String? label, String? hint, VoidCallback? onTap}) {
    String id = label ?? ((key is ValueKey) ? (key as ValueKey).value.toString() : runtimeType.toString());
    return Semantics(identifier: id, container: false, label: label, hint: hint, button: true, onTap: onTap, child: this);
  }
}

/// Extension on [TextField] to describe form fields.
extension TextFieldSemanticsExt on TextField {
  Widget withSemantics({String? label, String? hint, bool readOnly = false}) {
    String id = label ?? ((key is ValueKey) ? (key as ValueKey).value.toString() : runtimeType.toString());
    return Semantics(identifier: id, label: label, hint: hint, textField: true, readOnly: readOnly, child: this);
  }
}

extension TextFormFieldSemanticsExt on TextFormField {
  Widget withSemantics({String? label, String? hint, bool readOnly = false}) {
    String id = label ?? ((key is ValueKey) ? (key as ValueKey).value.toString() : runtimeType.toString());
    return Semantics(identifier: id, label: label, hint: hint, textField: true, readOnly: readOnly, child: this);
  }
}

/// Extension on [Checkbox].
extension CheckboxSemanticsExt on Checkbox {
  Widget withSemantics({String? label, String? hint}) {
    String id = label ?? ((key is ValueKey) ? (key as ValueKey).value.toString() : runtimeType.toString());
    return Semantics(identifier: id, label: label, hint: hint, checked: value, child: this);
  }
}

/// Extension on [Radio].
extension RadioSemanticsExt<T> on Radio<T> {
  Widget withSemantics({String? label, String? hint}) {
    String id = label ?? ((key is ValueKey) ? (key as ValueKey).value.toString() : runtimeType.toString());
    return Semantics(identifier: id, label: label, hint: hint, checked: value == groupValue, child: this);
  }
}

/// Extension on [Switch].
extension SwitchSemanticsExt on Switch {
  Widget withSemantics({String? label, String? hint}) {
    String id = label ?? ((key is ValueKey) ? (key as ValueKey).value.toString() : runtimeType.toString());
    return Semantics(identifier: id, label: label, hint: hint, toggled: value, child: this);
  }
}

/// Extension on [Slider].
extension SliderSemanticsExt on Slider {
  Widget withSemantics({String? label, String? hint}) {
    String id = label ?? ((key is ValueKey) ? (key as ValueKey).value.toString() : runtimeType.toString());
    return Semantics(identifier: id, label: label, hint: hint, value: value.toString(), child: this);
  }
}

/// Extension on [LinearProgressIndicator] / [CircularProgressIndicator].
extension ProgressBarSemanticsExt on Widget {
  Widget withProgressSemantics({String? label, String? hint, double? value}) {
    String id = label ?? ((key is ValueKey) ? (key as ValueKey).value.toString() : runtimeType.toString());
    return Semantics(identifier: id, label: label, hint: hint, value: value?.toString(), child: this);
  }
}

/// Extension on [Chip].
extension ChipSemanticsExt on Chip {
  Widget withSemantics({String? label, String? hint}) {
    String id = label ?? ((key is ValueKey) ? (key as ValueKey).value.toString() : runtimeType.toString());
    return Semantics(identifier: id, label: label ?? this.label.toString(), hint: hint, child: this);
  }
}

/// Extension on [Card].
extension CardSemanticsExt on Card {
  Widget withSemantics({String? label, String? hint}) {
    String id = label ?? ((key is ValueKey) ? (key as ValueKey).value.toString() : runtimeType.toString());
    return Semantics(identifier: id, container: true, label: label, hint: hint, child: this);
  }
}

/// Extension on [ListTile].
extension ListTileSemanticsExt on ListTile {
  Widget withSemantics({String? label, String? hint, bool? selected}) {
    String id = label ?? ((key is ValueKey) ? (key as ValueKey).value.toString() : runtimeType.toString());
    return Semantics(
      identifier: id,
      label: label ?? title.toString(),
      hint: hint,
      selected: selected ?? this.selected,
      child: this,
    );
  }
}

/// Extension on [AppBar].
extension AppBarSemanticsExt on AppBar {
  Widget withSemantics({String? label, String? hint}) {
    String id = label ?? ((key is ValueKey) ? (key as ValueKey).value.toString() : runtimeType.toString());
    return Semantics(identifier: id, container: true, label: label, hint: hint, child: this);
  }
}

/// Extension on [TabBar].
extension TabBarSemanticsExt on TabBar {
  Widget withSemantics({String? label, String? hint}) {
    String id = label ?? ((key is ValueKey) ? (key as ValueKey).value.toString() : runtimeType.toString());
    return Semantics(identifier: id, container: true, label: label, hint: hint, child: this);
  }
}

/// Extension on [Drawer].
extension DrawerSemanticsExt on Drawer {
  Widget withSemantics({String? label, String? hint}) {
    String id = label ?? ((key is ValueKey) ? (key as ValueKey).value.toString() : runtimeType.toString());
    return Semantics(identifier: id, container: true, label: label, hint: hint, child: this);
  }
}

/// Extension on [BottomNavigationBar].
extension BottomNavigationBarSemanticsExt on BottomNavigationBar {
  Widget withSemantics({String? label, String? hint}) {
    String id = label ?? ((key is ValueKey) ? (key as ValueKey).value.toString() : runtimeType.toString());
    return Semantics(identifier: id, container: true, label: label, hint: hint, child: this);
  }
}

/// Extension on [FloatingActionButton].
extension FloatingActionButtonSemanticsExt on FloatingActionButton {
  Widget withSemantics({String? label, String? hint, VoidCallback? onTap}) {
    String id = label ?? ((key is ValueKey) ? (key as ValueKey).value.toString() : runtimeType.toString());
    return Semantics(identifier: id, label: label, hint: hint, button: true, onTap: onTap ?? onPressed, child: this);
  }
}

/// Extension on [Tooltip].
extension TooltipSemanticsExt on Tooltip {
  Widget withSemantics({String? label}) {
    String id = label ?? ((key is ValueKey) ? (key as ValueKey).value.toString() : runtimeType.toString());
    return Semantics(identifier: id, label: label ?? message, child: this);
  }
}

/// Extension on [ExpansionTile].
extension ExpansionTileSemanticsExt on ExpansionTile {
  Widget withSemantics({String? label, String? hint}) {
    String id = label ?? ((key is ValueKey) ? (key as ValueKey).value.toString() : runtimeType.toString());
    return Semantics(identifier: id, label: label ?? title.toString(), hint: hint, child: this);
  }
}

/// Extension on [Dialog].
extension DialogSemanticsExt on Dialog {
  Widget withSemantics({String? label}) {
    String id = label ?? ((key is ValueKey) ? (key as ValueKey).value.toString() : runtimeType.toString());
    return Semantics(identifier: id, namesRoute: true, label: label, child: this);
  }
}

/// Extension on [SnackBar].
extension SnackBarSemanticsExt on SnackBar {
  Widget withSemantics({String? label}) {
    String id = label ?? ((key is ValueKey) ? (key as ValueKey).value.toString() : runtimeType.toString());
    return Semantics(identifier: id, liveRegion: true, label: label ?? content.toString(), child: this);
  }
}

/// Extension on [PopupMenuButton].
extension PopupMenuSemanticsExt<T> on PopupMenuButton<T> {
  Widget withSemantics({String? label, String? hint}) {
    String id = label ?? ((key is ValueKey) ? (key as ValueKey).value.toString() : runtimeType.toString());
    return Semantics(identifier: id, button: true, label: label, hint: hint, child: this);
  }
}

/// Extension on [Image].
extension ImageSemanticsExt on Image {
  Widget withSemantics({String? label}) {
    String id = label ?? ((key is ValueKey) ? (key as ValueKey).value.toString() : runtimeType.toString());
    return Semantics(identifier: id, image: true, label: label, child: this);
  }
}

/// Extension on [Divider].
extension DividerSemanticsExt on Divider {
  Widget withSemantics({String? label}) {
    String id = label ?? ((key is ValueKey) ? (key as ValueKey).value.toString() : runtimeType.toString());
    return Semantics(identifier: id, label: label, child: this);
  }
}

/// Extension on [Container].
extension ContainerSemanticsExt on Container {
  Widget withSemantics({String? label, String? hint}) {
    String id = label ?? ((key is ValueKey) ? (key as ValueKey).value.toString() : runtimeType.toString());
    return Semantics(identifier: id, container: true, label: label, hint: hint, child: this);
  }
}

/// Extension on [Row].
extension RowSemanticsExt on Row {
  Widget withSemantics({String? label}) {
    String id = label ?? ((key is ValueKey) ? (key as ValueKey).value.toString() : runtimeType.toString());
    return Semantics(identifier: id, container: true, label: label, child: this);
  }
}

/// Extension on [Column].
extension ColumnSemanticsExt on Column {
  Widget withSemantics({String? label}) {
    String id = label ?? ((key is ValueKey) ? (key as ValueKey).value.toString() : runtimeType.toString());
    return Semantics(identifier: id, container: true, label: label, child: this);
  }
}

/// Extension on [Stack].
extension StackSemanticsExt on Stack {
  Widget withSemantics({String? label}) {
    String id = label ?? ((key is ValueKey) ? (key as ValueKey).value.toString() : runtimeType.toString());
    return Semantics(identifier: id, container: true, label: label, child: this);
  }
}

/// Extension on [Scaffold].
extension ScaffoldSemanticsExt on Scaffold {
  Widget withSemantics({String? label}) {
    String id = label ?? ((key is ValueKey) ? (key as ValueKey).value.toString() : runtimeType.toString());
    return Semantics(identifier: id, container: true, namesRoute: true, label: label, child: this);
  }
}

extension KeyExtension on Key? {
  ValueKey withSuffix(String suffix) {
    final String originalKey = (this as ValueKey).value.toString();
    return ValueKey('${originalKey}_$suffix');
  }

  String get keyToString => (this as ValueKey).value.toString();
}
