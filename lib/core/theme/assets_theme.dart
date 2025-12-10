import 'package:flutter/material.dart';

class AssetsManager {
  static const String _basePath = "assets/images";

  /// Get asset by:
  /// folder: "png/home"  (subfolders allowed)
  /// baseName: "logo"
  /// extension: png/svg
  static String getAsset(
      BuildContext context, {
        required String folder,
        required String name,
        String extension = "png",
      }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final suffix = isDark ? "dark" : "light";

    return "$_basePath/$folder/${name}_$suffix.$extension";
  }
}
extension AssetExt on BuildContext {
  String asset({
    required String folder,
    required String name,
    String ext = "png",
  }) {
    final isDark = Theme.of(this).brightness == Brightness.dark;
    final suffix = isDark ? "dark" : "light";
    return "assets/images/$folder/${name}_$suffix.$ext";
  }
}
