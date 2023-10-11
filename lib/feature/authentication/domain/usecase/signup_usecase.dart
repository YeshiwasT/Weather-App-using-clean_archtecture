import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:test_clean_archtecture/core/error/failure.dart';
import 'package:test_clean_archtecture/core/usecases/usecase.dart';
import 'package:test_clean_archtecture/feature/authentication/domain/entites/entities.dart';

import '../repositories/authentication_repository.dart';

class SignupUsecase extends UseCase<UserCredential, SignupParams> {
  final AuthenticationRepository repository;

  SignupUsecase({required this.repository});

  @override
  Future<Either<Failure, UserCredential>> call(SignupParams params) async {
    return await repository.signup(
      email: params.email,
      password: params.password,
      firstName: params.firstName,
      lastName: params.lastName,
      // otp: params.otp,
    );
  }
}

class SignupParams extends Equatable {
  // final UserCredential userCredential;
  final String email;
  final String password;
  final String firstName;
  final String lastName;
  // final String otp;

  const SignupParams({
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
    // required this.otp,
  });

  @override
  List<Object?> get props => [email, password, firstName, lastName];
}
