// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'role.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Role _$RoleFromJson(Map<String, dynamic> json) => Role()
  ..id = json['_id'] as String?
  ..baseStatus = json['_status'] as String?
  ..createdAt = json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String)
  ..unit = Unit.fromJson(json['unit'] as Map<String, dynamic>)
  ..user = User.fromJson(json['user'] as Map<String, dynamic>)
  ..spot = json['spot'] as String
  ..status = json['status'] as String;

Map<String, dynamic> _$RoleToJson(Role instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('_id', instance.id);
  writeNotNull('_status', instance.baseStatus);
  writeNotNull('createdAt', instance.createdAt?.toIso8601String());
  val['unit'] = instance.unit;
  val['user'] = instance.user;
  val['spot'] = instance.spot;
  val['status'] = instance.status;
  return val;
}
