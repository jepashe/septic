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
  final String volume;
  @HiveField(4)
  final String height;
  @HiveField(5)
  final String shift;
  @HiveField(6)
  final String threshold;
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
        volume: json['volume'] as String,
        height: json['height'] as String,
        shift: json['shift'] as String,
        threshold: json['threshold'] as String,
        user_id: json['user_id'] as int,
        api_key: json['api_key'] as String,
        device_id: json['device_id'] as int);
  }
}
