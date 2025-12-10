import 'package:equatable/equatable.dart';
import 'package:zyktona_app_flutter/core/status/bloc_status.dart';

/// Auth State
class AuthState extends Equatable {
  final BlocStatus status;
  final bool isAuthenticated;
  final String? userId;
  final String? email;
  final String? errorMessage;

  const AuthState({
    this.status = const BlocStatus.initial(),
    this.isAuthenticated = false,
    this.userId,
    this.email,
    this.errorMessage,
  });

  AuthState copyWith({
    BlocStatus? status,
    bool? isAuthenticated,
    String? userId,
    String? email,
    String? errorMessage,
    bool clearError = false,
  }) {
    return AuthState(
      status: status ?? this.status,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      userId: userId ?? this.userId,
      email: email ?? this.email,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
    );
  }

  @override
  List<Object?> get props => [
        status,
        isAuthenticated,
        userId,
        email,
        errorMessage,
      ];
}

