import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:test_clean_archtecture/core/network/network.dart';
import 'package:test_clean_archtecture/feature/authentication/domain/repositories/authentication_repository.dart';
import 'package:test_clean_archtecture/feature/authentication/domain/usecase/login_usecase.dart';
import 'package:test_clean_archtecture/feature/authentication/domain/usecase/signup_usecase.dart';
import 'package:test_clean_archtecture/feature/authentication/presentation/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:test_clean_archtecture/feature/authentication/presentation/bloc/signup_form_bloc/signup_form_bloc.dart';
import 'feature/authentication/data/datasources/authentication_local_datasource.dart';
import 'feature/authentication/data/datasources/authentication_remote_datasource.dart';
import 'feature/authentication/data/repositories/authentication_repository_impl.dart';

GetIt serviceLocator = GetIt.instance;

Future<void> init() async {
  //! Features
  //! Feature_#1 Authentication ----------------------------

  // Bloc
  serviceLocator.registerFactory(
    () => AuthenticationBloc(
      signupUsecase: serviceLocator(),
      loginUsecase: serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => SignupFormBloc(),
  );

  // Usecase
  serviceLocator
      .registerLazySingleton(() => SignupUsecase(repository: serviceLocator()));
  serviceLocator
      .registerLazySingleton(() => LoginUsecase(repository: serviceLocator()));
  // Repository
  serviceLocator.registerLazySingleton<AuthenticationRepository>(
    () => AuthenticationRepositoryImpl(
      remoteDatasource: serviceLocator(),
      localDatasource: serviceLocator(),
      networkInfo: serviceLocator(),
    ),
  );

  // DataSource
  serviceLocator.registerLazySingleton<AuthenticationLocalDatasource>(
    () => AuthenticationLocalDatasourceImpl(
      flutterSecureStorage: serviceLocator(),
    ),
  );
  serviceLocator.registerFactory<AuthenticationRemoteDatasource>(
    () => AuthenticationRemoteDatasourceImpl(
      client: serviceLocator(),
    ),
  );
  //! Core ----------------------------------
  serviceLocator.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(
        internetConnectionChecker: serviceLocator(),
      ));

  //! External-----------------------------------
  const flutterSecureStorage = FlutterSecureStorage();
  serviceLocator.registerFactory(() => flutterSecureStorage);

  serviceLocator.registerLazySingleton(() => http.Client());
  serviceLocator.registerLazySingleton(() => InternetConnectionChecker());
}
