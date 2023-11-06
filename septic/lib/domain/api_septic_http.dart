import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:septic/entity/septic.dart';
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

// Получить все привязанные устройства пользователя

  Future<List<int>?> getUserDevices({required User user}) async {
    final _url = Uri.parse(_baseUrl + 'devices');
    final token = user.token;
    if (token != null) {
      var _headerWhithAuth = _headers;
      _headerWhithAuth['Authorization'] = 'Bearer $token';
      final response = await http.get(_url, headers: _headerWhithAuth);
      if (response.statusCode == 422) {
        final Map<String, dynamic> jsonMessage = jsonDecode(response.body);
        final error = jsonMessage['error'];
        throw Exception(error);
      }
      final Map<String, dynamic> json = jsonDecode(response.body);
      final List<dynamic> devices = json['devices'];
      if (devices.isEmpty) {
        return null;
      }
      List<int> septics = [];
      for (var device in devices) {
        final device_id = device['device_id'];
        septics.add(device_id);
      }
      return septics;
    }
    return null;
  }

  Future<bool> addSeptic(
      {required String number,
      required String address,
      required String phone,
      required String contact,
      required String volume,
      required String radius,
      required String height,
      required String shift,
      required String threshold,
      required User user}) async {
    final _url = Uri.parse(_baseUrl + 'users/${user.user_id}/devices');
    final token = user.token;
    if (token != null) {
      var _headerWhithAuth = _headers;
      _headerWhithAuth['Authorization'] = 'Bearer $token';
      Map<String, dynamic> _body = {'number': number, 'address': address, 'phone': phone, 'contact': contact, 'volume': volume, 'radius': radius, 'height': height, 'shift': shift, 'threshold': threshold};
      final response = await http.post(_url, headers: _headerWhithAuth, body: _body);
      if (response.statusCode == 422) {
        final Map<String, dynamic> jsonMessage = jsonDecode(response.body);
        final error = jsonMessage['error'];
        throw Exception(error);
      }
      final Map<String, dynamic> json = jsonDecode(response.body);
      final bool isSuccess = json['success'];
      return isSuccess;
    }
    return false;
  }

  Future<bool> forgetPassword({required String email}) async {
    final _url = Uri.parse(_baseUrl + 'passwords/reset');
    Map<String, String> _body = {'email': email};
    final response = await http.post(_url, body: _body, headers: _headers);
    if (response.statusCode == 422) {
      final Map<String, dynamic> jsonMessage = jsonDecode(response.body);
      final error = jsonMessage['error'];
      throw Exception(error);
    }
    final Map<String, dynamic> json = jsonDecode(response.body);
    return json['success'];
  }

  Future<bool> sendNewPasswordOnEmail(
      {required String email, required String code}) async {
    final _url = Uri.parse(_baseUrl + 'passwords');
    Map<String, String> _body = {'email': email, 'code': code};
    final response = await http.delete(_url, body: _body, headers: _headers);
    if (response.statusCode == 422) {
      final Map<String, dynamic> jsonMessage = jsonDecode(response.body);
      final error = jsonMessage['error'];
      throw Exception(error);
    }
    final Map<String, dynamic> json = jsonDecode(response.body);
    return json['success'];
  }
}
