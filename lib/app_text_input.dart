import 'package:claryft_components/app_colors.dart';
import 'package:claryft_components/app_typography.dart';
import 'package:claryft_components/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ClaryftInputField extends StatefulWidget {
  final String? hint;
  final String? label;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final bool enabled;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? suffixErrorIcon;
  final double borderRadius;
  final Widget? prefixIcon;
  final AutovalidateMode autovalidateMode;
  final FocusNode? focusNode;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final Color? cursorColor;
  final bool showCursor;
  final bool autocorrect;
  final bool enableSuggestions;
  final Key? textFieldKey;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onSubmittedAction;
  final List<TextInputFormatter>? inputFormatters;
  final TextStyle? labelTextStyle;
  final TextStyle? errorTextStyle;
  final bool autoFocus;
  final bool ignorePointers;
  final String? initialValue;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  final Function(String)? onChanged;
  final double? height;
  final bool? isDarkMode;
  final bool? isDense;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final double? width;
  final bool readOnly;
  final Widget? customSuffixIcon;
  final Widget? customPrefixIcon;
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? inputBorder;
  final Color? borderColor;
  final bool isPasswordField;

  const ClaryftInputField({
    super.key,
    this.hint,
    this.label,
    this.controller,
    this.keyboardType,
    this.validator,
    this.enabled = true,
    this.obscureText = false,
    this.suffixIcon,
    this.suffixErrorIcon,
    this.borderRadius = 10.0,
    this.prefixIcon,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.labelStyle,
    this.cursorColor,
    this.focusNode,
    this.autocorrect = false,
    this.enableSuggestions = false,
    this.onSubmittedAction,
    this.showCursor = true,
    this.textFieldKey,
    this.textInputAction,
    this.autoFocus = false,
    this.floatingLabelBehavior,
    this.height = 40,
    this.ignorePointers = false,
    this.initialValue,
    this.inputFormatters,
    this.isDarkMode,
    this.isDense,
    this.labelTextStyle,
    this.maxLength,
    this.maxLines,
    this.onChanged,
    this.width = 320,
    this.minLines,
    this.readOnly = false,
    this.customPrefixIcon,
    this.customSuffixIcon,
    this.contentPadding,
    this.inputBorder = InputBorder.none,
    this.hintStyle,
    this.errorTextStyle,
    this.borderColor,
    this.isPasswordField = false,
  });

  @override
  State<ClaryftInputField> createState() => _ClaryftInputFieldState();
}

class _ClaryftInputFieldState extends State<ClaryftInputField> {
  String? errorText;
  bool isFocused = false;
  late bool _obscureText;
  final textFieldKey = GlobalKey<FormFieldState>();
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(() {
      setState(() {
        isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget? prefixIcon = widget.customPrefixIcon ?? widget.prefixIcon;
    Widget? suffixIcon = widget.customSuffixIcon ?? widget.suffixIcon;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) ...[
          Text(widget.label ?? "", style: widget.labelTextStyle ?? AppTypography.small.copyWith(fontWeight: FontWeight.w500)),
          UIHelpers.tinySpace,
        ],
        FormField<String>(
          initialValue: widget.controller?.text,
          autovalidateMode: widget.autovalidateMode,
          validator: (value) {
            final error = widget.validator?.call(value);
            WidgetsBinding.instance.addPostFrameCallback((_) {
              setState(() {
                errorText = error;
              });
            });
            return error;
          },
          builder: (FormFieldState<String> field) {
            return Container(
              width: widget.width,
              decoration: BoxDecoration(
                color: !widget.enabled ? AppColors.lightGreyColor : null,
                borderRadius: BorderRadius.circular(widget.borderRadius),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (prefixIcon != null) Padding(padding: const EdgeInsets.only(left: 10, top: 16), child: prefixIcon),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          key: widget.textFieldKey,
                          controller: widget.controller,
                          initialValue: widget.controller == null ? widget.initialValue : null,
                          keyboardType: widget.keyboardType,
                          obscureText: widget.isPasswordField ? _obscureText : widget.obscureText,
                          enabled: widget.enabled,
                          autocorrect: widget.autocorrect,
                          enableSuggestions: widget.enableSuggestions,
                          focusNode: _focusNode,
                          autofocus: widget.autoFocus,
                          cursorColor: widget.cursorColor ?? AppColors.primaryColor,
                          inputFormatters: widget.inputFormatters,
                          maxLength: widget.maxLength,
                          maxLines: widget.maxLines ?? 1,
                          minLines: widget.minLines,
                          readOnly: widget.readOnly,
                          showCursor: widget.showCursor,
                          textInputAction: widget.textInputAction,
                          onFieldSubmitted: widget.onSubmittedAction,
                          onChanged: (value) {
                            field.didChange(value);
                            widget.onChanged?.call(value);
                            final error = widget.validator?.call(value);
                            setState(() {
                              errorText = error;
                            });
                          },
                          decoration: InputDecoration(
                            hintText: widget.hint,
                            errorText: errorText,
                            errorStyle: widget.errorTextStyle ?? AppTypography.mediumHint.copyWith(color: AppColors.errorColor),
                            hintStyle:
                                widget.hintStyle ??
                                AppTypography.hint.copyWith(fontWeight: FontWeight.w400, color: AppColors.shadowColor),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(widget.borderRadius),
                              borderSide: BorderSide(color: widget.borderColor ?? AppColors.darkGreyColor, width: 0.3),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(widget.borderRadius),
                              borderSide: BorderSide(color: widget.borderColor ?? AppColors.primaryColor),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(widget.borderRadius),
                              borderSide: BorderSide(color: widget.borderColor ?? AppColors.darkGreyColor, width: 0.3),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(widget.borderRadius),
                              borderSide: const BorderSide(color: AppColors.errorColor),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(widget.borderRadius),
                              borderSide: const BorderSide(color: AppColors.errorColor),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(widget.borderRadius),
                              borderSide: BorderSide(color: widget.borderColor ?? AppColors.lightGreyColor, width: 0.3),
                            ),
                            contentPadding: widget.contentPadding ?? const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                            isDense: true,
                            suffixIcon:
                                widget.isPasswordField
                                    ? suffixIcon
                                    : (errorText != null && errorText!.isNotEmpty
                                        ? widget.suffixErrorIcon ??
                                            const Icon(Icons.error_outline_rounded, color: AppColors.errorColor, size: 20)
                                        : suffixIcon),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
