import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:test_clean_archtecture/core/error/failure.dart';
import 'package:test_clean_archtecture/core/usecases/usecase.dart';
import 'package:test_clean_archtecture/feature/authentication/domain/entites/entities.dart';
import '../repositories/authentication_repository.dart';

class LoginUsecase extends UseCase<UserCredential, LoginParams> {
  final AuthenticationRepository repository;

  LoginUsecase({
    required this.repository,
  });

  @override
  Future<Either<Failure, UserCredential>> call(LoginParams params) async {
    return await repository.login(
      email: params.email,
      password: params.password,
    );
  }
}

class LoginParams extends Equatable {
  final String email;
  final String password;

  const LoginParams({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];
}
