import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:zyktona_app_flutter/core/constant/app_colors.dart';
import 'package:zyktona_app_flutter/core/component/custom_filled_button.dart';
import 'package:zyktona_app_flutter/core/component/custom_outlined_button.dart';
import 'package:zyktona_app_flutter/core/localization/app_text.dart';
import 'package:zyktona_app_flutter/core/localization/locale_keys.g.dart';
import 'package:zyktona_app_flutter/core/routing/app_routes.dart';
import 'package:zyktona_app_flutter/gen/assets.gen.dart';

/// Third onboarding page
/// Displays favorites message with burger image and social login options
class OnboardingPageThree extends StatelessWidget {
  const OnboardingPageThree({super.key});

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
                        image: Assets.images.png.burger.provider(),
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
                      LocaleKeys.onboarding_pageThree_title,
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
                      LocaleKeys.onboarding_pageThree_description,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: AppColors.lightTextSecondary,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                        height: 1.70,
                      ),
                    ),

                    SizedBox(height: 40.h),

                    // Social login buttons
                    Column(
                      children: [
                        // Email button (filled) - First button
                        SizedBox(
                          width: double.infinity,
                          child: CustomFilledButton(
                            text: LocaleKeys.onboarding_continue_with_email,
                            onPressed: () {
                              // Handle Email login
                              context.go(AppRoutes.login);
                            },
                            icon: Image.asset(
                              Assets.images.icons.emailFilled.path,
                              width: 24.w,
                              height: 24.h,
                              color: AppColors.lightTextOnPrimary, // White for filled button
                              colorBlendMode: BlendMode.srcIn,
                            ),
                          ),
                        ),

                        SizedBox(height: 12.h),

                        // Apple and Google buttons side by side
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Apple button
                            CustomOutlinedButton(
                              width: 160.w,
                              text: LocaleKeys.onboarding_apple,
                              onPressed: () {
                                // Handle Apple login
                                context.go(AppRoutes.login);
                              },
                              icon: SvgPicture.asset(
                                Assets.images.icons.apple.path,
                                width: 24.w,
                                height: 24.h,
                                colorFilter: ColorFilter.mode(
                                  AppColors.lightPrimary, // Green color matching theme
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),

                            SizedBox(width: 12.w),

                            // Google button
                            CustomOutlinedButton(
                              width: 160.w,
                              text: LocaleKeys.onboarding_google,
                              onPressed: () {
                                // Handle Google login
                                context.go(AppRoutes.login);
                              },
                              icon: Image.asset(
                                Assets.images.icons.googlePng.path,
                                width: 24.w,
                                height: 24.h,
                              ),
                            ),
                          ],
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
