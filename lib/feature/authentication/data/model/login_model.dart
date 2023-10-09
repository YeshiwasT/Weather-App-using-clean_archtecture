import 'package:test_clean_archtecture/feature/authentication/domain/entites/login_entite.dart';


class LoginModel extends LoginEntity {
   LoginModel({
    required super.userName,
    required super.password,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      userName: json['userName'],
      password: json['password'],
    );
  }
  factory LoginModel.fromUpdatedUserJson(Map<String, dynamic> json) {
    return LoginModel(
      userName: json['userName'] ?? '',
      password: json['password'] ?? '',
  
    );
  }

  factory LoginModel.fromLocalCachedJson(Map<String, dynamic> json) {
    return LoginModel(
      userName: json['userName'] ?? '',
      password: json['password'] ?? '',
    );
  }
  @override
  LoginModel copyWith({
    required String userName,
    required String  password,
  }) {
    return LoginModel(
      userName: userName ?? this.userName,
      password: password ?? this.password
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'password': password,
    };
  }
}
