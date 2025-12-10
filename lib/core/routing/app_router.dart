import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:zyktona_app_flutter/core/routing/app_routes.dart';
import 'package:zyktona_app_flutter/core/shared/app_navigator_key.dart';
import 'package:zyktona_app_flutter/core/storage/app_storage_service.dart';
import 'package:zyktona_app_flutter/core/auth/guest_mode_guard.dart';
import 'package:zyktona_app_flutter/core/di/app_dependencies.dart';
import 'package:zyktona_app_flutter/core/routing/navigation_observer.dart';
// TODO: Uncomment when features are created
// import 'package:zyktona_app_flutter/features/splassh_screen/presentation/pages/splash_screen_page.dart';
import 'package:zyktona_app_flutter/features/onboarding/presentation/pages/onboarding_page_one.dart';
import 'package:zyktona_app_flutter/features/onboarding/presentation/pages/onboarding_page_two.dart';
import 'package:zyktona_app_flutter/features/onboarding/presentation/pages/onboarding_page_three.dart';
// import 'package:zyktona_app_flutter/features/auth/presentation/pages/signup_page.dart';
import 'package:zyktona_app_flutter/features/auth/presentation/pages/login_page.dart';
// import 'package:zyktona_app_flutter/features/auth/presentation/pages/check_email_page.dart';
// import 'package:zyktona_app_flutter/features/auth/presentation/pages/verify_otp_page.dart';
// import 'package:zyktona_app_flutter/features/auth/presentation/pages/reset_password_page.dart';
// import 'package:zyktona_app_flutter/features/home/presentation/pages/main_navigation_page.dart';
// import 'package:zyktona_app_flutter/features/donate/presentation/pages/donate_page.dart';
// import 'package:zyktona_app_flutter/features/campaign/presentation/pages/campaign_page.dart';
// import 'package:zyktona_app_flutter/features/subcategories_campaign/presentation/pages/subcategories_campaign_page.dart';
// import 'package:zyktona_app_flutter/features/calculator/presentation/pages/calculator_type_page.dart';
// import 'package:zyktona_app_flutter/features/calculator/presentation/pages/zakat_calculator_page.dart';
// import 'package:zyktona_app_flutter/features/get_known_us/presentation/pages/get_known_us_page.dart';
// import 'package:zyktona_app_flutter/features/blog/presentation/pages/blog_list_page.dart';
// import 'package:zyktona_app_flutter/features/blog/presentation/pages/blog_detail_page.dart';
// import 'package:zyktona_app_flutter/features/payment/presentation/pages/payment_page.dart';
// import 'package:zyktona_app_flutter/features/profile/presentation/pages/profile_page.dart';
// import 'package:zyktona_app_flutter/features/my_contributions/presentation/pages/my_donations_page.dart';
// import 'package:zyktona_app_flutter/features/my_subscriptions/presentation/pages/my_subscriptions_page.dart';
// import 'package:zyktona_app_flutter/features/contact_us/presentation/pages/contact_us_page.dart';
// import 'package:zyktona_app_flutter/features/menu/presentation/pages/privacy_policy_page.dart';
// import 'package:zyktona_app_flutter/features/menu/presentation/pages/terms_and_conditions_page.dart';
// import 'package:zyktona_app_flutter/features/trancparncy_file/presentation/pages/transparency_file_page.dart';
// import 'package:zyktona_app_flutter/features/trancparncy_file/presentation/pages/transparency_donation_log_page.dart';
// import 'package:zyktona_app_flutter/features/global_search/presentation/pages/global_search_page.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    navigatorKey: appNavigatorKey,
    initialLocation: AppRoutes.onboardingPageOne,
    observers: [
      AppRouteObserver(getIt<NavigationStateNotifier>()),
    ],
    redirect: (context, state) async {
      final storageService = getIt<AppStorageService>();
      final guestModeGuard = getIt<GuestModeGuard>();
      final loc = state.matchedLocation;
      
      // On web, skip splash/onboarding and go straight to home
      if (kIsWeb) {
        if (loc == AppRoutes.splash || loc.startsWith('/onboarding')) {
          return AppRoutes.home;
        }
        return null;
      }
      
      // Always allow splash screen to show (it handles navigation internally)
      // If user tries to access splash, let it show
      if (loc == AppRoutes.splash) {
        return null; // Allow splash to show
      }
      
      // Check if user is authenticated
      final isUserLoggedIn = await guestModeGuard.isUserLoggedIn();
      
      // If user is authenticated and tries to access login/signup, redirect to home
      if (isUserLoggedIn) {
        if (loc == AppRoutes.login || loc == AppRoutes.signup) {
          return AppRoutes.home;
        }
        // If authenticated, prevent access to onboarding pages
        if (loc.startsWith('/onboarding')) {
          return AppRoutes.home;
        }
        return null;
      }
      
      // User is not authenticated - check onboarding status
      final isOnboardingSkipped = await storageService.isOnboardingSkipped();
      
      // If onboarding was skipped but user is not logged in, prevent access to onboarding pages
      // Allow auth pages (login, signup, etc.) to be accessible
      if (isOnboardingSkipped) {
        if (loc.startsWith('/onboarding')) {
          // If user tries to access onboarding but it's skipped and they're not logged in, go to login
          return AppRoutes.login;
        }
        return null;
      }
      
      return null;
    },
    routes: [
      // TODO: Uncomment when features are created
      // GoRoute(
      //   path: AppRoutes.splash,
      //   name: 'splash',
      //   pageBuilder: (context, state) =>
      //       MaterialPage(key: state.pageKey, child: const SplashScreenPage()),
      // ),
      GoRoute(
        path: AppRoutes.onboardingPageOne,
        name: 'onboardingPageOne',
        pageBuilder: (context, state) =>
            MaterialPage(key: state.pageKey, child: const OnboardingPageOne()),
      ),
      GoRoute(
        path: AppRoutes.onboardingPageTwo,
        name: 'onboardingPageTwo',
        pageBuilder: (context, state) =>
            MaterialPage(key: state.pageKey, child: const OnboardingPageTwo()),
      ),
      GoRoute(
        path: AppRoutes.onboardingPageThree,
        name: 'onboardingPageThree',
        pageBuilder: (context, state) =>
            MaterialPage(key: state.pageKey, child: const OnboardingPageThree()),
      ),
      // GoRoute(
      //   path: AppRoutes.signup,
      //   name: 'signup',
      //   pageBuilder: (context, state) =>
      //       MaterialPage(key: state.pageKey, child: const SignupPage()),
      // ),
      GoRoute(
        path: AppRoutes.login,
        name: 'login',
        pageBuilder: (context, state) =>
            MaterialPage(key: state.pageKey, child: const LoginPage()),
      ),
      // GoRoute(
      //   path: AppRoutes.checkEmail,
      //   name: 'checkEmail',
      //   pageBuilder: (context, state) =>
      //       MaterialPage(key: state.pageKey, child: const CheckEmailPage()),
      // ),
      // GoRoute(
      //   path: AppRoutes.verifyOtp,
      //   name: 'verifyOtp',
      //   pageBuilder: (context, state) {
      //     // Handle both Map and String extra types for backward compatibility
      //     String email = 'example@email.com';
      //     bool isForPasswordReset = true;
      //     bool sendCodeOnInit = false;
      //     
      //     if (state.extra is Map<String, dynamic>) {
      //       final extra = state.extra as Map<String, dynamic>;
      //       email = extra['email'] as String? ?? email;
      //       isForPasswordReset = extra['isForPasswordReset'] as bool? ?? true;
      //       sendCodeOnInit = extra['sendCodeOnInit'] as bool? ?? false;
      //     } else if (state.extra is String) {
      //       email = state.extra as String;
      //     }
      //     
      //     return MaterialPage(
      //       key: state.pageKey,
      //       child: VerifyOtpPage(
      //         email: email,
      //         isForPasswordReset: isForPasswordReset,
      //         sendCodeOnInit: sendCodeOnInit,
      //       ),
      //     );
      //   },
      // ),
      // GoRoute(
      //   path: AppRoutes.resetPassword,
      //   name: 'resetPassword',
      //   pageBuilder: (context, state) {
      //     String email = '';
      //     String code = '';
      //     
      //     if (state.extra is Map<String, dynamic>) {
      //       final extra = state.extra as Map<String, dynamic>;
      //       email = extra['email'] as String? ?? '';
      //       code = extra['code'] as String? ?? '';
      //     }
      //     
      //     return MaterialPage(
      //       key: state.pageKey,
      //       child: ResetPasswordPage(
      //         email: email,
      //         code: code,
      //       ),
      //     );
      //   },
      // ),
      // GoRoute(
      //   path: AppRoutes.home,
      //   name: 'home',
      //   pageBuilder: (context, state) {
      //     final initialIndex = state.extra as int? ?? 0;
      //     return MaterialPage(
      //       key: state.pageKey,
      //       child: MainNavigationPage(initialIndex: initialIndex),
      //     );
      //   },
      // ),
      // GoRoute(
      //   path: AppRoutes.donate,
      //   name: 'donate',
      //   pageBuilder: (context, state) =>
      //       MaterialPage(key: state.pageKey, child: const DonatePage()),
      // ),
      // GoRoute(
      //   path: AppRoutes.campaign,
      //   name: 'campaign',
      //   pageBuilder: (context, state) {
      //     final campaignId = state.extra as String?;
      //     return MaterialPage(
      //       key: state.pageKey,
      //       child: CampaignPage(campaignId: campaignId),
      //     );
      //   },
      // ),
      // GoRoute(
      //   path: AppRoutes.catalogDetail,
      //   name: 'catalogDetail',
      //   pageBuilder: (context, state) {
      //     final category = state.extra as String?;
      //     return MaterialPage(
      //       key: state.pageKey,
      //       child: SubcategoriesCampaignPage(category: category),
      //     );
      //   },
      // ),
      // GoRoute(
      //   path: AppRoutes.calculatorType,
      //   name: 'calculatorType',
      //   pageBuilder: (context, state) =>
      //       MaterialPage(key: state.pageKey, child: const CalculatorTypePage()),
      // ),
      // GoRoute(
      //   path: AppRoutes.zakatCalculator,
      //   name: 'zakatCalculator',
      //   pageBuilder: (context, state) =>
      //       MaterialPage(key: state.pageKey, child: const ZakatCalculatorPage()),
      // ),
      // GoRoute(
      //   path: AppRoutes.getKnownUs,
      //   name: 'getKnownUs',
      //   pageBuilder: (context, state) =>
      //       MaterialPage(key: state.pageKey, child: const GetKnownUsPage()),
      // ),
      // GoRoute(
      //   path: AppRoutes.blog,
      //   name: 'blog',
      //   pageBuilder: (context, state) =>
      //       MaterialPage(key: state.pageKey, child: const BlogListPage()),
      // ),
      // GoRoute(
      //   path: AppRoutes.blogDetail,
      //   name: 'blogDetail',
      //   pageBuilder: (context, state) {
      //     // Extract postId from path parameters
      //     final postIdStr = state.pathParameters['id'];
      //     final postId = postIdStr != null ? int.tryParse(postIdStr) : null;
      //     // Also check extra for backward compatibility
      //     final extraPostId = state.extra is int ? state.extra as int? : null;
      //     return MaterialPage(
      //       key: state.pageKey,
      //       child: BlogDetailPage(postId: postId ?? extraPostId),
      //     );
      //   },
      // ),
      // GoRoute(
      //   path: AppRoutes.payment,
      //   name: 'payment',
      //   pageBuilder: (context, state) {
      //     final extra = state.extra as Map<String, dynamic>?;
      //     final campaignId = extra?['campaignId'] as int?;
      //     final targetType = extra?['targetType'] as String? ?? 'general';
      //     return MaterialPage(
      //       key: state.pageKey,
      //       child: PaymentPage(
      //         campaignId: campaignId,
      //         targetType: targetType,
      //       ),
      //     );
      //   },
      // ),
      // GoRoute(
      //   path: AppRoutes.profile,
      //   name: 'profile',
      //   pageBuilder: (context, state) =>
      //       MaterialPage(key: state.pageKey, child: const ProfilePage()),
      // ),
      // GoRoute(
      //   path: AppRoutes.myDonations,
      //   name: 'myDonations',
      //   pageBuilder: (context, state) =>
      //       MaterialPage(key: state.pageKey, child: const MyDonationsPage()),
      // ),
      // GoRoute(
      //   path: AppRoutes.mySubscriptions,
      //   name: 'mySubscriptions',
      //   pageBuilder: (context, state) =>
      //       MaterialPage(key: state.pageKey, child: const MySubscriptionsPage()),
      // ),
      // GoRoute(
      //   path: AppRoutes.contactUs,
      //   name: 'contactUs',
      //   pageBuilder: (context, state) =>
      //       MaterialPage(key: state.pageKey, child: const ContactUsPage()),
      // ),
      // GoRoute(
      //   path: AppRoutes.privacyPolicy,
      //   name: 'privacyPolicy',
      //   pageBuilder: (context, state) =>
      //       MaterialPage(key: state.pageKey, child: const PrivacyPolicyPage()),
      // ),
      // GoRoute(
      //   path: AppRoutes.termsAndConditions,
      //   name: 'termsAndConditions',
      //   pageBuilder: (context, state) =>
      //       MaterialPage(key: state.pageKey, child: const TermsAndConditionsPage()),
      // ),
      // GoRoute(
      //   path: AppRoutes.transparencyFile,
      //   name: 'transparencyFile',
      //   pageBuilder: (context, state) =>
      //       MaterialPage(key: state.pageKey, child: const TransparencyFilePage()),
      // ),
      // GoRoute(
      //   path: AppRoutes.transparencyDonationLog,
      //   name: 'transparencyDonationLog',
      //   pageBuilder: (context, state) =>
      //       MaterialPage(key: state.pageKey, child: const TransparencyDonationLogPage()),
      // ),
      // GoRoute(
      //   path: AppRoutes.globalSearch,
      //   name: 'globalSearch',
      //   pageBuilder: (context, state) =>
      //       MaterialPage(key: state.pageKey, child: const GlobalSearchPage()),
      // ),
      
      // Placeholder route for development - shows a simple page
      GoRoute(
        path: AppRoutes.splash,
        name: 'splash',
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('App Router Initialized'),
                  const SizedBox(height: 16),
                  Text(
                    'Routes will be available when features are created',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ],
  );
}

