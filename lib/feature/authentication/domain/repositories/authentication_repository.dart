import 'package:test_clean_archtecture/feature/authentication/domain/entites/entities.dart';

import '../../data/models/user_model.dart';
import '/core/error/failure.dart';
import 'package:dartz/dartz.dart';
// import 'package:firebase_auth/firebase_auth.dart' hide UserCredential;
// import 'package:flutter/material.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, UserCredential>> signup({
    required String email,
    String? password,
    required String firstName,
    required String lastName,
    // required String otp,
  });
  Future<Either<Failure, UserCredential>> login({
    required String email,
    required String password,
  });
  Future<Either<Failure, Unit>> initializeApp();
  Future<Either<Failure, bool>> getAppInitialization();
}
