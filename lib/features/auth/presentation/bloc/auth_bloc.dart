import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zyktona_app_flutter/core/status/bloc_status.dart';
import 'auth_event.dart';
import 'auth_state.dart';

/// Auth BLoC
/// Handles all authentication logic including login, logout, and auth status
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState()) {
    on<LoginEvent>(_onLogin);
    on<LogoutEvent>(_onLogout);
    on<CheckAuthStatusEvent>(_onCheckAuthStatus);
    on<ResetAuthStateEvent>(_onResetAuthState);
  }

  /// Handle login
  Future<void> _onLogin(
    LoginEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(
      status: const BlocStatus.loading(),
      clearError: true,
    ));

    try {
      // TODO: Implement actual login logic with repository
      // For now, simulate API call
      await Future.delayed(const Duration(seconds: 1));

      // TODO: Replace with actual authentication
      // final result = await authRepository.login(
      //   email: event.email,
      //   password: event.password,
      // );

      // Mock success for now
      emit(state.copyWith(
        status: const BlocStatus.success(),
        isAuthenticated: true,
        userId: 'mock_user_id',
        email: event.email,
        clearError: true,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: BlocStatus.fail(error: e.toString()),
        isAuthenticated: false,
        errorMessage: e.toString(),
      ));
    }
  }

  /// Handle logout
  Future<void> _onLogout(
    LogoutEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(
      status: const BlocStatus.loading(),
      clearError: true,
    ));

    try {
      // TODO: Implement actual logout logic with repository
      // await authRepository.logout();

      emit(state.copyWith(
        status: const BlocStatus.success(),
        isAuthenticated: false,
        userId: null,
        email: null,
        clearError: true,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: BlocStatus.fail(error: e.toString()),
        errorMessage: e.toString(),
      ));
    }
  }

  /// Check authentication status
  Future<void> _onCheckAuthStatus(
    CheckAuthStatusEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(status: const BlocStatus.loading()));

    try {
      // TODO: Implement actual auth status check with repository
      // final isAuthenticated = await authRepository.isAuthenticated();
      // final user = await authRepository.getCurrentUser();

      // Mock for now
      emit(state.copyWith(
        status: const BlocStatus.success(),
        isAuthenticated: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: BlocStatus.fail(error: e.toString()),
        errorMessage: e.toString(),
      ));
    }
  }

  /// Reset auth state
  void _onResetAuthState(
    ResetAuthStateEvent event,
    Emitter<AuthState> emit,
  ) {
    emit(state.copyWith(
      status: const BlocStatus.initial(),
      clearError: true,
    ));
  }
}

