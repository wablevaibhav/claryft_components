// import 'package:claryft_components/ui_helpers.dart';
// import 'package:flutter/material.dart';

// class AppSingleSelectionDropdown extends StatefulWidget {
//   final List<DropdownItem> items;
//   final bool isMultiSelect;
//   final bool isSearchable;
//   final bool? isRequired;
//   final Color? requiredStarColor;
//   final List<DropdownItem> selectedItems;
//   final Function(List)? onSelectionChanged;
//   final String? Function(List<dynamic>?)? validator;
//   final String? dropdownHintText;
//   final TextStyle? dropdownHintTextStyle;
//   final TextStyle? searchHintStyle;
//   final String? searchHintText;
//   final TextStyle? errorTextStyle;
//   final TextStyle? selectedTextStyle;
//   final TextStyle? dropdownItemsTextStyle;
//   final String? headerTitle;
//   final Color? borderColor;
//   final Color? suffixIconColor;
//   final Color? prefixIconColor;
//   final double? width;
//   final double? height;
//   final double? largeTextWidth;
//   final IconData? prefixIcon;
//   final IconData? suffixIcon;
//   final TextStyle? headerTitleStyle;
//   final Color? dropDownBorderColor;
//   final IconData? headerTitleIcon;
//   final Color? headerTitleIconColor;
//   final AutovalidateMode autovalidateMode;

//   const AppSingleSelectionDropdown({
//     super.key,
//     required this.items,
//     required this.isMultiSelect,
//     required this.isSearchable,
//     this.selectedItems = const <DropdownItem>[],
//     this.onSelectionChanged,
//     this.suffixIconColor,
//     this.prefixIconColor,
//     this.width,
//     this.height,
//     this.prefixIcon,
//     this.suffixIcon,
//     this.dropDownBorderColor,
//     this.dropdownItemsTextStyle,
//     this.borderColor,
//     this.validator,
//     this.autovalidateMode = AutovalidateMode.onUserInteraction,
//     this.errorTextStyle,
//     this.isRequired,
//     this.requiredStarColor,
//     this.headerTitle,
//     this.headerTitleStyle,
//     this.headerTitleIcon,
//     this.headerTitleIconColor,
//     this.dropdownHintText,
//     this.dropdownHintTextStyle,
//     this.searchHintStyle,
//     this.searchHintText,
//     this.selectedTextStyle,
//     this.largeTextWidth,
//   });

//   @override
//   State<AppSingleSelectionDropdown> createState() => _CustomDropdownState();
// }

// class _CustomDropdownState extends State<AppSingleSelectionDropdown> {
//   final LayerLink _layerLink = LayerLink();
//   List<DropdownItem> _selectedItems = [];
//   List<DropdownItem> _filteredItems = [];
//   String? errorText;
//   final TextEditingController _searchController = TextEditingController();
//   OverlayEntry? _dropdownOverlay;
//   final dropdownFieldKey = GlobalKey<FormFieldState>();

//   @override
//   void initState() {
//     super.initState();
//     _selectedItems = List.from(widget.selectedItems);
//     _filteredItems = List.from(widget.items);
//   }

//   void _showDropdown(FormFieldState<List<DropdownItem>> field) {
//     final renderBox = context.findRenderObject() as RenderBox;
//     final dropdownOffset = renderBox.localToGlobal(Offset.zero);
//     final widgetSize = renderBox.size;
//     final screenHeight = MediaQuery.of(context).size.height;
//     final dropdownHeight = (widget.height ?? 55.0) + 10;

//     final spaceBelow = screenHeight - dropdownOffset.dy - widgetSize.height;
//     final spaceAbove = dropdownOffset.dy;

//     final shouldOpenAbove =
//         spaceBelow < dropdownHeight && spaceAbove >= dropdownHeight;

//     _dropdownOverlay = OverlayEntry(
//       builder:
//           (context) => GestureDetector(
//             behavior: HitTestBehavior.translucent,
//             onTap: _removeDropdown,
//             child: Stack(
//               children: [
//                 Positioned(
//                   width: widget.width ?? 250,
//                   child: CompositedTransformFollower(
//                     link: _layerLink,
//                     offset:
//                         shouldOpenAbove
//                             ? Offset(0, -180)
//                             : Offset(0, widgetSize.height),
//                     showWhenUnlinked: false,
//                     child: _dropdownWidget(field),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//     );

//     Overlay.of(context).insert(_dropdownOverlay!);
//   }

//   void _removeDropdown() {
//     _searchController.clear();
//     _filteredItems = List.from(widget.items);
//     _dropdownOverlay?.remove();
//     _dropdownOverlay = null;
//     setState(() {});
//   }

//   bool get _isDropdownOpen => _dropdownOverlay != null;

//   @override
//   Widget build(BuildContext context) {
//     return FormField<List<DropdownItem>>(
//       key: dropdownFieldKey,
//       autovalidateMode: widget.autovalidateMode,
//       initialValue: _selectedItems,
//       validator: (value) {
//         final error = widget.validator?.call(value);
//         WidgetsBinding.instance.addPostFrameCallback((_) {
//           setState(() {
//             errorText = error;
//           });
//         });
//         return error;
//       },
//       builder: (FormFieldState<List<DropdownItem>> field) {
//         return CompositedTransformTarget(
//           link: _layerLink,
//           child: GestureDetector(
//             behavior: HitTestBehavior.opaque,
//             onTap: () {
//               setState(() {
//                 if (_isDropdownOpen) {
//                   _removeDropdown();
//                 } else {
//                   _showDropdown(field);
//                 }
//               });
//             },
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 if (widget.headerTitle != null &&
//                     widget.headerTitle!.isNotEmpty)
//                   Row(
//                     children: [
//                       RichText(
//                         overflow: TextOverflow.ellipsis,
//                         text: TextSpan(
//                           text: widget.headerTitle ?? "Search",
//                           style:
//                               widget.headerTitleStyle ??
//                               CjTextStyle.normal.copyWith(
//                                 color: CjColors.greyLightMode.shade9,
//                               ),
//                           children: [
//                             if (widget.isRequired != null &&
//                                 widget.isRequired == true)
//                               WidgetSpan(
//                                 child: Transform.translate(
//                                   offset: Offset(0.2, -1),
//                                   child: Text(
//                                     "*",
//                                     style: CjTextStyle.hint.copyWith(
//                                       color:
//                                           widget.requiredStarColor ??
//                                           CjColors.blue,
//                                       fontWeight: CjTextStyle.semiBold,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                           ],
//                         ),
//                       ),
//                       UIHelpers.spacingSm,
//                       (widget.headerTitleIcon != null)
//                           ? Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 5),
//                             child: Icon(
//                               widget.headerTitleIcon,
//                               size: 20,
//                               color:
//                                   widget.headerTitleIconColor ??
//                                   CjColors.greyLightMode.shade6,
//                             ),
//                           )
//                           : SizedBox.shrink(),
//                     ],
//                   ),
//                 UIHelpers.smallSpace,
//                 _selectedDropdownView(
//                   height: widget.height,
//                   hintText: widget.dropdownHintText,
//                   hintTextStyle: widget.dropdownHintTextStyle,
//                   width: widget.width,
//                   prefixIcon: widget.prefixIcon,
//                   suffixIcon: widget.suffixIcon,
//                   prefixIconColor: widget.prefixIconColor,
//                   suffixIconColor: widget.suffixIconColor,
//                 ),
//                 if (errorText != null && errorText!.isNotEmpty) ...[
//                   UIHelpers.spacingXs,
//                   Text(
//                     errorText!,
//                     style:
//                         widget.errorTextStyle ??
//                         CjTextStyle.small.copyWith(color: CjColors.error),
//                   ),
//                 ],
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   Widget _dropdownWidget(FormFieldState<List<DropdownItem>> field) {
//     return Material(
//       elevation: 4,
//       borderRadius: CjRadiusConfig.radiusMd,
//       child: ConstrainedBox(
//         constraints: BoxConstraints(maxHeight: 300, minHeight: 100),
//         child: StatefulBuilder(
//           builder: (BuildContext context, StateSetter setState1) {
//             return Container(
//               padding: const EdgeInsets.all(4),
//               decoration: BoxDecoration(
//                 color: CjColors.white,
//                 borderRadius: CjRadiusConfig.radiusMd,
//               ),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   if (widget.isSearchable)
//                     Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(8),
//                         border: Border.all(
//                           width: 2,
//                           color: CjColors.greyLightMode.shade6,
//                         ),
//                       ),
//                       child: Padding(
//                         padding: EdgeInsets.only(top: 6),
//                         child: TextField(
//                           controller: _searchController,
//                           onChanged: (value) {
//                             setState1(() {
//                               _filteredItems =
//                                   widget.items
//                                       .where(
//                                         (item) => item.label
//                                             .toLowerCase()
//                                             .contains(value.toLowerCase()),
//                                       )
//                                       .toList();
//                             });
//                           },
//                           style: CjTextStyle.hint.copyWith(
//                             color: CjColors.greyLightMode.shade8,
//                           ),
//                           decoration: InputDecoration(
//                             hintText: widget.searchHintText ?? "Search",
//                             hintStyle:
//                                 widget.searchHintStyle ??
//                                 CjTextStyle.normal.copyWith(
//                                   color: CjColors.greyLightMode.shade8,
//                                 ),
//                             prefixIcon: Padding(
//                               padding: EdgeInsets.only(bottom: 6),
//                               child: Icon(
//                                 CjIcons.search,
//                                 size: 18,
//                                 color: CjColors.greyLightMode.shade6,
//                               ),
//                             ),
//                             border: InputBorder.none,
//                           ),
//                         ),
//                       ),
//                     ),
//                   Flexible(
//                     child: ListView.builder(
//                       shrinkWrap: true,
//                       itemCount: _filteredItems.length,
//                       itemBuilder: (context, index) {
//                         final item = _filteredItems[index];
//                         final isSelected = _selectedItems.contains(item);
//                         return Container(
//                           decoration: BoxDecoration(
//                             color:
//                                 isSelected
//                                     ? CjColors.greyLightMode.shade3
//                                     : CjColors.transparent,
//                             borderRadius:
//                                 isSelected
//                                     ? CjRadiusConfig.radiusMd
//                                     : CjRadiusConfig.radiusNone,
//                           ),
//                           child: ListTile(
//                             leading:
//                                 (item.isAssetImage == true &&
//                                         item.image != null)
//                                     ? ClipOval(
//                                       child: Container(
//                                         margin: EdgeInsets.symmetric(
//                                           horizontal: 4,
//                                         ),
//                                         decoration: BoxDecoration(
//                                           border: Border.all(
//                                             width: 0.5,
//                                             color:
//                                                 CjColors.greyLightMode.shade4,
//                                           ),
//                                         ),
//                                         height: 18,
//                                         width: 18,
//                                         child: item.image,
//                                       ),
//                                     )
//                                     : (item.isAssetImage == false &&
//                                         item.imageUrl != null &&
//                                         item.imageUrl!.isNotEmpty)
//                                     ? ClipOval(
//                                       child: Container(
//                                         margin: EdgeInsets.symmetric(
//                                           horizontal: 4,
//                                         ),
//                                         decoration: BoxDecoration(
//                                           border: Border.all(
//                                             width: 0.5,
//                                             color:
//                                                 CjColors.greyLightMode.shade4,
//                                           ),
//                                         ),
//                                         height: 18,
//                                         width: 18,
//                                         child: Image.network(
//                                           item.imageUrl!,
//                                           fit: BoxFit.cover,
//                                           errorBuilder: (
//                                             context,
//                                             error,
//                                             stackTrace,
//                                           ) {
//                                             return const Icon(
//                                               CjIcons.error,
//                                               size: 15,
//                                             );
//                                           },
//                                           loadingBuilder: (
//                                             context,
//                                             child,
//                                             loadingProgress,
//                                           ) {
//                                             return Icon(
//                                               CjIcons.refresh,
//                                               size: 15,
//                                             );
//                                           },
//                                         ),
//                                       ),
//                                     )
//                                     : (item.icon != null)
//                                     ? Icon(
//                                       item.icon,
//                                       size: 20,
//                                       color:
//                                           item.iconColor ??
//                                           CjColors.greyDarkMode.shade7,
//                                     )
//                                     : SizedBox.shrink(),
//                             title: Text(
//                               item.label,
//                               style:
//                                   widget.dropdownItemsTextStyle ??
//                                   CjTextStyle.hint.copyWith(
//                                     color: CjColors.greyLightMode.shade8,
//                                   ),
//                             ),
//                             trailing:
//                                 isSelected
//                                     ? const Icon(
//                                       CjIcons.tick,
//                                       color: CjColors.blue,
//                                     )
//                                     : null,
//                             onTap: () {
//                               setState1(() {
//                                 if (widget.isMultiSelect) {
//                                   _selectedItems.contains(item)
//                                       ? _selectedItems.remove(item)
//                                       : _selectedItems.add(item);

//                                   field.didChange(_selectedItems);
//                                 } else {
//                                   _selectedItems = [item];
//                                   field.didChange(_selectedItems);
//                                   _removeDropdown();
//                                 }
//                                 if (widget.onSelectionChanged != null) {
//                                   widget.onSelectionChanged!(_selectedItems);
//                                 }
//                               });
//                               print('$_selectedItems');
//                             },
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }

//   Widget _selectedDropdownView({
//     String? hintText,
//     Color? suffixIconColor,
//     Color? prefixIconColor,
//     IconData? prefixIcon,
//     IconData? suffixIcon,
//     double? width,
//     double? height,
//     TextStyle? hintTextStyle,
//   }) {
//     return Container(
//       width: width ?? 250,
//       height: height ?? 55,
//       padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
//       decoration: BoxDecoration(
//         color: CjColors.white,
//         border: Border.all(
//           color:
//               _isDropdownOpen
//                   ? CjColors.brand.shade8
//                   : widget.dropDownBorderColor ?? CjColors.greyLightMode.shade5,
//           width: _isDropdownOpen ? 2 : 1,
//         ),
//         borderRadius: CjRadiusConfig.radiusMd,
//       ),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Expanded(
//             child: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 (prefixIcon != null)
//                     ? Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 5),
//                       child: Icon(
//                         prefixIcon,
//                         size: 18,
//                         color: prefixIconColor ?? CjColors.greyLightMode.shade6,
//                       ),
//                     )
//                     : SizedBox.shrink(),
//                 _selectedItems.isEmpty
//                     ? Flexible(
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 4),
//                         child: Text(
//                           hintText ?? "Select",
//                           overflow: TextOverflow.clip,
//                           style:
//                               hintTextStyle ??
//                               CjTextStyle.hint.copyWith(
//                                 color: CjColors.greyLightMode.shade8,
//                                 fontWeight: CjTextStyle.medium,
//                               ),
//                         ),
//                       ),
//                     )
//                     : (widget.isMultiSelect)
//                     ? Expanded(
//                       child: SingleChildScrollView(
//                         scrollDirection: Axis.horizontal,
//                         physics: AlwaysScrollableScrollPhysics(),
//                         child: Row(
//                           children:
//                               _selectedItems.map((e) {
//                                 return Padding(
//                                   padding: const EdgeInsets.only(right: 4),
//                                   child: CJTag(
//                                     onTapCancel: () {
//                                       setState(() {
//                                         _selectedItems.remove(e);
//                                       });
//                                     },
//                                     label: e.label,
//                                     textWidth: widget.width ?? 250 - 100,
//                                     borderColor: CjColors.greyLightMode.shade7,
//                                     showCancelButton: true,
//                                     prefixIcon:
//                                         (e.icon != null) ? e.icon : null,
//                                     isAssetImage: e.isAssetImage ?? false,
//                                     imageUrl: e.imageUrl ?? '',
//                                     image: e.image,
//                                     textColor: CjColors.greyLightMode.shade9,
//                                     iconColor:
//                                         e.iconColor ??
//                                         CjColors.greyLightMode.shade7,
//                                     textStyle:
//                                         widget.selectedTextStyle ??
//                                         CjTextStyle.hint.copyWith(
//                                           color: CjColors.greyLightMode.shade9,
//                                         ),
//                                   ),
//                                 );
//                               }).toList(),
//                         ),
//                       ),
//                     )
//                     : CJTag(
//                       label:
//                           _selectedItems.firstOrNull?.label ?? "Not Selected",
//                       textWidth: widget.width ?? 250 - 100,
//                       prefixIcon:
//                           (_selectedItems.firstOrNull?.icon != null)
//                               ? _selectedItems.firstOrNull?.icon
//                               : null,
//                       isAssetImage:
//                           _selectedItems.firstOrNull?.isAssetImage ?? false,
//                       imageUrl: _selectedItems.firstOrNull?.imageUrl ?? '',
//                       image: _selectedItems.firstOrNull?.image,
//                       borderColor: CjColors.transparent,
//                       backgroundColor: CjColors.transparent,
//                       textColor: CjColors.greyLightMode.shade9,
//                       textStyle:
//                           widget.selectedTextStyle ??
//                           CjTextStyle.hint.copyWith(
//                             color: CjColors.greyLightMode.shade9,
//                           ),
//                     ),
//               ],
//             ),
//           ),
//           (suffixIcon != null)
//               ? Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 5),
//                 child: Icon(
//                   suffixIcon,
//                   size: 18,
//                   color: suffixIconColor ?? CjColors.greyLightMode.shade6,
//                 ),
//               )
//               : SizedBox.shrink(),
//         ],
//       ),
//     );
//   }
// }
