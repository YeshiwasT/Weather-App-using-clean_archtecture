
import 'package:dartz/dartz.dart';
import 'package:test_clean_archtecture/feature/authentication/domain/entites/login_entite.dart';

import '../../../../core/error/failure.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, LoginEntity>> signup({
    required  String email, 
    required String password, 
    required String firstName, 
    required String lastName, 
    required String otp,});
  Future<Either<Failure, LoginEntity>> login({
    required String userName,
    required String password  });}