import 'package:dartz/dartz.dart';
import 'package:test_clean_archtecture/core/error/error.dart';
import 'package:test_clean_archtecture/core/network/network.dart';
import 'package:test_clean_archtecture/feature/authentication/data/datasources/authentication_remote_datasource.dart';
import 'package:test_clean_archtecture/feature/authentication/data/datasources/datasources.dart';
import 'package:test_clean_archtecture/feature/authentication/data/models/user_credential_model.dart';
import 'package:test_clean_archtecture/feature/authentication/domain/entites/entities.dart';
import 'package:test_clean_archtecture/feature/authentication/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  final AuthenticationLocalDatasource localDatasource;
  final AuthenticationRemoteDatasource remoteDatasource;
  final NetworkInfo networkInfo;

  AuthenticationRepositoryImpl({
    required this.remoteDatasource,
    required this.localDatasource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, UserCredential>> login({
    required String email,
    required String password,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final userCredentialModel = await remoteDatasource.login(
          email: email,
          password: password,
        );

        await localDatasource.cacheAuthenticationCredential(
          userCredentialModel: userCredentialModel,
        );

        return Right(userCredentialModel);
      } on ServerException {
        return Left(ServerFailure());
      } on CacheException {
        return Left(CacheFailure());
      }
    }
    return Left(NetworkFailure());
  }

  @override
  Future<Either<Failure, bool>> getAppInitialization() async {
    try {
      final isInitialized = await localDatasource.getAppInitialization();
      return Right(isInitialized);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> initializeApp() async {
    try {
      await localDatasource.initializeApp();
      return const Right(unit);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, UserCredential>> signup({
    required String email,
    String? password,
    required String firstName,
    required String lastName,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final userCredentialModel = await remoteDatasource.signup(
          email: email,
          password: password.toString(),
          firstName: firstName,
          lastName: lastName,
        );
        await localDatasource.cacheAuthenticationCredential(
          userCredentialModel: userCredentialModel,
        );
        return Right(userCredentialModel);
      } on ServerException {
        return Left(ServerFailure());
      } on CacheException {
        return Left(CacheFailure());
      }
    }
    return Left(NetworkFailure());
  }
}
