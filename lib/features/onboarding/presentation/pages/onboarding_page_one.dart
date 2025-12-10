import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:zyktona_app_flutter/core/constant/app_colors.dart';
import 'package:zyktona_app_flutter/core/component/custom_filled_button.dart';
import 'package:zyktona_app_flutter/core/component/custom_outlined_button.dart';
import 'package:zyktona_app_flutter/core/localization/app_text.dart';
import 'package:zyktona_app_flutter/core/localization/locale_keys.g.dart';
import 'package:zyktona_app_flutter/core/routing/app_routes.dart';
import 'package:zyktona_app_flutter/gen/assets.gen.dart';

/// First onboarding page
/// Displays welcome message with chef cooking image
class OnboardingPageOne extends StatelessWidget {
  const OnboardingPageOne({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(height: 40.h),
              
              // Image container at top
              Expanded(
                flex: 3,
                child: Center(
                  child: Container(
                    width: 374.w,
                    height: 374.h,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: Assets.images.png.chefCooking.provider(),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 40.h),

              // Content section at bottom
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Title and Description
                    AppText(
                      LocaleKeys.onboarding_pageOne_title,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.displayLarge?.copyWith(
                        color: AppColors.lightTextPrimary,
                        fontSize: 32.sp,
                        fontWeight: FontWeight.w700,
                        height: 1.20,
                        letterSpacing: -0.64,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    AppText(
                      LocaleKeys.onboarding_pageOne_description,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: AppColors.lightTextSecondary,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                        height: 1.70,
                      ),
                    ),

                    SizedBox(height: 40.h),

                    // Page indicator dots
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Active dot (page 1)
                        Container(
                          width: 24.w,
                          height: 8.h,
                          decoration: ShapeDecoration(
                            color: AppColors.lightPrimary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                          ),
                        ),
                        SizedBox(width: 8.w),
                        // Inactive dot (page 2)
                        Container(
                          width: 8.w,
                          height: 8.h,
                          decoration: ShapeDecoration(
                            color: AppColors.lightInactiveIndicator,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                          ),
                        ),
                        SizedBox(width: 8.w),
                        // Inactive dot (page 3)
                        Container(
                          width: 8.w,
                          height: 8.h,
                          decoration: ShapeDecoration(
                            color: AppColors.lightInactiveIndicator,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 16.h),

                    // Buttons row
                    Row(
                      children: [
                        // Skip button
                        CustomOutlinedButton(
                          text: LocaleKeys.onboarding_skip,
                          onPressed: () {
                            context.go(AppRoutes.login);
                          },
                        ),

                        SizedBox(width: 8.w),

                        // Next button
                        Expanded(
                          child: CustomFilledButton(
                            text: LocaleKeys.onboarding_next,
                            onPressed: () {
                              context.push(AppRoutes.onboardingPageTwo);
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 32.h),
            ],
          ),
        ),
      ),
    );
  }
}
