part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class RegisterEvent extends AuthEvent {
  const RegisterEvent({required this.onSuccess});

  final VoidCallback onSuccess;
}

class LoginEvent extends AuthEvent {
  const LoginEvent({
    required this.onSuccess,
  });

  final ValueChanged<CustomerInfoResponse> onSuccess;
}

class LogoutEvent extends AuthEvent {
  const LogoutEvent({required this.onSuccess});

  final VoidCallback onSuccess;
}

class VerificationEvent extends AuthEvent {
  const VerificationEvent(
      {required this.code, required this.phone, required this.onSuccess});

  final String code;
  final String phone;

  final VoidCallback onSuccess;
}

class ResendCodeEvent extends AuthEvent {}

class ResetPasswordGenerateEvent extends AuthEvent {}

class ResetPasswordCheckEvent extends AuthEvent {
  const ResetPasswordCheckEvent(
      {required this.token, required this.phone, required this.onSuccess});
  final String token;
  final String phone;
  final VoidCallback onSuccess;
}

class ResetPasswordEvent extends AuthEvent {
  const ResetPasswordEvent({required this.onSuccess});

  final VoidCallback onSuccess;
}

class ChangeCountryEvent extends AuthEvent{
  final Country country;

  const ChangeCountryEvent({required this.country});
}
