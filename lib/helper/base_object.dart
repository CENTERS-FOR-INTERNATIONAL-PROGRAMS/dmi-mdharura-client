import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

abstract class BaseObject {
  static const kBaseHiveIndex = 3;

  @HiveField(0)
  @JsonKey(name: '_id')
  String? id;

  @HiveField(1)
  @JsonKey(name: '_status')
  String? baseStatus;

  @HiveField(2)
  DateTime? createdAt;
}
