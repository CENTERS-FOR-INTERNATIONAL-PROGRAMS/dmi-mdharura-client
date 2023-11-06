// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pending.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PendingAdapter extends TypeAdapter<Pending> {
  @override
  final int typeId = 2;

  @override
  Pending read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Pending()
      ..signalId = fields[0] as String
      ..type = fields[1] as String
      ..subType = fields[2] as String
      ..form = (fields[3] as Map).cast<String, dynamic>();
  }

  @override
  void write(BinaryWriter writer, Pending obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.signalId)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.subType)
      ..writeByte(3)
      ..write(obj.form);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PendingAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
