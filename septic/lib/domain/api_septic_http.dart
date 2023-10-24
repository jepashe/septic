import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:septic/entity/user.dart';

class ApiClient {
  final _baseUrl = 'https://app.xn--74-6kcaymg3bmueas.xn--p1ai/api/v1/';

  final _headers = {
    'Accept': 'application/json',
    'Content-Type': "application/x-www-form-urlencoded"
  };

  // Создание нового пользователя
  Future<User> signUp({required String name, required String email}) async {
    final _url = Uri.parse(_baseUrl + 'users');
    Map<String, String> _body = {
      'name': name,
      'email': email,
    };

    final response = await http.post(_url, body: _body, headers: _headers);

    if (response.statusCode == 422) {
      final Map<String, dynamic> jsonMessage = jsonDecode(response.body);
      final error = jsonMessage['error'];
      throw Exception(error);
    }
    final Map<String, dynamic> json = jsonDecode(response.body);
    final User user = User.fromJson(json['user']);
    return user;
  }

  // Подтверждение емаила
  Future<bool> confirmEmail(
      {required int id, required String code, required String email}) async {
    final _url = Uri.parse(_baseUrl + 'users/$id/confirmation');
    Map<String, String> _body = {'code': code, 'email': email};

    final response = await http.post(_url, body: _body, headers: _headers);

    if (response.statusCode == 422) {
      final Map<String, dynamic> jsonMessage = jsonDecode(response.body);
      final error = jsonMessage['error'];
      throw Exception(error);
    }
    final Map<String, dynamic> json = jsonDecode(response.body);
    if (json['success'] == true) {
      return true;
    }
    return false;
  }

  // Получение токена

  Future<Map<String, dynamic>> getToken(
      {required String email, required String password}) async {
    final _url = Uri.parse(_baseUrl + 'tokens');
    Map<String, String> _body = {'email': email, 'password': password};
    final response = await http.post(_url, body: _body, headers: _headers);
    if (response.statusCode == 422) {
      final Map<String, dynamic> jsonMessage = jsonDecode(response.body);
      final error = jsonMessage['error'];
      throw Exception(error);
    }
    final Map<String, dynamic> token = jsonDecode(response.body);

    return token;
  }

  Future<User> getUserInfo(
      {required int user_id, required String token}) async {
    final _url = Uri.parse(_baseUrl + 'users/$user_id');
    var _headerWhithAuth = _headers;
    _headerWhithAuth['Authorization'] = 'Bearer $token';
    final response = await http.get(_url, headers: _headerWhithAuth);
    if (response.statusCode == 422) {
      final Map<String, dynamic> jsonMessage = jsonDecode(response.body);
      final error = jsonMessage['error'];
      throw Exception(error);
    }
    final Map<String, dynamic> json = jsonDecode(response.body);
    final User user = User.fromJson(json['user']);
    return user;
  }

  Future<User> getUserDevices(
      {required int user_id, required String token}) async {
    final _url = Uri.parse(_baseUrl + 'users/$user_id');
    var _headerWhithAuth = _headers;
    _headerWhithAuth['Authorization'] = 'Bearer $token';
    final response = await http.get(_url, headers: _headerWhithAuth);
    if (response.statusCode == 422) {
      final Map<String, dynamic> jsonMessage = jsonDecode(response.body);
      final error = jsonMessage['error'];
      throw Exception(error);
    }
    final Map<String, dynamic> json = jsonDecode(response.body);
    final User user = User.fromJson(json['user']);
    return user;
  }

  Future<void> forgetPassword({required String email}) async {
    final _url = Uri.parse(_baseUrl + 'passwords/reset');
    Map<String, String> _body = {'email': email};
    final response = await http.post(_url, body: _body, headers: _headers);
    if (response.statusCode == 422) {
      final Map<String, dynamic> jsonMessage = jsonDecode(response.body);
      final error = jsonMessage['error'];
      throw Exception(error);
    }
  }
}
