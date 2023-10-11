part of 'signup_form_bloc.dart';

abstract class SignupFormState extends Equatable {
  const SignupFormState();

  @override
  List<Object> get props => [];
}

class SignupFormInitial extends SignupFormState {}

class SignupForm extends SignupFormState {
  final String? userId;
  final String email;
  final String userName;
  final String phoneNumber;
  final String password;

  const SignupForm({
    this.userId,
    required this.email,
    required this.userName,
    required this.phoneNumber,
    required this.password,
  });

  SignupForm copyWith({
    String? userId,
    String? email,
    String? userName,
    String? phoneNumber,
    String? password,
  }) {
    return SignupForm(
      userId: userId ?? this.userId,
      email: email ?? this.email,
      userName: userName ?? this.userName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password,
    );
  }

  @override
  List<Object> get props => [
        email,
        userName,
        phoneNumber,
        password,
      ];
}
