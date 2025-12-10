import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constant/app_colors.dart';
import '../localization/app_text.dart';

/// Custom outlined button with light background
/// Supports optional icon/image for social login buttons
class CustomOutlinedButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final double? width;
  final double? height;
  final EdgeInsets? padding;
  final Widget? icon;
  final Widget? child;

  const CustomOutlinedButton({
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

    return Container(
      width: width,
      height: height ?? 52.h,
      padding: padding ?? EdgeInsets.symmetric(horizontal: 32.w, vertical: 12.h),
      decoration: ShapeDecoration(
        color: AppColors.lightPrimary100, // #ECF1E8
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
                              color: AppColors.lightPrimary, // #54A312
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
                          color: AppColors.lightPrimary, // #54A312
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
