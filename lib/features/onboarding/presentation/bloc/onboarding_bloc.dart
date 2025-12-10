import 'package:flutter_bloc/flutter_bloc.dart';
import 'onboarding_event.dart';
import 'onboarding_state.dart';

/// Onboarding BLoC
/// Handles all onboarding logic including page navigation
class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(const OnboardingState()) {
    on<ChangePage>(_onChangePage);
    on<NextPage>(_onNextPage);
    on<SkipOnboarding>(_onSkipOnboarding);
    on<CompleteOnboarding>(_onCompleteOnboarding);
    on<ResetNavigationAction>(_onResetNavigationAction);
  }

  /// Handle page change
  void _onChangePage(
    ChangePage event,
    Emitter<OnboardingState> emit,
  ) {
    if (event.pageIndex >= 0 && event.pageIndex < state.totalPages) {
      emit(state.copyWith(
        currentPage: event.pageIndex,
        navigationAction: OnboardingNavigationAction.none,
      ));
    }
  }

  /// Handle next page navigation
  void _onNextPage(
    NextPage event,
    Emitter<OnboardingState> emit,
  ) {
    if (state.isLastPage) {
      emit(state.copyWith(navigationAction: OnboardingNavigationAction.complete));
    } else {
      emit(state.copyWith(
        currentPage: state.currentPage + 1,
        navigationAction: OnboardingNavigationAction.nextPage,
      ));
    }
  }

  /// Handle skip onboarding
  void _onSkipOnboarding(
    SkipOnboarding event,
    Emitter<OnboardingState> emit,
  ) {
    emit(state.copyWith(navigationAction: OnboardingNavigationAction.complete));
  }

  /// Handle complete onboarding
  void _onCompleteOnboarding(
    CompleteOnboarding event,
    Emitter<OnboardingState> emit,
  ) {
    emit(state.copyWith(navigationAction: OnboardingNavigationAction.complete));
  }

  /// Reset navigation action
  void _onResetNavigationAction(
    ResetNavigationAction event,
    Emitter<OnboardingState> emit,
  ) {
    emit(state.copyWith(navigationAction: OnboardingNavigationAction.none));
  }
}

