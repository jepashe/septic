import 'package:septic/domain/api_septic_http.dart';
import 'package:septic/entity/user.dart';

class AuthenticationRepository {
  AuthenticationRepository({ApiClient? septicApi})
      : _septicClient = septicApi ?? ApiClient();
  final ApiClient _septicClient;

  Future<User> signUp({required String name, required String email}) async {
    return _septicClient.signUp(name: name, email: email);
  }

  Future<bool> confirmEmail(
      {required int id, required String code, required String email}) async {
    return _septicClient.confirmEmail(id: id, code: code, email: email);
  }

  Future<Map<String, dynamic>> getToken(
      {required String email, required String password}) async {
    return _septicClient.getToken(email: email, password: password);
  }

  Future<User> getUserInfo(
      {required int user_id, required String token}) async {
    return _septicClient.getUserInfo(user_id: user_id, token: token);
  }

  Future<void> forgetPassword({required String email}) async {
    return _septicClient.forgetPassword(
      email: email,
    );
  }
}
