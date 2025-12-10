import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:zyktona_app_flutter/core/storage/app_storage_service.dart';
import 'package:zyktona_app_flutter/core/routing/app_routes.dart';
import 'package:zyktona_app_flutter/core/routing/app_router.dart';
import 'package:zyktona_app_flutter/core/shared/app_navigator_key.dart';
import 'package:zyktona_app_flutter/core/shared/current_tab_tracker.dart';
import 'package:zyktona_app_flutter/core/localization/app_text.dart';

/// Service for checking user authentication status and handling guest mode redirects
@injectable
class GuestModeGuard {
  final AppStorageService storageService;

  GuestModeGuard(this.storageService);

  /// Checks if user is logged in
  /// Returns true if access token exists AND guest mode is false
  Future<bool> isUserLoggedIn() async {
    final token = await storageService.getAccessToken();
    final isGuest = await storageService.isGuestMode();
    return token != null && token.isNotEmpty && !isGuest;
  }

  /// Requires authentication before proceeding with an action
  /// Returns true if user is logged in, false if redirected to login
  /// Automatically navigates to login page if user is in guest mode
  /// Stores the current path to return to after successful login
  Future<bool> requireAuthentication({String? returnPath}) async {
    if (await isUserLoggedIn()) {
      return true;
    }
    
    // Navigate to login using global navigator key
    final context = appNavigatorKey.currentContext;
    if (context != null) {
      // Store the return path if provided, otherwise get current location from GoRouter
      String? pathToStore = returnPath;
      if (pathToStore == null) {
        try {
          // Use the router instance directly from AppRouter
          final router = AppRouter.router;
          
          // Get current location from router
          String? currentPath;
          
          // Method 1: Try routerDelegate.currentConfiguration.uri.path (most reliable)
          try {
            final uri = router.routerDelegate.currentConfiguration.uri;
            currentPath = uri.path;
            debugPrint('GuestModeGuard: Method 1 - routerDelegate.currentConfiguration.uri.path = $currentPath');
          } catch (e) {
            debugPrint('GuestModeGuard: Method 1 failed: $e');
          }
          
          // Method 2: Try routerDelegate.currentConfiguration.uri.toString()
          if (currentPath == null || currentPath.isEmpty || currentPath == '/') {
            try {
              final uriString = router.routerDelegate.currentConfiguration.uri.toString();
              currentPath = uriString.contains('?') ? uriString.split('?').first : uriString;
              debugPrint('GuestModeGuard: Method 2 - uri.toString() = $currentPath');
            } catch (e) {
              debugPrint('GuestModeGuard: Method 2 failed: $e');
            }
          }
          
          // Method 3: Try GoRouterState from context
          if (currentPath == null || currentPath.isEmpty || currentPath == '/') {
            try {
              final state = GoRouterState.of(context);
              currentPath = state.matchedLocation;
              debugPrint('GuestModeGuard: Method 3 - GoRouterState.matchedLocation = $currentPath');
            } catch (e) {
              debugPrint('GuestModeGuard: Method 3 failed: $e');
            }
          }
          
          // Store the path with query parameters preserved
          // This allows us to preserve tab information for /home?tab=1
          if (currentPath != null) {
            // If we're on /home, check if we can get the current tab index
            if (currentPath == AppRoutes.home) {
              final tabIndex = CurrentTabTracker.currentTabIndex;
              if (tabIndex != null && tabIndex > 0) {
                pathToStore = '$currentPath?tab=$tabIndex';
                debugPrint('GuestModeGuard: Detected tab index $tabIndex, storing: $pathToStore');
              } else {
                pathToStore = currentPath;
                debugPrint('GuestModeGuard: No tab index found, storing: $pathToStore');
              }
            } else {
              // For non-home routes, remove query parameters to keep it clean
              pathToStore = currentPath.contains('?') 
                  ? currentPath.split('?').first 
                  : currentPath;
              debugPrint('GuestModeGuard: Final path to store = $pathToStore');
            }
          }
        } catch (e) {
          debugPrint('GuestModeGuard: Error getting current path: $e');
          // If we can't get the current location, don't store a return path
          pathToStore = null;
        }
      } else {
        debugPrint('GuestModeGuard: Using provided return path = $pathToStore');
      }
      
      // Only store if it's valid and not already a login/signup page
      if (pathToStore != null && 
          pathToStore.isNotEmpty && 
          pathToStore != AppRoutes.login && 
          pathToStore != AppRoutes.signup &&
          pathToStore != '/') {
        debugPrint('GuestModeGuard: Storing return path = $pathToStore');
        await storageService.setReturnPath(pathToStore);
      } else {
        debugPrint('GuestModeGuard: NOT storing return path (invalid or excluded): $pathToStore');
      }
      
      final theme = Theme.of(context);
      final colorScheme = theme.colorScheme;
      
      // Show snackbar with login message using friendly theme colors
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: AppText(
            'auth.pleaseLogin',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colorScheme.onPrimaryContainer,
            ),
          ),
          backgroundColor: colorScheme.primaryContainer,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );
      
      // Navigate to login page
      context.push(AppRoutes.login);
    }
    
    return false;
  }
}

