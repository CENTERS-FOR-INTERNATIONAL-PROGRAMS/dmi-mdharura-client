// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 1;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User()
      ..displayName = fields[3] as String
      ..phoneNumber = fields[4] as String
      ..status = fields[5] as String
      ..id = fields[0] as String?
      ..baseStatus = fields[1] as String?
      ..createdAt = fields[2] as DateTime?;
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(6)
      ..writeByte(3)
      ..write(obj.displayName)
      ..writeByte(4)
      ..write(obj.phoneNumber)
      ..writeByte(5)
      ..write(obj.status)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.baseStatus)
      ..writeByte(2)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User()
  ..id = json['_id'] as String?
  ..baseStatus = json['_status'] as String?
  ..createdAt = json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String)
  ..displayName = json['displayName'] as String
  ..phoneNumber = json['phoneNumber'] as String
  ..status = json['status'] as String;

Map<String, dynamic> _$UserToJson(User instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('_id', instance.id);
  writeNotNull('_status', instance.baseStatus);
  writeNotNull('createdAt', instance.createdAt?.toIso8601String());
  val['displayName'] = instance.displayName;
  val['phoneNumber'] = instance.phoneNumber;
  val['status'] = instance.status;
  return val;
}
