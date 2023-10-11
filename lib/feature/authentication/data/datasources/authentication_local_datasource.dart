import 'dart:convert';

import 'package:test_clean_archtecture/core/error/error.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../data.dart';

abstract class AuthenticationLocalDatasource {
  Future<void> cacheAuthenticationCredential({
    required UserCredentialModel userCredentialModel,
  });
  Future<void> initializeApp();
  Future<bool> getAppInitialization();
}

class AuthenticationLocalDatasourceImpl extends AuthenticationLocalDatasource {
  final FlutterSecureStorage flutterSecureStorage;
  final String authenticationKey = "access_token";
  final String appInitializationKey = "kkkkkkkkk";

  AuthenticationLocalDatasourceImpl({
    required this.flutterSecureStorage,
  });

  @override
  Future<void> cacheAuthenticationCredential({
    required UserCredentialModel userCredentialModel,
  }) {
    String? stringfiedJson = json.encode(userCredentialModel);
    return flutterSecureStorage.write(
      key: authenticationKey,
      value: stringfiedJson,
    );
  }

  @override
  Future<bool> getAppInitialization() async {
    final initialized =
        await flutterSecureStorage.read(key: appInitializationKey);
    if (initialized != null) {
      return true;
    }
    throw CacheException();
  }

  @override
  Future<void> initializeApp() {
    return flutterSecureStorage.write(key: appInitializationKey, value: 'true');
  }
}
