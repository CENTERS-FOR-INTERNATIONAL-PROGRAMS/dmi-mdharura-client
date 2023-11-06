// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Unit _$UnitFromJson(Map<String, dynamic> json) => Unit()
  ..id = json['_id'] as String?
  ..baseStatus = json['_status'] as String?
  ..createdAt = json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String)
  ..type = json['type'] as String
  ..name = json['name'] as String
  ..parent = json['parent'] as String?
  ..code = json['code'] as String?
  ..state = json['state'] as String;

Map<String, dynamic> _$UnitToJson(Unit instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('_id', instance.id);
  writeNotNull('_status', instance.baseStatus);
  writeNotNull('createdAt', instance.createdAt?.toIso8601String());
  val['type'] = instance.type;
  val['name'] = instance.name;
  writeNotNull('parent', instance.parent);
  writeNotNull('code', instance.code);
  val['state'] = instance.state;
  return val;
}
