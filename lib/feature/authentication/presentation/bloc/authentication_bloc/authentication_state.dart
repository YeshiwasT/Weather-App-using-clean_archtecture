// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}

enum AuthStatus { loading, loaded, error }

class SignupState extends AuthenticationState {
  final AuthStatus status;
  final String? errorMessage;
  final UserCredential? userCredential;
  const SignupState({
    required this.status,
    this.errorMessage,
    this.userCredential,
  });

  @override
  List<Object> get props => [status];
}

class LoggedInState extends AuthenticationState {
  final AuthStatus status;
  final String? errorMessage;
  final UserCredential? userCredential;

  const LoggedInState({
    required this.status,
    this.errorMessage,
    this.userCredential,
  });

  @override
  List<Object> get props => [status];
}

class ForgetPasswordState extends AuthenticationState {
  final AuthStatus status;

  const ForgetPasswordState({required this.status});

  @override
  List<Object> get props => [status];
}

class ChangePasswordState extends AuthenticationState {
  final AuthStatus status;

  const ChangePasswordState({required this.status});

  @override
  List<Object> get props => [status];
}
