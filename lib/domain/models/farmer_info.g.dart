// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'farmer_info.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FarmerInfoAdapter extends TypeAdapter<FarmerInfo> {
  @override
  final int typeId = 0;

  @override
  FarmerInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FarmerInfo()
      ..isLogedIn = fields[0] as bool?
      ..id = fields[1] as String?
      ..name = fields[2] as String?;
  }

  @override
  void write(BinaryWriter writer, FarmerInfo obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.isLogedIn)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FarmerInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
