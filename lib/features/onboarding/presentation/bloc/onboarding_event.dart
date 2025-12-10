import 'package:equatable/equatable.dart';

/// Onboarding Events
abstract class OnboardingEvent extends Equatable {
  const OnboardingEvent();

  @override
  List<Object?> get props => [];
}

/// Change to specific page
class ChangePage extends OnboardingEvent {
  final int pageIndex;

  const ChangePage(this.pageIndex);

  @override
  List<Object?> get props => [pageIndex];
}

/// Navigate to next page
class NextPage extends OnboardingEvent {
  const NextPage();
}

/// Skip onboarding flow
class SkipOnboarding extends OnboardingEvent {
  const SkipOnboarding();
}

/// Complete onboarding flow
class CompleteOnboarding extends OnboardingEvent {
  const CompleteOnboarding();
}

/// Reset navigation action
class ResetNavigationAction extends OnboardingEvent {
  const ResetNavigationAction();
}

