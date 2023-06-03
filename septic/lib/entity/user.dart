import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 0)
class User {
  @HiveField(0)
  final String? name;
  @HiveField(1)
  final String? email;
  @HiveField(2)
  final int? confirmed;
  @HiveField(3)
  final int? user_id;
  @HiveField(4)
  final String? password;
  @HiveField(5)
  final String? token;

  User({
    required this.user_id,
    required this.name,
    required this.email,
    required this.confirmed,
    this.password,
    this.token,
  });

  @override
  String toString() {
    return "User Name: ${name}, Email: ${email}, Confirmed User: ${confirmed}, User ID: ${user_id.toString()}, Password User: ${password}, Token User: ${token}.";
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        name: json['name'] as String,
        email: json['email'] as String,
        confirmed: json['confirmed'] as int,
        user_id: json['user_id'] as int);
  }
}
