import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:zyktona_app_flutter/core/component/custom_filled_button.dart';
import 'package:zyktona_app_flutter/core/component/custom_text_field.dart';
import 'package:zyktona_app_flutter/core/di/app_dependencies.dart';
import 'package:zyktona_app_flutter/core/localization/app_text.dart';
import 'package:zyktona_app_flutter/core/localization/locale_keys.g.dart';
import 'package:zyktona_app_flutter/core/routing/app_routes.dart';
import 'package:zyktona_app_flutter/core/theme/app_color_extension.dart';
import 'package:zyktona_app_flutter/core/validation/form_validators.dart';
import 'package:zyktona_app_flutter/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:zyktona_app_flutter/features/auth/presentation/bloc/auth_event.dart';
import 'package:zyktona_app_flutter/features/auth/presentation/bloc/auth_state.dart';
import 'package:zyktona_app_flutter/gen/assets.gen.dart';

/// Login page
/// Allows users to sign in with email and password
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  
  // Validators
  final _emailValidator = const EmailValidator();
  final _passwordValidator = const PasswordValidator(minLength: 6);

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin(AuthBloc authBloc) {
    if (_formKey.currentState!.validate()) {
      authBloc.add(LoginEvent(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.extension<AppColorExtension>()!;

    return BlocProvider(
      create: (context) => getIt<AuthBloc>()..add(const CheckAuthStatusEvent()),
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.isAuthenticated && state.status.isSuccess()) {
            // Navigate to home on successful login
            context.go(AppRoutes.home);
          } else if (state.status.isFail() && state.errorMessage != null) {
            // Show error message
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage!),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: _buildLoginContent(theme, colors),
      ),
    );
  }

  Widget _buildLoginContent(ThemeData theme, AppColorExtension colors) {
    return Scaffold(
      backgroundColor: colors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              // Background image
              Positioned.fill(
                child: Image.asset(
                  Assets.images.png.authBgAssets.path,
                  fit: BoxFit.cover,
                  opacity: const AlwaysStoppedAnimation(0.1),
                ),
              ),
              // Content
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 40.h),

                      // Welcome image/icon
                      Center(
                        child: Container(
                          width: 120.w,
                          height: 120.h,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: Assets.images.png.bg.provider(),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 32.h),

                      // Title - Welcome Back
                      AppText(
                        LocaleKeys.auth_welcome_back,
                        style: theme.textTheme.displayLarge?.copyWith(
                          color: colors.textPrimary,
                          fontSize: 32.sp,
                          fontWeight: FontWeight.w700,
                          height: 1.20,
                          letterSpacing: -0.64,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      SizedBox(height: 8.h),

                      // Subtitle - Friendly message
                      AppText(
                        LocaleKeys.auth_login_subtitle,
                        style: theme.textTheme.bodyLarge?.copyWith(
                          color: colors.textSecondary,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                          height: 1.70,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      SizedBox(height: 40.h),

                  // Email field
                  CustomTextField(
                    labelKey: LocaleKeys.auth_email,
                    hintKey: LocaleKeys.auth_email_hint,
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      size: 20.sp,
                      color: colors.textSecondary,
                    ),
                    validator: (value) => _emailValidator(value),
                  ),

                  SizedBox(height: 16.h),

                  // Password field
                  CustomTextField(
                    labelKey: LocaleKeys.auth_password,
                    hintKey: LocaleKeys.auth_password_hint,
                    controller: _passwordController,
                    obscureText: true,
                    prefixIcon: Icon(
                      Icons.lock_outline,
                      size: 20.sp,
                      color: colors.textSecondary,
                    ),
                    validator: (value) => _passwordValidator(value),
                  ),

                  SizedBox(height: 12.h),

                  // Forgot password
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        // Navigate to forgot password page
                        // context.push(AppRoutes.resetPassword);
                      },
                      child: AppText(
                        LocaleKeys.auth_forgot_password,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: colors.primary,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 32.h),

                  // Login button
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      return CustomFilledButton(
                        text: LocaleKeys.auth_sign_in,
                        onPressed: state.status.isLoading()
                            ? null
                            : () => _handleLogin(context.read<AuthBloc>()),
                      );
                    },
                  ),

                  SizedBox(height: 24.h),

                  // Sign up link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText(
                        LocaleKeys.auth_dont_have_account,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: colors.textSecondary,
                          fontSize: 14.sp,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // Navigate to signup page
                          // context.push(AppRoutes.signup);
                        },
                        child: AppText(
                          LocaleKeys.auth_sign_up,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: colors.primary,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),

                      SizedBox(height: 32.h),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

