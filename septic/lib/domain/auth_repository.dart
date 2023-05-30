import 'package:septic/domain/api_septic_faike.dart';
import 'package:septic/entity/user.dart';

class AuthenticationRepository {
  AuthenticationRepository({ApiClient? septicApi})
      : _septicClient = septicApi ?? ApiClient();
  final ApiClient _septicClient;

  Future<User> signUp({required String name, required String email}) async {
    return _septicClient.signUp(name: name, email: email);
  }

  Future<void> confirmEmail({required int id, required String code}) async {
    return _septicClient.confirmEmail(id: id, code: code);
  }

  Future<void> getToken(
      {required String email, required String password}) async {
    return _septicClient.getToken(email: email, password: password);
  }
}
