// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class UserCredential extends Equatable {
  final String email;
  final String firstName;
  final String lastName;

  final String? password;
  final String? token;

  const UserCredential({
    required this.email,
    required this.firstName,
    required this.lastName,
    this.password,
    this.token,
  });

  @override
  List<Object?> get props => [email, firstName];

  UserCredential copyWith({
    String? email,
    String? firstName,
    String? lastName,
    String? password,
    String? token,
  }) {
    return UserCredential(
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      password: password ?? this.password,
      token: token ?? this.token,
    );
  }
}
