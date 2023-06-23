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

      final Map<String, dynamic> json = jsonDecode(defaultUser);
      final User user = User.fromJson(json['user']);
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

  Future<bool> confirmEmail({required int id, required String code}) async {
    const confirmEmailJson = """{
    "success": true
}""";
    final Map<String, dynamic> isConfirm = jsonDecode(confirmEmailJson);
    if (isConfirm['success'] == true) {
      return true;
    }
    return false;
  }

  Future<String> getToken(
      {required String email, required String password}) async {
    const tokenJson = """{
    "token": "36|97D4SjIHARAFShSfzno0NxJlQfD0VQdrr67henqx",
    "expires_at": "2023-05-29 09:02:17",
    "refresh_token": "37|5lACP858egXF3cVc154jVGZ52dLkA4FdWBrXXA09",
    "success": true
}""";
    final Map<String, dynamic> response = jsonDecode(tokenJson);
    return response['token'];
  }
}

Future<void> addSeptic(
    {required String number,
    required String address,
    required String phone,
    required String contact,
    required double volume,
    required double radius,
    required double height,
    required double shift,
    required double threshold}) async {
  const septicJson = """{
    "device": {
        "address": "труда",
        "phone": "89029695667",
        "contact": "павел",
        "volume": "1",
        "height": "1",
        "shift": "1",
        "threshold": "1",
        "user_id": 24,
        "api_key": "38|uCJxscmLsk12SeoU8gUCWLddBDtcAuI3EiLgbrkm",
        "device_id": 45
    },
    "success": true
} """;
}
