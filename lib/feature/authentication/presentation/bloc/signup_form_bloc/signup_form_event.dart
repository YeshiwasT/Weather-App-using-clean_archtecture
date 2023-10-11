part of 'signup_form_bloc.dart';

abstract class SignupFormEvent extends Equatable {
  const SignupFormEvent();

  @override
  List<Object> get props => [];
}

class ChangeEmailEvent extends SignupFormEvent {
  final String email;

  const ChangeEmailEvent({
    required this.email,
  });

  @override
  List<Object> get props => [email];
}

class ChangeUserIdEvent extends SignupFormEvent {
  final String userId;

  const ChangeUserIdEvent({
    required this.userId,
  });

  @override
  List<Object> get props => [userId];
}

class ChangeUserNameEvent extends SignupFormEvent {
  final String userName;

  const ChangeUserNameEvent({
    required this.userName,
  });

  @override
  List<Object> get props => [userName];
}

class ChangePhoneNumberEvent extends SignupFormEvent {
  final String phoneNumber;

  const ChangePhoneNumberEvent({
    required this.phoneNumber,
  });

  @override
  List<Object> get props => [phoneNumber];
}

class ChangePassEvent extends SignupFormEvent {
  final String password;

  const ChangePassEvent({
    required this.password,
  });

  @override
  List<Object> get props => [password];
}

class ChangeOTPEvent extends SignupFormEvent {
  final String otp;

  const ChangeOTPEvent({required this.otp});

  @override
  List<Object> get props => [otp];
}
