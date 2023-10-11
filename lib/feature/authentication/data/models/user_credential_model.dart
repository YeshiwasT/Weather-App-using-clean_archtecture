import 'package:test_clean_archtecture/feature/authentication/domain/entites/entities.dart';

class UserCredentialModel extends UserCredential {
  const UserCredentialModel({
    required super.email,
    required super.firstName,
    required super.lastName,
    super.password,
    super.token,
  });

  factory UserCredentialModel.fromJson(Map<String, dynamic> json) {
    return UserCredentialModel(
      email: json['curUser']['email'] ?? '',
      firstName: json['curUser']['firstName'] ?? '',
      lastName: json['curUser']['lastName'] ?? '',
      token: json['token'] ?? '',
    );
  }
  factory UserCredentialModel.fromUpdatedUserJson(Map<String, dynamic> json) {
    return UserCredentialModel(
      email: json['updatedUser']['email'] ?? '',
      firstName: json['updatedUser']['firstName'] ?? '',
      lastName: json['updatedUser']['lastName'] ?? '',
    );
  }

  factory UserCredentialModel.fromLocalCachedJson(Map<String, dynamic> json) {
    return UserCredentialModel(
      email: json['email'] ?? '',
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      token: json['token'] ?? '',
    );
  }
  @override
  UserCredentialModel copyWith({
    String? email,
    String? firstName,
    String? lastName,
    String? password,
    String? token,
  }) {
    return UserCredentialModel(
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
      'lastName': lastName,
      'token': token,
    };
  }
}
