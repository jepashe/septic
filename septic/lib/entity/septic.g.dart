// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'septic.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SepticAdapter extends TypeAdapter<Septic> {
  @override
  final int typeId = 11;

  @override
  Septic read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Septic(
      address: fields[0] as String,
      phone: fields[1] as String,
      contact: fields[2] as String,
      volume: fields[3] as String,
      height: fields[4] as String,
      shift: fields[5] as String,
      threshold: fields[6] as String,
      user_id: fields[7] as int,
      api_key: fields[8] as String,
      device_id: fields[9] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Septic obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.address)
      ..writeByte(1)
      ..write(obj.phone)
      ..writeByte(2)
      ..write(obj.contact)
      ..writeByte(3)
      ..write(obj.volume)
      ..writeByte(4)
      ..write(obj.height)
      ..writeByte(5)
      ..write(obj.shift)
      ..writeByte(6)
      ..write(obj.threshold)
      ..writeByte(7)
      ..write(obj.user_id)
      ..writeByte(8)
      ..write(obj.api_key)
      ..writeByte(9)
      ..write(obj.device_id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SepticAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
