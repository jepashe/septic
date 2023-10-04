/*
import 'package:septic/domain/api_septic_faike.dart';
import 'package:septic/entity/septic.dart';

class SepticRepository {
  SepticRepository({ApiClient? septicApi})
      : _septicClient = septicApi ?? ApiClient();
  final ApiClient _septicClient;

  Future<void> listSepticUser() async {}

  Future<Septic> addSeptic(
      {required String number,
      required String address,
      required String phone,
      required String contact,
      required double volume,
      required double radius,
      required double height,
      required double shift,
      required double threshold}) async {
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
    );
  }
}*/
