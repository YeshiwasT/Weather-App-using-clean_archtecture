import 'package:test_clean_archtecture/feature/authentication/domain/entites/entities.dart';

class User extends UserCredential {
  const User({
    required super.email,
    required super.firstName,
    required super.lastName,
    super.password,
    super.token,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'] ?? '',
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
    );
  }
  factory User.fromUpdatedUserJson(Map<String, dynamic> json) {
    return User(
      email: json['email'] ?? '',
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
    );
  }

  factory User.fromLocalCachedJson(Map<String, dynamic> json) {
    return User(
      email: json['email'] ?? '',
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      token: json['token'] ?? '',
    );
  }
  @override
  User copyWith(
      {String? email,
      String? firstName,
      String? password,
      String? lastName,
      String? token}) {
    return User(
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      password: password ?? this.password,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'firstName': firstName,
      'token': token,
    };
  }
}
