import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../localization/app_text.dart';
import '../theme/app_color_extension.dart';

/// Custom filled button with gradient background
/// Matches Figma design for healthy food app
/// Supports optional icon/image for social login buttons
class CustomFilledButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final double? width;
  final double? height;
  final EdgeInsets? padding;
  final Widget? icon;
  final Widget? child;

  const CustomFilledButton({
    super.key,
    required this.text,
    this.onPressed,
    this.width,
    this.height,
    this.padding,
    this.icon,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.extension<AppColorExtension>()!;

    return Container(
      width: width ?? double.infinity,
      height: height ?? 52.h,
      padding: padding ?? EdgeInsets.symmetric(horizontal: 32.w, vertical: 12.h),
      decoration: ShapeDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.50, -0.00),
          end: Alignment(0.50, 1.00),
          colors: [
            colors.gradientStart,
            colors.gradientEnd,
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(12.r),
          child: Center(
            child: child ??
                (icon != null
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          icon!,
                          SizedBox(width: 8.w),
                          AppText(
                            text,
                            style: theme.textTheme.labelLarge?.copyWith(
                              color: colors.textOnPrimary,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w700,
                              height: 1.70,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      )
                    : AppText(
                        text,
                        style: theme.textTheme.labelLarge?.copyWith(
                          color: colors.textOnPrimary,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w700,
                          height: 1.70,
                        ),
                        textAlign: TextAlign.center,
                      )),
          ),
        ),
      ),
    );
  }
}
