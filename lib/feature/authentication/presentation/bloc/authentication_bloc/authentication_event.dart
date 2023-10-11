part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class SignupEvent extends AuthenticationEvent {
  // final UserCredential userCredential;
  final String email;
  final String firstName;
  final String lastName;
  final String password;
  // final String otp;

  const SignupEvent({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.password,
    // required this.otp,
  });

  @override
  List<Object> get props => [email, firstName, lastName, password];
}

class LoginEvent extends AuthenticationEvent {
  final String email;
  final String password;

  const LoginEvent({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}

class LogoutEvent extends AuthenticationEvent {}

class ForgetPasswordEvent extends AuthenticationEvent {
  final String email;
  final String otp;

  const ForgetPasswordEvent({
    required this.email,
    required this.otp,
  });

  @override
  List<Object> get props => [email, otp];
}

class ChangePasswordEvent extends AuthenticationEvent {
  final String email;
  final String newPassword;
  final String confirmPassword;
  final String otp;

  const ChangePasswordEvent({
    required this.email,
    required this.newPassword,
    required this.confirmPassword,
    required this.otp,
  });

  @override
  List<Object> get props => [email, newPassword, confirmPassword, otp];
}

class SendOtpVerficationEvent extends AuthenticationEvent {
  final String userId;
  final String otp;

  const SendOtpVerficationEvent({
    required this.userId,
    required this.otp,
  });
}

class ResendOtpVerificationEvent extends AuthenticationEvent {
  final String phoneNumber;

  const ResendOtpVerificationEvent({required this.phoneNumber});
}

class InitializeAppEvent extends AuthenticationEvent {}

class GetAppInitializationEvent extends AuthenticationEvent {}

class SignInWithGoogleEvent extends AuthenticationEvent {}

class SignOutWithGoogleEvent extends AuthenticationEvent {}

class AuthenticatedWithGoogleEvent extends AuthenticationEvent {}
