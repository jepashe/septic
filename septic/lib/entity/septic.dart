import 'package:hive/hive.dart';

part 'septic.g.dart';

@HiveType(typeId: 11)
class Septic {
  @HiveField(0)
  final String address;
  @HiveField(1)
  final String phone;
  @HiveField(2)
  final String contact;
  @HiveField(3)
  final double volume;
  @HiveField(4)
  final double height;
  @HiveField(5)
  final double shift;
  @HiveField(6)
  final double threshold;
  @HiveField(7)
  final int user_id;
  @HiveField(8)
  final String api_key;
  @HiveField(9)
  final int device_id;

  Septic(
      {required this.address,
      required this.phone,
      required this.contact,
      required this.volume,
      required this.height,
      required this.shift,
      required this.threshold,
      required this.user_id,
      required this.api_key,
      required this.device_id});

  factory Septic.fromJson(Map<String, dynamic> json) {
    return Septic(
        address: json['address'] as String,
        phone: json['phone'] as String,
        contact: json['contact'] as String,
        volume: json['volume'] as double,
        height: json['height'] as double,
        shift: json['shift'] as double,
        threshold: json['threshold'] as double,
        user_id: json['user_id'] as int,
        api_key: json['api_key'] as String,
        device_id: json['device_id'] as int);
  }
}
