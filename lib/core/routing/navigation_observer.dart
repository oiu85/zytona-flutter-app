import 'package:flutter/material.dart';

/// A global navigation state notifier that tracks when routes are being pushed/popped.
/// This helps widgets (like liquid glass effects) know when to temporarily disable
/// expensive rendering during page transitions.
class NavigationStateNotifier extends ChangeNotifier {
  bool _isNavigating = false;
  
  /// Whether a navigation transition is currently in progress
  bool get isNavigating => _isNavigating;
  
  /// Mark that navigation has started
  void setNavigating(bool value) {
    if (_isNavigating != value) {
      _isNavigating = value;
      notifyListeners();
    }
  }
  
  /// Temporarily set navigating state with auto-reset after transition completes
  void setNavigatingWithAutoReset({Duration duration = const Duration(milliseconds: 500)}) {
    setNavigating(true);
    Future.delayed(duration, () {
      setNavigating(false);
    });
  }
}

/// Route observer that notifies about navigation events
class AppRouteObserver extends RouteObserver<PageRoute<dynamic>> {
  final NavigationStateNotifier navigationStateNotifier;
  
  AppRouteObserver(this.navigationStateNotifier);
  
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    // Set navigating when pushing a new route
    navigationStateNotifier.setNavigatingWithAutoReset();
  }
  
  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    // Set navigating when popping back
    navigationStateNotifier.setNavigatingWithAutoReset();
  }
  
  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    // Set navigating when replacing route
    navigationStateNotifier.setNavigatingWithAutoReset();
  }
}

