import 'package:dartz/dartz.dart';
import 'package:test_clean_archtecture/core/error/exceptions.dart';
import 'package:test_clean_archtecture/core/platform/network_info.dart';
import 'package:test_clean_archtecture/feature/authentication/data/datasources/login_data_source.dart';
import 'package:test_clean_archtecture/feature/authentication/domain/entites/login_entite.dart';
import 'package:test_clean_archtecture/feature/authentication/domain/repostories/authentication_repostory.dart';

import '../../../../core/error/failure.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
 late final NetworkInfo networkInfo;
 late final LoginDataSource loginDataSource;
 AuthenticationRepositoryImpl({
 required this.networkInfo,
 required this.loginDataSource
 });
  @override
  Future<Either<Failure, LoginEntity>> login({
    required String userName,
    required String password,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final userCredentialModel = await loginDataSource.login(
          userName: userName,
          password: password,
        );
        return Right(userCredentialModel);
      } on ServerException {
        return Left(ServerFailure());
      } on CacheException {
        return Left(CacheFailure());
      }
    }
    return Left(CacheFailure());
  }

  @override
  Future<Either<Failure, Unit>> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }


  @override
  Future<Either<Failure, LoginEntity>> signup({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String otp,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final userCredentialModel = await loginDataSource.signup(
          email: email,
          password: password,
          firstName: firstName,
          lastName: lastName,
          otp: otp,
        );
        // await localDatasource.cacheAuthenticationCredential(
        //   userCredentialModel: userCredentialModel,
        // );
        return Right(userCredentialModel);
      } on ServerException {
        return Left(ServerFailure());
      } on CacheException {
        return Left(CacheFailure());
      }
    }
    return Left(CacheFailure());
  }

}
