import 'package:equatable/equatable.dart';

/// Auth Events
abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

/// Login event
class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  const LoginEvent({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];
}

/// Logout event
class LogoutEvent extends AuthEvent {
  const LogoutEvent();
}

/// Check authentication status
class CheckAuthStatusEvent extends AuthEvent {
  const CheckAuthStatusEvent();
}

/// Reset auth state
class ResetAuthStateEvent extends AuthEvent {
  const ResetAuthStateEvent();
}

