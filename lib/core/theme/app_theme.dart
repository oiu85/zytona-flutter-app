import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constant/app_colors.dart';
import 'app_color_extension.dart';

/// Light theme for the app
ThemeData appTheme(BuildContext context) {
  //* Get current locale to determine font
  final locale = context.locale;
  final fontFamily = locale.languageCode == 'ar' ? 'Cairo' : 'Poppins';

  return ThemeData(
    useMaterial3: true,
    fontFamily: fontFamily,
    brightness: Brightness.light,
    
    //* Color Scheme (Light)
    colorScheme: ColorScheme.light(
      primary: AppColors.lightPrimary,
      secondary: AppColors.lightSecondary,
      tertiary: AppColors.lightTertiary,
      surface: AppColors.lightSurface,
      background: AppColors.lightBackground,
      onPrimary: AppColors.lightTextOnPrimary,
      onSecondary: AppColors.lightTextOnPrimary,
      onSurface: AppColors.lightTextPrimary,
      onBackground: AppColors.lightTextPrimary,
      error: Colors.red,
      onError: Colors.white,
    ),
    scaffoldBackgroundColor: AppColors.lightScaffoldBackground,
    
    //* Custom Color Extension (Light)
    extensions: [
      AppColorExtension.light(),
    ],

    //* Text Theme (Light)
    textTheme: TextTheme(
      displayLarge: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.bold, fontFamily: fontFamily, color: AppColors.lightTextPrimary),
      displayMedium: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.w600, fontFamily: fontFamily, color: AppColors.lightTextPrimary),
      displaySmall: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w500, fontFamily: fontFamily, color: AppColors.lightTextPrimary),
      headlineMedium: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w600, fontFamily: fontFamily, color: AppColors.lightTextPrimary),
      headlineSmall: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500, fontFamily: fontFamily, color: AppColors.lightTextPrimary),
      titleLarge: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, fontFamily: fontFamily, color: AppColors.lightTextPrimary),
      titleMedium: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600, fontFamily: fontFamily, color: AppColors.lightTextPrimary),
      titleSmall: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w700, fontFamily: fontFamily, color: AppColors.lightTextPrimary),
      bodyLarge: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400, fontFamily: fontFamily, color: AppColors.lightTextPrimary),
      bodyMedium: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400, fontFamily: fontFamily, color: AppColors.lightTextPrimary),
      bodySmall: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w300, fontFamily: fontFamily, color: AppColors.lightTextSecondary),
      labelLarge: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600, fontFamily: fontFamily, color: AppColors.lightTextPrimary),
      labelSmall: TextStyle(fontSize: 8.sp, fontWeight: FontWeight.w400, fontFamily: fontFamily, color: AppColors.lightTextSecondary),
    ).apply(fontSizeFactor: 1),

    //* Button Theme (Light)
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.lightPrimary,
        foregroundColor: AppColors.lightTextOnPrimary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
        padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 20.w),
        textStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, fontFamily: fontFamily),
      ),
    ),

    //* AppBar Theme (Light)
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.lightPrimary,
      foregroundColor: AppColors.lightTextOnPrimary,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontFamily: fontFamily,
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.lightTextOnPrimary,
      ),
    ),

    //* Card Theme (Light)
    cardTheme: CardThemeData(
      color: AppColors.lightSurface,
      shadowColor: AppColors.lightShadow,
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
    ),

    //* Input Decoration Theme (Light)
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: const BorderSide(color: AppColors.lightBorder),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(color: AppColors.lightPrimary, width: 2.w),
      ),
      labelStyle: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        fontFamily: fontFamily,
        color: AppColors.lightTextSecondary,
      ),
    ),
  );
}

/// Dark theme for the app
ThemeData appDarkTheme(BuildContext context) {
  //* Get current locale to determine font
  final locale = context.locale;
  final fontFamily = locale.languageCode == 'ar' ? 'Cairo' : 'Poppins';

  return ThemeData(
    useMaterial3: true,
    fontFamily: fontFamily,
    brightness: Brightness.dark,
    
    //* Color Scheme (Dark)
    colorScheme: ColorScheme.dark(
      primary: AppColors.darkPrimary,
      secondary: AppColors.darkSecondary,
      tertiary: AppColors.darkTertiary,
      surface: AppColors.darkSurface,
      background: AppColors.darkBackground,
      onPrimary: AppColors.darkTextOnPrimary,
      onSecondary: AppColors.darkTextOnPrimary,
      onSurface: AppColors.darkTextPrimary,
      onBackground: AppColors.darkTextPrimary,
      error: Colors.red,
      onError: Colors.white,
    ),
    scaffoldBackgroundColor: AppColors.darkScaffoldBackground,
    
    //* Custom Color Extension (Dark)
    extensions: [
      AppColorExtension.dark(),
    ],

    //* Text Theme (Dark)
    textTheme: TextTheme(
      displayLarge: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.bold, fontFamily: fontFamily, color: AppColors.darkTextPrimary),
      displayMedium: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.w600, fontFamily: fontFamily, color: AppColors.darkTextPrimary),
      displaySmall: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w500, fontFamily: fontFamily, color: AppColors.darkTextPrimary),
      headlineMedium: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w600, fontFamily: fontFamily, color: AppColors.darkTextPrimary),
      headlineSmall: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500, fontFamily: fontFamily, color: AppColors.darkTextPrimary),
      titleLarge: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, fontFamily: fontFamily, color: AppColors.darkTextPrimary),
      titleMedium: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600, fontFamily: fontFamily, color: AppColors.darkTextPrimary),
      titleSmall: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w700, fontFamily: fontFamily, color: AppColors.darkTextPrimary),
      bodyLarge: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400, fontFamily: fontFamily, color: AppColors.darkTextPrimary),
      bodyMedium: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400, fontFamily: fontFamily, color: AppColors.darkTextPrimary),
      bodySmall: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w300, fontFamily: fontFamily, color: AppColors.darkTextSecondary),
      labelLarge: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600, fontFamily: fontFamily, color: AppColors.darkTextPrimary),
      labelSmall: TextStyle(fontSize: 8.sp, fontWeight: FontWeight.w400, fontFamily: fontFamily, color: AppColors.darkTextSecondary),
    ).apply(fontSizeFactor: 1),

    //* Button Theme (Dark)
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.darkPrimary,
        foregroundColor: AppColors.darkTextOnPrimary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
        padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 20.w),
        textStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, fontFamily: fontFamily),
      ),
    ),

    //* AppBar Theme (Dark)
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkSurface,
      foregroundColor: AppColors.darkTextPrimary,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontFamily: fontFamily,
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.darkTextPrimary,
      ),
    ),

    //* Card Theme (Dark)
    cardTheme: CardThemeData(
      color: AppColors.darkSurface,
      shadowColor: AppColors.darkShadow,
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
    ),

    //* Input Decoration Theme (Dark)
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: const BorderSide(color: AppColors.darkBorder),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(color: AppColors.darkPrimary, width: 2.w),
      ),
      labelStyle: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        fontFamily: fontFamily,
        color: AppColors.darkTextSecondary,
      ),
    ),
  );
}
