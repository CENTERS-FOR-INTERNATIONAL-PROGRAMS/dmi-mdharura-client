import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:m_dharura/db/type_id.dart';

part 'settings.g.dart';

@HiveType(typeId: TypeId.kAppSettings)
@JsonSerializable()
class AppSettings {
  @HiveField(3)
  bool cebs = true;

  @HiveField(4)
  bool hebs = true;

  @HiveField(5)
  bool lebs = true;

  @HiveField(6)
  bool vebs = true;

  @HiveField(7)
  bool pebs = true;

  @HiveField(8)
  bool tasks = true;

  @HiveField(9)
  bool management = true;

  @HiveField(10)
  bool history = true;

  static AppSettings fromJson(dynamic json) => _$AppSettingsFromJson(json);

  static AppSettings fromString(String json) =>
      _$AppSettingsFromJson(jsonDecode(json));

  @override
  String toString() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$AppSettingsToJson(this);
}
