import 'dart:io';

import 'package:test_clean_archtecture/feature/authentication/data/model/login_model.dart';
import 'package:http/http.dart' as http;
abstract class LoginDataSource{
    Future<LoginModel> signup({
    required  String email, 
    required String password, 
    required String firstName, 
    required String lastName, 
    required String otp,});
  Future<LoginModel> login({
    required String userName,
    required String password  });
}
class LoginDataSourceImp implements LoginDataSource {
   final http.Client client;

  LoginDataSourceImp({required this.client});
  @override
  Future<LoginModel> login({required String userName, required String password}) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<LoginModel> signup({required String email, required String password, required String firstName, required String lastName, required String otp}) {
    // TODO: implement signup
    throw UnimplementedError();
  }
  
}