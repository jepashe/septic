import 'package:septic/domain/api_client_old.dart';
import 'package:septic/entity/user.dart';

class AuthenticationRepository {
  AuthenticationRepository({ApiClient? septicApi})
      : _septicClient = septicApi ?? ApiClient();
  final ApiClient _septicClient;

  Future<User?> signUp({required String name, required String email}) async {
    return _septicClient.signUp(name: name, email: email);
  }

  Future<bool> confirmEmail({required String pin}) async {
    return true;
  }
}
