/// Service to track the current tab index in MainNavigationPage
/// This allows us to restore the correct tab after authentication
class CurrentTabTracker {
  static int? _currentTabIndex;
  
  /// Get the current tab index
  static int? get currentTabIndex => _currentTabIndex;
  
  /// Set the current tab index
  static void setCurrentTabIndex(int? index) {
    _currentTabIndex = index;
  }
  
  /// Clear the current tab index
  static void clear() {
    _currentTabIndex = null;
  }
}


