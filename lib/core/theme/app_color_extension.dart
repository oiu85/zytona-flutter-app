import 'package:flutter/material.dart';
import '../constant/app_colors.dart';

/// Custom color extension for theme-specific colors
/// This allows us to add custom colors to the theme that aren't in ColorScheme
class AppColorExtension extends ThemeExtension<AppColorExtension> {
  // Primary Brand Colors
  final Color primary;
  final Color primary100;
  final Color gradientStart;
  final Color gradientEnd;
  
  // Text Colors
  final Color textPrimary;
  final Color textSecondary;
  final Color textOnPrimary;
  
  // Background Colors
  final Color background;
  
  // UI Element Colors
  final Color textFieldBorder;
  final Color divider;
  final Color shadow;
  final Color inactiveIndicator;
  
  // Catalog Colors
  final Color catalogBackground;
  final Color catalogTextColor;
  final Color catalogCardBackground;
  final Color catalogCardShadow;
  final Color catalogCardTextPrimary;
  final Color catalogCardTextSecondary;
  final Color catalogDivider;
  final Color catalogTabInactive;
  
  // Campaign Colors
  final Color campaignCardBackground;
  final Color campaignTitleColor;
  final Color progressBarUnfilled;
  final Color tabInactiveColor;
  
  // Bottom Sheet Colors
  final Color bottomSheetBackground;
  final Color bottomSheetDivider;
  final Color dropdownBackground;
  final Color chipBorderInactive;
  final Color fieldDivider;
  final Color hintText;
  
  // Effects
  final Color glassEffect;
  
  // Basic Colors (theme-dependent)
  final Color black;
  final Color white;
  
  const AppColorExtension({
    required this.primary,
    required this.primary100,
    required this.gradientStart,
    required this.gradientEnd,
    required this.textPrimary,
    required this.textSecondary,
    required this.textOnPrimary,
    required this.background,
    required this.textFieldBorder,
    required this.divider,
    required this.shadow,
    required this.inactiveIndicator,
    required this.catalogBackground,
    required this.catalogTextColor,
    required this.catalogCardBackground,
    required this.catalogCardShadow,
    required this.catalogCardTextPrimary,
    required this.catalogCardTextSecondary,
    required this.catalogDivider,
    required this.catalogTabInactive,
    required this.campaignCardBackground,
    required this.campaignTitleColor,
    required this.progressBarUnfilled,
    required this.tabInactiveColor,
    required this.bottomSheetBackground,
    required this.bottomSheetDivider,
    required this.dropdownBackground,
    required this.chipBorderInactive,
    required this.fieldDivider,
    required this.hintText,
    required this.glassEffect,
    required this.black,
    required this.white,
  });

  /// Light theme colors
  factory AppColorExtension.light() {
    return const AppColorExtension(
      primary: AppColors.lightPrimary,
      primary100: AppColors.lightPrimary100,
      gradientStart: AppColors.gradientStart,
      gradientEnd: AppColors.gradientEnd,
      textPrimary: AppColors.lightTextPrimary,
      textSecondary: AppColors.lightTextSecondary,
      textOnPrimary: AppColors.lightTextOnPrimary,
      background: AppColors.lightBackground,
      textFieldBorder: AppColors.lightBorder,
      divider: AppColors.lightDivider,
      shadow: AppColors.lightShadow,
      inactiveIndicator: AppColors.lightInactiveIndicator,
      catalogBackground: AppColors.lightCatalogBackground,
      catalogTextColor: AppColors.lightCatalogTextColor,
      catalogCardBackground: AppColors.lightCatalogCardBackground,
      catalogCardShadow: AppColors.lightCatalogCardShadow,
      catalogCardTextPrimary: AppColors.lightCatalogCardTextPrimary,
      catalogCardTextSecondary: AppColors.lightCatalogCardTextSecondary,
      catalogDivider: AppColors.lightCatalogDivider,
      catalogTabInactive: AppColors.lightCatalogTabInactive,
      campaignCardBackground: AppColors.lightCampaignCardBackground,
      campaignTitleColor: AppColors.lightCampaignTitleColor,
      progressBarUnfilled: AppColors.lightProgressBarUnfilled,
      tabInactiveColor: AppColors.lightTabInactiveColor,
      bottomSheetBackground: AppColors.lightBottomSheetBackground,
      bottomSheetDivider: AppColors.lightBottomSheetDivider,
      dropdownBackground: AppColors.lightDropdownBackground,
      chipBorderInactive: AppColors.lightChipBorderInactive,
      fieldDivider: AppColors.lightFieldDivider,
      hintText: AppColors.lightHintText,
      glassEffect: AppColors.lightGlassEffect,
      black: AppColors.lightTextPrimary,
      white: AppColors.lightSurface,
    );
  }

  /// Dark theme colors
  factory AppColorExtension.dark() {
    return AppColorExtension(
      primary: AppColors.darkPrimary,
      primary100: AppColors.lightPrimary100, // Keep light for dark mode too
      gradientStart: AppColors.gradientStart,
      gradientEnd: AppColors.gradientEnd,
      textPrimary: AppColors.darkTextPrimary,
      textSecondary: AppColors.darkTextSecondary,
      textOnPrimary: AppColors.darkTextOnPrimary,
      background: AppColors.darkBackground,
      textFieldBorder: AppColors.darkBorder,
      divider: AppColors.darkDivider,
      shadow: AppColors.darkShadow,
      inactiveIndicator: AppColors.darkInactiveIndicator,
      catalogBackground: AppColors.darkCatalogBackground,
      catalogTextColor: AppColors.darkCatalogTextColor,
      catalogCardBackground: AppColors.darkCatalogCardBackground,
      catalogCardShadow: AppColors.darkCatalogCardShadow,
      catalogCardTextPrimary: AppColors.darkCatalogCardTextPrimary,
      catalogCardTextSecondary: AppColors.darkCatalogCardTextSecondary,
      catalogDivider: AppColors.darkCatalogDivider,
      catalogTabInactive: AppColors.darkCatalogTabInactive,
      campaignCardBackground: AppColors.darkCampaignCardBackground,
      campaignTitleColor: AppColors.darkCampaignTitleColor,
      progressBarUnfilled: AppColors.darkProgressBarUnfilled,
      tabInactiveColor: AppColors.darkTabInactiveColor,
      bottomSheetBackground: AppColors.darkBottomSheetBackground,
      bottomSheetDivider: AppColors.darkBottomSheetDivider,
      dropdownBackground: AppColors.darkDropdownBackground,
      chipBorderInactive: AppColors.darkChipBorderInactive,
      fieldDivider: AppColors.darkFieldDivider,
      hintText: AppColors.darkHintText,
      glassEffect: AppColors.darkGlassEffect,
      black: AppColors.darkTextPrimary,
      white: AppColors.darkSurface,
    );
  }

  @override
  ThemeExtension<AppColorExtension> copyWith({
    Color? primary,
    Color? primary100,
    Color? gradientStart,
    Color? gradientEnd,
    Color? textPrimary,
    Color? textSecondary,
    Color? textOnPrimary,
    Color? background,
    Color? textFieldBorder,
    Color? divider,
    Color? shadow,
    Color? inactiveIndicator,
    Color? catalogBackground,
    Color? catalogTextColor,
    Color? catalogCardBackground,
    Color? catalogCardShadow,
    Color? catalogCardTextPrimary,
    Color? catalogCardTextSecondary,
    Color? catalogDivider,
    Color? catalogTabInactive,
    Color? campaignCardBackground,
    Color? campaignTitleColor,
    Color? progressBarUnfilled,
    Color? tabInactiveColor,
    Color? bottomSheetBackground,
    Color? bottomSheetDivider,
    Color? dropdownBackground,
    Color? chipBorderInactive,
    Color? fieldDivider,
    Color? hintText,
    Color? glassEffect,
    Color? black,
    Color? white,
  }) {
    return AppColorExtension(
      primary: primary ?? this.primary,
      primary100: primary100 ?? this.primary100,
      gradientStart: gradientStart ?? this.gradientStart,
      gradientEnd: gradientEnd ?? this.gradientEnd,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textOnPrimary: textOnPrimary ?? this.textOnPrimary,
      background: background ?? this.background,
      textFieldBorder: textFieldBorder ?? this.textFieldBorder,
      divider: divider ?? this.divider,
      shadow: shadow ?? this.shadow,
      inactiveIndicator: inactiveIndicator ?? this.inactiveIndicator,
      catalogBackground: catalogBackground ?? this.catalogBackground,
      catalogTextColor: catalogTextColor ?? this.catalogTextColor,
      catalogCardBackground: catalogCardBackground ?? this.catalogCardBackground,
      catalogCardShadow: catalogCardShadow ?? this.catalogCardShadow,
      catalogCardTextPrimary: catalogCardTextPrimary ?? this.catalogCardTextPrimary,
      catalogCardTextSecondary: catalogCardTextSecondary ?? this.catalogCardTextSecondary,
      catalogDivider: catalogDivider ?? this.catalogDivider,
      catalogTabInactive: catalogTabInactive ?? this.catalogTabInactive,
      campaignCardBackground: campaignCardBackground ?? this.campaignCardBackground,
      campaignTitleColor: campaignTitleColor ?? this.campaignTitleColor,
      progressBarUnfilled: progressBarUnfilled ?? this.progressBarUnfilled,
      tabInactiveColor: tabInactiveColor ?? this.tabInactiveColor,
      bottomSheetBackground: bottomSheetBackground ?? this.bottomSheetBackground,
      bottomSheetDivider: bottomSheetDivider ?? this.bottomSheetDivider,
      dropdownBackground: dropdownBackground ?? this.dropdownBackground,
      chipBorderInactive: chipBorderInactive ?? this.chipBorderInactive,
      fieldDivider: fieldDivider ?? this.fieldDivider,
      hintText: hintText ?? this.hintText,
      glassEffect: glassEffect ?? this.glassEffect,
      black: black ?? this.black,
      white: white ?? this.white,
    );
  }

  @override
  ThemeExtension<AppColorExtension> lerp(
    covariant ThemeExtension<AppColorExtension>? other,
    double t,
  ) {
    if (other is! AppColorExtension) {
      return this;
    }
    return AppColorExtension(
      primary: Color.lerp(primary, other.primary, t)!,
      primary100: Color.lerp(primary100, other.primary100, t)!,
      gradientStart: Color.lerp(gradientStart, other.gradientStart, t)!,
      gradientEnd: Color.lerp(gradientEnd, other.gradientEnd, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textOnPrimary: Color.lerp(textOnPrimary, other.textOnPrimary, t)!,
      background: Color.lerp(background, other.background, t)!,
      textFieldBorder: Color.lerp(textFieldBorder, other.textFieldBorder, t)!,
      divider: Color.lerp(divider, other.divider, t)!,
      shadow: Color.lerp(shadow, other.shadow, t)!,
      inactiveIndicator: Color.lerp(inactiveIndicator, other.inactiveIndicator, t)!,
      catalogBackground: Color.lerp(catalogBackground, other.catalogBackground, t)!,
      catalogTextColor: Color.lerp(catalogTextColor, other.catalogTextColor, t)!,
      catalogCardBackground: Color.lerp(catalogCardBackground, other.catalogCardBackground, t)!,
      catalogCardShadow: Color.lerp(catalogCardShadow, other.catalogCardShadow, t)!,
      catalogCardTextPrimary: Color.lerp(catalogCardTextPrimary, other.catalogCardTextPrimary, t)!,
      catalogCardTextSecondary: Color.lerp(catalogCardTextSecondary, other.catalogCardTextSecondary, t)!,
      catalogDivider: Color.lerp(catalogDivider, other.catalogDivider, t)!,
      catalogTabInactive: Color.lerp(catalogTabInactive, other.catalogTabInactive, t)!,
      campaignCardBackground: Color.lerp(campaignCardBackground, other.campaignCardBackground, t)!,
      campaignTitleColor: Color.lerp(campaignTitleColor, other.campaignTitleColor, t)!,
      progressBarUnfilled: Color.lerp(progressBarUnfilled, other.progressBarUnfilled, t)!,
      tabInactiveColor: Color.lerp(tabInactiveColor, other.tabInactiveColor, t)!,
      bottomSheetBackground: Color.lerp(bottomSheetBackground, other.bottomSheetBackground, t)!,
      bottomSheetDivider: Color.lerp(bottomSheetDivider, other.bottomSheetDivider, t)!,
      dropdownBackground: Color.lerp(dropdownBackground, other.dropdownBackground, t)!,
      chipBorderInactive: Color.lerp(chipBorderInactive, other.chipBorderInactive, t)!,
      fieldDivider: Color.lerp(fieldDivider, other.fieldDivider, t)!,
      hintText: Color.lerp(hintText, other.hintText, t)!,
      glassEffect: Color.lerp(glassEffect, other.glassEffect, t)!,
      black: Color.lerp(black, other.black, t)!,
      white: Color.lerp(white, other.white, t)!,
    );
  }
}

// No extension shortcut - use proper theme syntax:
// Theme.of(context).extension<AppColorExtension>()!
// or
// theme.extension<AppColorExtension>()!

