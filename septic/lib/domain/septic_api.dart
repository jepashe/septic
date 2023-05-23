import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:septic/entity/user.dart';

class SepticApi {
  SepticApi({Dio? client}) : _client = client ?? Dio();
  final Dio _client;
  final _baseUrl = 'https://app.xn--74-6kcaymg3bmueas.xn--p1ai/api/v1';
  final _options = Options(
      contentType: 'application/x-www-form-urlencoded',
      followRedirects: true,
      validateStatus: (status) {
        return status! < 500;
      });

  Future<User?> signUp({required String name, required String email}) async {
    User? data;
    /*
    (_client.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };*/

    Map<String, String> body = {
      'name': name,
      'email': email,
    };

    try {
      Response response = await _client.post(_baseUrl + '/users',
          data: body, options: _options);

      print(response);
    } catch (e) {
      print('Error creating user: $e');
    }
    return data;
  }

  Future<bool> confirmEmail({required String pin}) async {
    Map<String, String> body = {
      'pin': pin,
    };
    try {
      Response response = await _client.post(
          _baseUrl + '/users/{id}/confirmation',
          data: body,
          options: _options);
    } catch (e) {
      print('Error creating user: $e');
    }
    return true;
  }
}
