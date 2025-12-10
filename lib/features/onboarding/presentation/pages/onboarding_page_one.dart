import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

/// First onboarding page
/// Displays welcome message with chef cooking image
class OnboardingPageOne extends StatelessWidget {
  const OnboardingPageOne({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.extension<AppColorExtension>()!;

    return BlocProvider(
      create: (context) => getIt<OnboardingBloc>()..add(const ChangePage(0)),
      child: BlocListener<OnboardingBloc, OnboardingState>(
        listener: (context, state) {
          if (state.navigationAction == OnboardingNavigationAction.nextPage) {
            context.read<OnboardingBloc>().add(const ResetNavigationAction());
            context.push(AppRoutes.onboardingPageTwo);
          } else if (state.navigationAction == OnboardingNavigationAction.complete) {
            context.read<OnboardingBloc>().add(const ResetNavigationAction());
            context.go(AppRoutes.login);
          }
        },
        child: _buildContent(theme, colors),
      ),
    );
  }

  Widget _buildContent(ThemeData theme, AppColorExtension colors) {
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
                        color: colors.textPrimary,
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
                        // Active dot (page 1)
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
                        // Inactive dot (page 3)
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
                      ],
                    ),

                    SizedBox(height: 16.h),

                    // Buttons row
                    Row(
                      children: [
                        // Skip button
                        BlocBuilder<OnboardingBloc, OnboardingState>(
                          builder: (context, state) {
                            return CustomOutlinedButton(
                              text: LocaleKeys.onboarding_skip,
                              onPressed: () {
                                context.read<OnboardingBloc>().add(const SkipOnboarding());
                              },
                            );
                          },
                        ),

                        SizedBox(width: 8.w),

                        // Next button
                        Expanded(
                          child: BlocBuilder<OnboardingBloc, OnboardingState>(
                            builder: (context, state) {
                              return CustomFilledButton(
                                text: LocaleKeys.onboarding_next,
                                onPressed: () {
                                  context.read<OnboardingBloc>().add(const NextPage());
                                },
                              );
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
