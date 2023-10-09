import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:test_clean_archtecture/feature/authentication/domain/entites/login_entite.dart';
import 'package:test_clean_archtecture/feature/authentication/domain/repostories/authentication_repostory.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';

class LoginUsecase extends UseCase<LoginEntity, LoginParams> {
  final AuthenticationRepository repository;

  LoginUsecase({
    required this.repository,
  });

  @override
  Future<Either<Failure, LoginEntity>> call(LoginParams params) async {
    return await repository.login(
      userName: params.userName,
      password: params.password,
    );
  }
}

class LoginParams extends Equatable {
  final String userName;
  final String password;

  const LoginParams({
    required this.userName,
    required this.password,
  });

  @override
  List<Object?> get props => [userName, password];
}
