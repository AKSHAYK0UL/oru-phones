part of 'auth_bloc.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoadingState extends AuthState {
  final AuthENUM laodingSource;
  AuthLoadingState({required this.laodingSource});
}

class AuthErrorState extends AuthState {
  final String errorMessage;
  final AuthENUM errorSource;
  AuthErrorState({required this.errorMessage, required this.errorSource});
}

final class AuthSuccessState extends AuthState {
  final AuthENUM successSource;

  AuthSuccessState({required this.successSource});
}

final class AuthOTPResponseState extends AuthState {
  final OTPResponse otpResponse;

  AuthOTPResponseState({required this.otpResponse});
}
