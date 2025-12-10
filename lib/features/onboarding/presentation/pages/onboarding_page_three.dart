import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:zyktona_app_flutter/core/component/custom_filled_button.dart';
import 'package:zyktona_app_flutter/core/component/custom_outlined_button.dart';
import 'package:zyktona_app_flutter/core/di/app_dependencies.dart';
import 'package:zyktona_app_flutter/core/localization/app_text.dart';
import 'package:zyktona_app_flutter/core/localization/locale_keys.g.dart';
import 'package:zyktona_app_flutter/core/routing/app_routes.dart';
import 'package:zyktona_app_flutter/core/theme/app_color_extension.dart';
import 'package:zyktona_app_flutter/features/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:zyktona_app_flutter/features/onboarding/presentation/bloc/onboarding_event.dart';
import 'package:zyktona_app_flutter/features/onboarding/presentation/bloc/onboarding_state.dart';
import 'package:zyktona_app_flutter/gen/assets.gen.dart';

/// Third onboarding page
/// Displays favorites message with burger image and social login options
class OnboardingPageThree extends StatelessWidget {
  const OnboardingPageThree({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.extension<AppColorExtension>()!;

    return BlocProvider(
      create: (context) => getIt<OnboardingBloc>()..add(const ChangePage(2)),
      child: BlocListener<OnboardingBloc, OnboardingState>(
        listener: (context, state) {
          if (state.navigationAction == OnboardingNavigationAction.complete) {
            context.read<OnboardingBloc>().add(const ResetNavigationAction());
            context.go(AppRoutes.login);
          }
        },
        child: Builder(
          builder: (context) => _buildContent(context, theme, colors),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, ThemeData theme, AppColorExtension colors) {
    return Scaffold(
      backgroundColor: colors.background,
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
                        color: colors.textPrimary,
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
                        color: colors.textSecondary,
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
                        // Inactive dot (page 1)
                        Container(
                          width: 8.w,
                          height: 8.h,
                          decoration: ShapeDecoration(
                            color: colors.inactiveIndicator,
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
                            color: colors.inactiveIndicator,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                          ),
                        ),
                        SizedBox(width: 8.w),
                        // Active dot (page 3)
                        Container(
                          width: 24.w,
                          height: 8.h,
                          decoration: ShapeDecoration(
                            color: colors.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 16.h),

                    // Social login buttons
                    Column(
                      children: [
                        // Email button (filled) - First button
                        SizedBox(
                          width: double.infinity,
                          child: CustomFilledButton(
                            text: LocaleKeys.onboarding_continue_with_email,
                            onPressed: () {
                              context.read<OnboardingBloc>().add(const CompleteOnboarding());
                            },
                            icon: Image.asset(
                              Assets.images.icons.emailFilled.path,
                              width: 24.w,
                              height: 24.h,
                              color: colors.textOnPrimary, // White for filled button
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
                    context.read<OnboardingBloc>().add(const CompleteOnboarding());
                  },
                              icon: SvgPicture.asset(
                                Assets.images.icons.apple.path,
                                width: 24.w,
                                height: 24.h,
                                colorFilter: ColorFilter.mode(
                                  colors.primary, // Green color matching theme
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
                    context.read<OnboardingBloc>().add(const CompleteOnboarding());
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
