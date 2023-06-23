import 'package:hive/hive.dart';
import 'package:septic/entity/septic.dart';

part 'user.g.dart';

@HiveType(typeId: 10)
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
  @HiveField(6)
  final List<Septic>? septics;

  User(
      {required this.name,
      required this.email,
      required this.confirmed,
      required this.user_id,
      this.password,
      this.token,
      this.septics});

  @override
  String toString() {
    return "User Name: ${name}, Email: ${email}, Confirmed User: ${confirmed}, User ID: ${user_id.toString()}, Password User: ${password}, Token User: ${token}.";
  }

  User copyWith(
          {String? name,
          String? email,
          int? confirmed,
          int? user_id,
          String? password,
          String? token}) =>
      User(
          name: name ?? this.name,
          email: email ?? this.email,
          confirmed: confirmed ?? this.confirmed,
          user_id: user_id ?? this.user_id,
          password: password ?? this.password,
          token: token ?? this.token);

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        name: json['name'] as String,
        email: json['email'] as String,
        confirmed: json['confirmed'] as int,
        user_id: json['user_id'] as int);
  }
}
