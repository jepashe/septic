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

  User({
    required this.user_id,
    required this.name,
    required this.email,
    required this.confirmed,
  });

  @override
  String toString() {
    return "User ID: ${user_id.toString()}, User Name: ${name}, Email: ${email}, Phone Number ${confirmed}.";
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        user_id: json['user_id'] as int,
        name: json['name'] as String,
        email: json['email'] as String,
        confirmed: json['confirmed'] as int);
  }
}
