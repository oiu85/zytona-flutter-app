import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../localization/app_text.dart';
import '../theme/app_color_extension.dart';

/// Reusable custom text field component
/// Follows the app's design system and theme
class CustomTextField extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final double? width;
  final double? height;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? maxLines;
  final int? minLines;
  final bool enabled;
  final TextAlign textAlign;
  final String? labelKey; // Localization key for label
  final String? hintKey; // Localization key for hint

  const CustomTextField({
    super.key,
    this.labelText,
    this.hintText,
    this.labelKey,
    this.hintKey,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.onChanged,
    this.validator,
    this.width,
    this.height,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLines = 1,
    this.minLines,
    this.enabled = true,
    this.textAlign = TextAlign.start,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscure = false;

  @override
  void initState() {
    super.initState();
    _obscure = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.extension<AppColorExtension>()!;

    return SizedBox(
      width: widget.width ?? double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          if ((widget.labelText != null && widget.labelText!.isNotEmpty) ||
              widget.labelKey != null) ...[
            widget.labelKey != null
                ? AppText(
                    widget.labelKey!,
                    style: theme.textTheme.labelLarge?.copyWith(
                      color: colors.textPrimary,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                : Text(
                    widget.labelText!,
                    style: theme.textTheme.labelLarge?.copyWith(
                      color: colors.textPrimary,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
            SizedBox(height: 8.h),
          ],
          TextFormField(
            controller: widget.controller,
            keyboardType: widget.keyboardType,
            obscureText: _obscure,
            onChanged: widget.onChanged,
            validator: widget.validator,
            enabled: widget.enabled,
            maxLines: widget.obscureText ? 1 : widget.maxLines,
            minLines: widget.minLines,
            textAlign: widget.textAlign,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontSize: 14.sp,
              color: colors.textPrimary,
            ),
            decoration: InputDecoration(
              hintText: widget.hintKey != null
                  ? widget.hintKey!.tr()
                  : widget.hintText,
              hintStyle: theme.textTheme.bodyMedium?.copyWith(
                fontSize: 14.sp,
                color: colors.textSecondary,
              ),
              prefixIcon: widget.prefixIcon,
              suffixIcon: widget.obscureText
                  ? IconButton(
                      icon: Icon(
                        _obscure ? Icons.visibility_off : Icons.visibility,
                        size: 20.sp,
                        color: colors.textSecondary,
                      ),
                      onPressed: () => setState(() => _obscure = !_obscure),
                    )
                  : widget.suffixIcon,
              filled: true,
              fillColor: colors.background,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 16.h,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(
                  color: colors.textFieldBorder,
                  width: 1.w,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(
                  color: colors.textFieldBorder,
                  width: 1.w,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(
                  color: colors.primary,
                  width: 2.w,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(
                  color: Colors.red,
                  width: 1.w,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(
                  color: Colors.red,
                  width: 2.w,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(
                  color: colors.textFieldBorder,
                  width: 1.w,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

