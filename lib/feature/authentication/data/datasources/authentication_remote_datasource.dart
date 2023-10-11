import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_clean_archtecture/core/error/error.dart';
import 'package:test_clean_archtecture/feature/authentication/data/data.dart';

abstract class AuthenticationRemoteDatasource {
  Future<UserCredentialModel> signup({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  });
  Future<UserCredentialModel> login({
    required String email,
    required String password,
  });
}

class AuthenticationRemoteDatasourceImpl
    extends AuthenticationRemoteDatasource {
  final http.Client client;

  AuthenticationRemoteDatasourceImpl({
    required this.client,
  });

  final baseUrl = "";

  @override
  Future<UserCredentialModel> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await client.post(
        Uri.parse('$baseUrl/user/login'),
        body: json.encode({
          'email': email,
          'password': password,
        }),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final responseJson = json.decode(response.body)['data'];

        return UserCredentialModel.fromJson(responseJson);
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<UserCredentialModel> signup({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    final response = await client.post(
      Uri.parse('$baseUrl/user/signup'),
      body: json.encode({
        'email': email,
        'password': password,
        'firstName': firstName,
        'lastName': lastName,
      }),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 201) {
      final responseJson = json.decode(response.body);

      return UserCredentialModel.fromJson(responseJson);
    }
    throw ServerException();
  }
}
