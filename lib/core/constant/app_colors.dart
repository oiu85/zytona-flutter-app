import 'package:flutter/material.dart';

/// App color constants - Should ONLY be used in theme definitions
/// Widgets should use Theme.of(context).colorScheme instead
class AppColors {
  // Private constructor to prevent instantiation
  AppColors._();

  //* ==================== Light Theme Colors ====================
  
  //* Primary Brand Colors (Light) - Healthy Food App
  static const Color lightPrimary = Color(0xFF54A312); // Primary 600 - Dark green
  static const Color lightSecondary = Color(0xFF5EAD1C); // Primary - Light green (gradient start)
  static const Color lightTertiary = Color(0xFF96D2B5); // Light green
  static const Color lightPrimary100 = Color(0xFFECF1E8); // Primary 100 - Light background
  
  //* Background & Surface (Light)
  static const Color lightBackground = Color(0xFFFFFFFF); // White
  static const Color lightSurface = Color(0xFFFFFFFF); // White
  static const Color lightScaffoldBackground = Color(0xFFFFFFFF); // White
  
  //* Text Colors (Light) - Healthy Food App
  static const Color lightTextPrimary = Color(0xFF363A33); // Typography 500 - Dark gray-green
  static const Color lightTextSecondary = Color(0xFF60655C); // Typography 400 - Medium gray-green
  static const Color lightTextOnPrimary = Color(0xFFFFFFFF); // White on colored buttons
  
  //* UI Element Colors (Light)
  static const Color lightBorder = Color(0xFFE0E0E0);
  static const Color lightDivider = Color(0xFFD9D9D9);
  static const Color lightShadow = Color(0x1A000000);
  
  //* Catalog Colors (Light)
  static const Color lightCatalogBackground = Color(0xFFF6F6F6);
  static const Color lightCatalogTextColor = Color(0xFF3B3B3B);
  static const Color lightCatalogCardBackground = Color(0xFFF9FAFB);
  static const Color lightCatalogCardShadow = Color(0x338E8E8E);
  static const Color lightCatalogCardTextPrimary = Color(0xFF111111);
  static const Color lightCatalogCardTextSecondary = Color(0x99111111);
  static const Color lightCatalogDivider = Color(0x29000000);
  static const Color lightCatalogTabInactive = Color(0xFF838589);
  
  //* Campaign Colors (Light)
  static const Color lightCampaignCardBackground = Color(0xFFF7F7F7);
  static const Color lightCampaignTitleColor = Color(0xFF292D32);
  static const Color lightProgressBarUnfilled = Color(0xFFE0E0E0);
  static const Color lightTabInactiveColor = Color(0xFF9E9E9E);
  
  //* Bottom Sheet Colors (Light)
  static const Color lightBottomSheetBackground = Color(0xFFF7F7F7);
  static const Color lightBottomSheetDivider = Color(0xFFC0C0C0);
  static const Color lightDropdownBackground = Color(0xFFF2F2F2);
  static const Color lightChipBorderInactive = Color(0xFFD9D9D9);
  static const Color lightFieldDivider = Color(0xFFE4E4E4);
  static const Color lightHintText = Color(0xFFD0D0D0);
  
  //* Effects (Light)
  static const Color lightGlassEffect = Color(0x4C717171);
  static const Color lightInactiveIndicator = Color(0xFFD9D9D9);
  
  //* ==================== Dark Theme Colors ====================
  //* New Dark Mode Color System:
  //* Button: #256644 | Card: #111A17 | Main: #0C1210 | Stroke: #3C3C3C
  
  //* Primary Brand Colors (Dark)
  static const Color darkPrimary = Color(0xFF256644); // Button - Deep forest green
  static const Color darkSecondary = Color(0xFF3A8C5E); // Lighter accent green
  static const Color darkTertiary = Color(0xFF1A4D33); // Darker accent green
  
  //* Background & Surface (Dark)
  static const Color darkBackground = Color.fromARGB(255, 0, 0, 0); // Main - Near-black green
  static const Color darkSurface =   Color(0xFF0C1210); 
  // Card - Very dark green
  static const Color darkScaffoldBackground =  Color.fromARGB(255, 6, 10, 9); // Main - Near-black gree
  
  //* Text Colors (Dark)
  static const Color darkTextPrimary = Color(0xFFFFFFFF); // White
  static const Color darkTextSecondary = Color(0xFFB0B0B0); // Light gray
  static const Color darkTextOnPrimary = Color(0xFFFFFFFF); // White on green buttons
  
  //* UI Element Colors (Dark)
  static const Color darkBorder = Color(0xFF3C3C3C); // Stroke - Dark gray
  static const Color darkDivider = Color(0xFF3C3C3C); // Stroke - Dark gray
  static const Color darkShadow = Color(0x1AFFFFFF);
  
  //* Catalog Colors (Dark)
  static const Color darkCatalogBackground = Color(0xFF0C1210); // Main
  static const Color darkCatalogTextColor = Color(0xFFE0E0E0);
  static const Color darkCatalogCardBackground = Color(0xFF111A17); // Card
  static const Color darkCatalogCardShadow = Color(0x33000000);
  static const Color darkCatalogCardTextPrimary = Color(0xFFFFFFFF);
  static const Color darkCatalogCardTextSecondary = Color(0x99FFFFFF);
  static const Color darkCatalogDivider = Color(0xFF3C3C3C); // Stroke
  static const Color darkCatalogTabInactive = Color(0xFF9E9E9E);
  
  //* Campaign Colors (Dark)
  static const Color darkCampaignCardBackground = Color(0xFF111A17); // Card
  static const Color darkCampaignTitleColor = Color(0xFFFFFFFF);
  static const Color darkProgressBarUnfilled = Color(0xFF3C3C3C); // Stroke
  static const Color darkTabInactiveColor = Color(0xFF9E9E9E);
  
  //* Bottom Sheet Colors (Dark)
  static const Color darkBottomSheetBackground = Color(0xFF111A17); // Card
  static const Color darkBottomSheetDivider = Color(0xFF3C3C3C); // Stroke
  static const Color darkDropdownBackground = Color(0xFF111A17); // Card
  static const Color darkChipBorderInactive = Color(0xFF3C3C3C); // Stroke
  static const Color darkFieldDivider = Color(0xFF3C3C3C); // Stroke
  static const Color darkHintText = Color(0xFF707070);
  
  //* Effects (Dark)
  static const Color darkGlassEffect = Color(0x4CFFFFFF);
  static const Color darkInactiveIndicator = Color(0xFF3C3C3C); // Stroke
  
  //* ==================== Static Colors (Same in Both Themes) ====================
  
  //* Progress & Indicators
  static const Color progressBarFilled = Color(0xFF54A312); // Primary 600
  static const Color tabActiveIndicator = Color(0xFF54A312); // Primary 600
  static const Color donationCardShadow = Color(0x1954A312); // Primary 600 shadow
  
  //* Gradient Colors for Buttons
  static const Color gradientStart = Color(0xFF5EAD1C); // Light green
  static const Color gradientEnd = Color(0xFF54A312); // Dark green
  
  //* Action Buttons
  static const Color actionButtonBackground = Color(0x19047D3F); // Semi-transparent green
  static const Color actionButtonIcon = Color(0xFF047D3F); // Solid green
  static const Color favoriteActiveBackground = Color(0x19FF3F3F); // Semi-transparent red
  static const Color favoriteActiveIcon = Color(0xFFFF3F3F); // Solid red
}
