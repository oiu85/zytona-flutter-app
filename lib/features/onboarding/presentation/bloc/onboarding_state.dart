import 'package:equatable/equatable.dart';

/// Onboarding navigation actions
enum OnboardingNavigationAction {
  none,
  nextPage,
  complete,
}

/// Onboarding State
class OnboardingState extends Equatable {
  final int currentPage;
  final int totalPages;
  final OnboardingNavigationAction navigationAction;

  const OnboardingState({
    this.currentPage = 0,
    this.totalPages = 3,
    this.navigationAction = OnboardingNavigationAction.none,
  });

  OnboardingState copyWith({
    int? currentPage,
    int? totalPages,
    OnboardingNavigationAction? navigationAction,
  }) {
    return OnboardingState(
      currentPage: currentPage ?? this.currentPage,
      totalPages: totalPages ?? this.totalPages,
      navigationAction: navigationAction ?? OnboardingNavigationAction.none,
    );
  }

  bool get isLastPage => currentPage == totalPages - 1;
  bool get isFirstPage => currentPage == 0;

  @override
  List<Object?> get props => [currentPage, totalPages, navigationAction];
}

