import 'package:septic/domain/api_septic_http.dart';
import 'package:septic/entity/septic.dart';
import 'package:septic/entity/user.dart';

class SepticRepository {
  SepticRepository({ApiClient? septicApi})
      : _septicClient = septicApi ?? ApiClient();
  final ApiClient _septicClient;

  Future<List<Septic>?> getUserDevices({required User user}) async {
    return _septicClient.getUserDevices(user: user);
  }

  Future<bool> addSeptic(
      {required String number,
      required String address,
      required String phone,
      required String contact,
      required double volume,
      required double radius,
      required double height,
      required double shift,
      required double threshold,
      required User user}) async {
    return _septicClient.addSeptic(
      address: address,
      contact: contact,
      phone: phone,
      height: height,
      number: number,
      radius: radius,
      shift: shift,
      threshold: threshold,
      volume: volume,
      user: user,
    );
  }
}
