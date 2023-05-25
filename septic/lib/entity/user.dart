import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 0)
class User {
  @HiveField(0)
  final int? user_id;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final String? email;
  @HiveField(3)
  final int? confirmed;
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
    return "User ID: ${user_id.toString()}, User Name: ${name}, Email: ${email}, Confirmed User: ${confirmed}, Password User: ${password}, Token User: ${token}.";
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        user_id: json['user_id'] as int,
        name: json['name'] as String,
        email: json['email'] as String,
        confirmed: json['confirmed'] as int);
  }
}
