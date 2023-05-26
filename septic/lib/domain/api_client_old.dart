import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:septic/entity/user.dart';

class ApiClient {
  final _baseUrl = 'https://app.xn--74-6kcaymg3bmueas.xn--p1ai/api/v1/';

  final _headers = {'Accept': 'application/json'};

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

  Future<User> confirmEmail({required int id, required String pin}) async {
    final _url = Uri.parse(_baseUrl + 'users/$id/confirmation');
    Map<String, String> _body = {
      'code': pin,
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

  /*
  final _baseUrl = 'https://app.xn--74-6kcaymg3bmueas.xn--p1ai/api/v1';

  final _options = Options(contentType: 'application/x-www-form-urlencoded');

  Future<User?> signUp({required String name, required String email}) async {
    User? data;

    Map<String, String> body = {
      'name': name,
      'email': email,
    };

    try {
      Response response = await _client.post(_baseUrl + '/users',
          data: body, options: _options);

      data = User.fromJson(response.data);
    } catch (e) {
      print('Error creating user: $e');
    }
    return data;
  }
  */
  /*
  Future<String> makeAuth({
    required String username,
    required String password,
  }) async {
    final url = Uri.parse(
        'http://my.XN--74-6KCAYMG3BMUEAS.XN--P1AI/data.php?user=$username&pass=$password');
    final request = await _client.getUrl(url);
    final response = await request.close();
    final json = await response
        .transform(utf8.decoder)
        .toList()
        .then((value) => value.join())
        .then((v) => jsonDecode(v) as Map<String, dynamic>);
    final ids = json['ids'][0];
    return ids;
  }

  Future<Septic?> getInfo() async {
    //final ids = await SessionDataProvider().getIds();
    final ids = await Hive.box('settings').get('ids');
    if (ids != null) {
      final url = Uri.parse(
          'http://my.xn--74-6kcaymg3bmueas.xn--p1ai/data.php?id=$ids');
      final request = await _client.getUrl(url);
      final response = await request.close();
      final json = await response
          .transform(utf8.decoder)
          .toList()
          .then((value) => value.join())
          .then((v) => jsonDecode(v) as Map<String, dynamic>);
      final info = Septic.fromJson(json);
      return info;
    }
    return null;
  }

  void sendSettingsforPush() async {
    final ids = await Hive.box('settings').get('ids');
    final fcmToken = await Hive.box('settings').get('fcmToken');
    String alarmLevel1 = await Hive.box('settings').get('firstlevel') ?? '80';
    String alarmLevel2 = await Hive.box('settings').get('secondlevel') ?? '70';
    int one = int.parse(alarmLevel1);
    int two = int.parse(alarmLevel2);
    final url = Uri.parse('http://my.xn--74-6kcaymg3bmueas.xn--p1ai');
    final parameters = <String, dynamic>{
      'mac': ids,
      'userToken': fcmToken,
      'alarmLevel1': one,
      'alarmLevel2': two,
    };
    print(parameters);
    final request = await _client.postUrl(url);
    request.headers.set('Content-type', 'application/json; charset=UTF-8');
    request.write(jsonEncode(parameters));
    final response = await request.close();
  }*/
}
