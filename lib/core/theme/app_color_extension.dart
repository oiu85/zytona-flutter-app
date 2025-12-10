import 'package:flutter/material.dart';
import '../constant/app_colors.dart';

/// Custom color extension for theme-specific colors
/// This allows us to add custom colors to the theme that aren't in ColorScheme
class AppColorExtension extends ThemeExtension<AppColorExtension> {
  // UI Element Colors
  final Color textFieldBorder;
  final Color divider;
  final Color shadow;
  
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
  final Color inactiveIndicator;
  
  // Basic Colors (theme-dependent)
  final Color black;
  final Color white;
  
  const AppColorExtension({
    required this.textFieldBorder,
    required this.divider,
    required this.shadow,
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
    required this.inactiveIndicator,
    required this.black,
    required this.white,
  });

  /// Light theme colors
  factory AppColorExtension.light() {
    return const AppColorExtension(
      textFieldBorder: AppColors.lightBorder,
      divider: AppColors.lightDivider,
      shadow: AppColors.lightShadow,
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
      inactiveIndicator: AppColors.lightInactiveIndicator,
      black: AppColors.lightTextPrimary,
      white: AppColors.lightSurface,
    );
  }

  /// Dark theme colors
  factory AppColorExtension.dark() {
    return AppColorExtension(
      textFieldBorder: AppColors.darkBorder,
      divider: AppColors.darkDivider,
      shadow: AppColors.darkShadow,
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
      inactiveIndicator: AppColors.darkInactiveIndicator,
      black: AppColors.darkTextPrimary,
      white: AppColors.darkSurface,
    );
  }

  @override
  ThemeExtension<AppColorExtension> copyWith({
    Color? textFieldBorder,
    Color? divider,
    Color? shadow,
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
    Color? inactiveIndicator,
    Color? black,
    Color? white,
  }) {
    return AppColorExtension(
      textFieldBorder: textFieldBorder ?? this.textFieldBorder,
      divider: divider ?? this.divider,
      shadow: shadow ?? this.shadow,
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
      inactiveIndicator: inactiveIndicator ?? this.inactiveIndicator,
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
      textFieldBorder: Color.lerp(textFieldBorder, other.textFieldBorder, t)!,
      divider: Color.lerp(divider, other.divider, t)!,
      shadow: Color.lerp(shadow, other.shadow, t)!,
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
      inactiveIndicator: Color.lerp(inactiveIndicator, other.inactiveIndicator, t)!,
      black: Color.lerp(black, other.black, t)!,
      white: Color.lerp(white, other.white, t)!,
    );
  }
}

// No extension shortcut - use proper theme syntax:
// Theme.of(context).extension<AppColorExtension>()!
// or
// theme.extension<AppColorExtension>()!

