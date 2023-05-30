import 'dart:convert';
import 'package:septic/entity/user.dart';

class ApiClient {
  Future<User> signUp({required String name, required String email}) async {
    if (email == 'subochev.pavel@test.com') {
      const defaultUser = """{
    "user": {
        "name": "Pavel1",
        "email": "subochev.pavel@test.com",
        "confirmed": 0,
        "user_id": 24
    },
    "success": true
}""";
      final User user = User.fromJson(jsonDecode(defaultUser));
      return user;
    }
    const errorJson = """{
    "message": "The given data was invalid.",
    "errors": {
        "name": [
            "The name must be at least 6 characters."
        ]
    }
}""";
    return User(user_id: 0, name: name, email: email, confirmed: 0);
  }

  Future<void> confirmEmail({required int id, required String code}) async {
    const confirmEmailJson = """{
    "success": true
}""";
    final bool isConfirm = jsonDecode(confirmEmailJson);
  }

  Future<void> getToken(
      {required String email, required String password}) async {
    const tokenJson = """{
    "token": "36|97D4SjIHARAFShSfzno0NxJlQfD0VQdrr67henqx",
    "expires_at": "2023-05-29 09:02:17",
    "refresh_token": "37|5lACP858egXF3cVc154jVGZ52dLkA4FdWBrXXA09",
    "success": true
}""";
    final response = jsonDecode(tokenJson) as List<dynamic>;
  }
}