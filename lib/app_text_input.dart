import 'package:claryft_components/claryft_components.dart';
import 'package:flutter/material.dart';
import 'package:claryft_components/app_colors.dart';
import 'package:claryft_components/app_typography.dart';

class ClaryftInputField extends StatefulWidget {
  final String? label;
  final String? hint;
  final TextEditingController? controller;
  final String? initialValue;
  final bool isPassword;
  final TextInputType keyboardType;
  final bool enabled;
  final bool readOnly;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final TextInputAction? textInputAction;
  final int? maxLength;
  final int maxLines;
  final int minLines;
  final double borderRadius;

  const ClaryftInputField({
    super.key,
    this.label,
    this.hint,
    this.controller,
    this.initialValue,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.enabled = true,
    this.readOnly = false,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.onChanged,
    this.onSubmitted,
    this.textInputAction,
    this.maxLength,
    this.maxLines = 1,
    this.minLines = 1,
    this.borderRadius = 8,
  });

  @override
  State<ClaryftInputField> createState() => _ClaryftInputFieldState();
}

class _ClaryftInputFieldState extends State<ClaryftInputField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(widget.borderRadius),
      borderSide: BorderSide(color: AppColors.darkGreyColor, width: 0.8),
    );

    return TextFormField(
      key: widget.key?.withSuffix("input_field"),
      controller: widget.controller,
      initialValue: widget.controller == null ? widget.initialValue : null,
      keyboardType: widget.keyboardType,
      obscureText: _obscureText,
      enabled: widget.enabled,
      readOnly: widget.readOnly,
      textInputAction: widget.textInputAction,
      maxLength: widget.maxLength,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      validator: widget.validator,
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onSubmitted,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        labelText: widget.label,
        hintText: widget.hint,
        labelStyle: AppTypography.small.copyWith(color: AppColors.darkGreyColor),
        hintStyle: AppTypography.hint.copyWith(color: AppColors.shadowColor),
        prefixIcon: widget.prefixIcon,
        suffixIcon:
            widget.isPassword
                ? IconButton(
                  key: widget.key?.withSuffix("toggle_password_visibility"),
                  icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility, size: 20),
                  onPressed: () => setState(() => _obscureText = !_obscureText),
                ).withSemantics()
                : widget.suffixIcon,
        filled: true,
        fillColor: widget.enabled ? AppColors.whiteColor : AppColors.lightGreyColor,
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        isDense: true,
        border: border,
        enabledBorder: border,
        focusedBorder: border.copyWith(borderSide: const BorderSide(color: AppColors.primaryColor, width: 1.5)),
        errorBorder: border.copyWith(borderSide: const BorderSide(color: AppColors.errorColor, width: 1.2)),
        focusedErrorBorder: border.copyWith(borderSide: const BorderSide(color: AppColors.errorColor, width: 1.5)),
      ),
      style: AppTypography.small.copyWith(color: AppColors.blackColor),
    ).withSemantics();
  }
}
