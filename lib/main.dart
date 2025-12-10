import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zyktona_app_flutter/core/routing/app_router.dart';
import 'package:zyktona_app_flutter/core/theme/app_theme.dart';
import 'package:zyktona_app_flutter/core/shared/responsive.dart';
import 'package:zyktona_app_flutter/core/theme/theme_transition.dart';
import 'package:zyktona_app_flutter/core/di/app_dependencies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize dependency injection (must be awaited)
  await configureDependencies();

  // Lock orientation to portrait mode only
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Enable edge-to-edge mode
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.edgeToEdge,
  );

  // Get current theme brightness
  final brightness = WidgetsBinding.instance.platformDispatcher.platformBrightness;
  final isLight = brightness == Brightness.light;

  // Set system UI overlay style with theme-based brightness
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarContrastEnforced: false, // Disable Android's automatic scrim
      statusBarIconBrightness: isLight ? Brightness.dark : Brightness.light,
      systemNavigationBarIconBrightness: isLight ? Brightness.dark : Brightness.light,
    ),
  );

  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translation',
      fallbackLocale: const Locale('ar'),
      startLocale: const Locale('ar'),
      useOnlyLangCode: true,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = isDesktopLayout(constraints);
        return ScreenUtilInit(
          designSize: isDesktop ? const Size(1440, 1024) : const Size(390, 844), //* Basic Design Size Based on the figma
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
              child: MaterialApp.router(
                routerConfig: AppRouter.router,
                title: 'Zykoon',
                theme: appTheme(context),
                darkTheme: appDarkTheme(context),
                themeMode: ThemeMode.light, // Default to light mode
                debugShowCheckedModeBanner: false,
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: context.locale,
                builder: (context, child) {
                  return ThemeTransition(
                    themeMode: ThemeMode.light,
                    child: child ?? const SizedBox(),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
