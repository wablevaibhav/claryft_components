import 'package:claryft_components/claryft_components.dart';
import 'package:claryft_components/dropdown_item.dart';
import 'package:flutter/material.dart';

class AppMultiSelectionDropdown extends StatefulWidget {
  final List<DropdownItem> items;
  final bool isSearchable;
  final bool? isRequired;
  final Color? requiredStarColor;
  final List<DropdownItem>? selectedItems;
  final Function(List<DropdownItem>)? onSelectionChanged;
  final String? Function(List<DropdownItem>)? validator;
  final String? dropdownHintText;
  final TextStyle? dropdownHintTextStyle;
  final TextStyle? searchHintStyle;
  final String? searchHintText;
  final TextStyle? errorTextStyle;
  final TextStyle? selectedTextStyle;
  final TextStyle? dropdownItemsTextStyle;
  final String? headerTitle;
  final Color? borderColor;
  final Color? suffixIconColor;
  final Color? prefixIconColor;
  final double? width;
  final double? height;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final TextStyle? headerTitleStyle;
  final Color? dropDownBorderColor;
  final IconData? headerTitleIcon;
  final Color? headerTitleIconColor;
  final AutovalidateMode autovalidateMode;

  const AppMultiSelectionDropdown({
    super.key,
    required this.items,
    this.isSearchable = false,
    this.selectedItems,
    this.onSelectionChanged,
    this.suffixIconColor,
    this.prefixIconColor,
    this.width,
    this.height,
    this.prefixIcon,
    this.suffixIcon,
    this.dropDownBorderColor,
    this.dropdownItemsTextStyle,
    this.borderColor,
    this.validator,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.errorTextStyle,
    this.isRequired,
    this.requiredStarColor,
    this.headerTitle,
    this.headerTitleStyle,
    this.headerTitleIcon,
    this.headerTitleIconColor,
    this.dropdownHintText,
    this.dropdownHintTextStyle,
    this.searchHintStyle,
    this.searchHintText,
    this.selectedTextStyle,
  });

  @override
  State<AppMultiSelectionDropdown> createState() => _MultiDropdownState();
}

class _MultiDropdownState extends State<AppMultiSelectionDropdown> {
  final LayerLink _layerLink = LayerLink();
  List<DropdownItem> _selectedItems = [];
  List<DropdownItem> _filteredItems = [];
  String? errorText;
  final TextEditingController _searchController = TextEditingController();
  OverlayEntry? _dropdownOverlay;
  final dropdownFieldKey = GlobalKey<FormFieldState>();
  int? _hoveredIndex;

  @override
  void initState() {
    super.initState();
    _selectedItems = widget.selectedItems ?? [];
    _filteredItems = List.from(widget.items);
  }

  void _showDropdown(FormFieldState<List<DropdownItem>> field) {
    final renderBox = context.findRenderObject() as RenderBox;
    final dropdownOffset = renderBox.localToGlobal(Offset.zero);
    final widgetSize = renderBox.size;
    final screenHeight = MediaQuery.of(context).size.height;
    final dropdownHeight = (widget.height ?? 40.0) + 10;

    final spaceBelow = screenHeight - dropdownOffset.dy - widgetSize.height;
    final spaceAbove = dropdownOffset.dy;

    final shouldOpenAbove =
        spaceBelow < dropdownHeight && spaceAbove >= dropdownHeight;

    _dropdownOverlay = OverlayEntry(
      builder:
          (context) => GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: _removeDropdown,
            child: Stack(
              children: [
                Positioned(
                  width: widget.width ?? 250,
                  child: CompositedTransformFollower(
                    link: _layerLink,
                    offset:
                        shouldOpenAbove
                            ? Offset(0, -180)
                            : Offset(0, widgetSize.height),
                    showWhenUnlinked: false,
                    child: _dropdownWidget(field),
                  ),
                ),
              ],
            ),
          ),
    );

    Overlay.of(context).insert(_dropdownOverlay!);
  }

  void _removeDropdown() {
    _searchController.clear();
    _filteredItems = List.from(widget.items);
    _dropdownOverlay?.remove();
    _dropdownOverlay = null;
    setState(() {});
  }

  bool get _isDropdownOpen => _dropdownOverlay != null;

  @override
  Widget build(BuildContext context) {
    return FormField<List<DropdownItem>>(
      key: dropdownFieldKey,
      autovalidateMode: widget.autovalidateMode,
      initialValue: _selectedItems,
      validator: (value) {
        final error = widget.validator?.call(value ?? []);
        WidgetsBinding.instance.addPostFrameCallback((_) {
          setState(() {
            errorText = error;
          });
        });
        return error;
      },
      builder: (FormFieldState<List<DropdownItem>> field) {
        return CompositedTransformTarget(
          link: _layerLink,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              setState(() {
                if (_isDropdownOpen) {
                  _removeDropdown();
                } else {
                  _showDropdown(field);
                }
              });
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (widget.headerTitle != null &&
                    widget.headerTitle!.isNotEmpty)
                  Row(
                    children: [
                      Text(
                        widget.headerTitle ?? "",
                        style:
                            widget.headerTitleStyle ??
                            AppTypography.small.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColors.blackColor,
                            ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (widget.isRequired == true)
                        Text(
                          "*",
                          style: AppTypography.normal.copyWith(
                            color:
                                widget.requiredStarColor ??
                                AppColors.errorColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      UIHelpers.tinySpace,
                      if (widget.headerTitleIcon != null)
                        Icon(
                          widget.headerTitleIcon,
                          size: 20,
                          color:
                              widget.headerTitleIconColor ??
                              AppColors.blackColor,
                        ),
                    ],
                  ),
                UIHelpers.tinySpace,
                _selectedDropdownView(
                  hintText: widget.dropdownHintText,
                  hintTextStyle: widget.dropdownHintTextStyle,
                  width: widget.width,
                  height: widget.height,
                  prefixIcon: widget.prefixIcon,
                  suffixIcon: widget.suffixIcon,
                  prefixIconColor: widget.prefixIconColor,
                  suffixIconColor: widget.suffixIconColor,
                ),
                if (errorText != null && errorText!.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      errorText ?? "",
                      style:
                          widget.errorTextStyle ??
                          AppTypography.normal.copyWith(
                            color: AppColors.errorColor,
                          ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _dropdownWidget(FormFieldState<List<DropdownItem>> field) {
    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: widget.dropDownBorderColor ?? AppColors.greyColor,
            width: 0.7,
          ),
        ),
        constraints: const BoxConstraints(maxHeight: 200, minHeight: 100),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.isSearchable)
              Padding(
                padding: const EdgeInsets.all(4),
                child: SizedBox(
                  height: 40,
                  child: TextField(
                    controller: _searchController,
                    onChanged: (value) {
                      setState(() {
                        _filteredItems =
                            widget.items
                                .where(
                                  (item) => item.label.toLowerCase().contains(
                                    value.toLowerCase(),
                                  ),
                                )
                                .toList();
                      });
                    },
                    style: AppTypography.normal.copyWith(
                      color: AppColors.blackColor,
                    ),
                    decoration: InputDecoration(
                      hintText: widget.searchHintText ?? "Search",
                      hintStyle:
                          widget.searchHintStyle ??
                          AppTypography.normal.copyWith(
                            color: AppColors.greyColor,
                          ),
                      prefixIcon: const Icon(Icons.search, size: 18),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: AppColors.greyColor,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: AppColors.greyColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: _filteredItems.length,
                itemBuilder: (context, index) {
                  final item = _filteredItems[index];
                  final isSelected = _selectedItems.contains(item);
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 2,
                    ), // spacing between items
                    child: MouseRegion(
                      onEnter: (_) {
                        setState(() {
                          _hoveredIndex = index;
                        });
                      },
                      onExit: (_) {
                        setState(() {
                          _hoveredIndex = null;
                        });
                      },
                      child: Material(
                        color:
                            isSelected
                                ? AppColors.primaryColor
                                : _hoveredIndex == index
                                ? AppColors.primaryColor.withOpacity(0.3)
                                : AppColors.transparentColor,
                        borderRadius: BorderRadius.circular(8),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              if (isSelected) {
                                _selectedItems.remove(item);
                              } else {
                                _selectedItems.add(item);
                              }
                              field.didChange(_selectedItems);
                              widget.onSelectionChanged?.call(_selectedItems);
                            });
                          },
                          borderRadius: BorderRadius.circular(8),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            child: Row(
                              children: [
                                if (_buildLeadingWidget(item) != null) ...[
                                  _buildLeadingWidget(item)!,
                                  UIHelpers.tinySpace,
                                ],
                                Expanded(
                                  child: Text(
                                    item.label,
                                    style:
                                        widget.dropdownItemsTextStyle ??
                                        AppTypography.small.copyWith(
                                          color:
                                              isSelected
                                                  ? AppColors.whiteColor
                                                  : AppColors.blackColor,
                                        ),
                                  ),
                                ),
                                if (isSelected)
                                  const Icon(
                                    Icons.check,
                                    color: AppColors.whiteColor,
                                    size: 16,
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget? _buildLeadingWidget(DropdownItem item) {
    if (item.isAssetImage == true && item.image != null) {
      return ClipOval(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            border: Border.all(width: 0.5, color: AppColors.greyColor),
          ),
          height: 18,
          width: 18,
          child: item.image,
        ),
      );
    } else if (item.isAssetImage == false &&
        item.imageUrl?.isNotEmpty == true) {
      return ClipOval(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            border: Border.all(width: 0.5, color: AppColors.greyColor),
          ),
          height: 18,
          width: 18,
          child: Image.network(
            item.imageUrl!,
            fit: BoxFit.cover,
            errorBuilder:
                (context, error, stackTrace) =>
                    const Icon(Icons.error, size: 15),
            loadingBuilder:
                (context, child, loadingProgress) =>
                    const Icon(Icons.refresh, size: 15),
          ),
        ),
      );
    } else if (item.icon != null) {
      return Icon(
        item.icon,
        size: 20,
        color: item.iconColor ?? AppColors.greyColor,
      );
    }
    return null;
  }

  Widget _selectedDropdownView({
    String? hintText,
    Color? suffixIconColor,
    Color? prefixIconColor,
    IconData? prefixIcon,
    IconData? suffixIcon,
    double? width,
    double? height,
    TextStyle? hintTextStyle,
  }) {
    return Container(
      width: width ?? 250,
      height: height ?? 40,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        border: Border.all(
          color:
              _isDropdownOpen
                  ? AppColors.primaryColor
                  : widget.dropDownBorderColor ?? AppColors.greyColor,
          width: _isDropdownOpen ? 2 : 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                if (prefixIcon != null)
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Icon(
                      prefixIcon,
                      size: 18,
                      color: prefixIconColor ?? AppColors.greyColor,
                    ),
                  ),
                Expanded(
                  child: Text(
                    _selectedItems.isNotEmpty
                        ? _selectedItems.map((e) => e.label).join(', ')
                        : hintText ?? "Select",
                    overflow: TextOverflow.ellipsis,
                    style:
                        widget.selectedTextStyle ??
                        hintTextStyle ??
                        AppTypography.hint.copyWith(
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                ),
              ],
            ),
          ),
          if (suffixIcon != null)
            Icon(
              suffixIcon,
              size: 18,
              color: suffixIconColor ?? AppColors.greyColor,
            ),
        ],
      ),
    );
  }
}
