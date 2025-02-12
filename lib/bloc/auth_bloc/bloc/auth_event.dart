part of 'auth_bloc.dart';

sealed class AuthEvent {}

final class CreateOTPEvent extends AuthEvent {
  final CreateOTP data;

  CreateOTPEvent({required this.data});
}

final class VerifyOTPEvent extends AuthEvent {
  final OTPRequest data;

  VerifyOTPEvent({required this.data});
}
