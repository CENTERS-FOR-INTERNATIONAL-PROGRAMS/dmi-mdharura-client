import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:m_dharura/db/type_id.dart';
import 'package:m_dharura/helper/base_object.dart';

part 'user.g.dart';

@HiveType(typeId: TypeId.kUser)
@JsonSerializable()
class User extends BaseObject {
  @HiveField(BaseObject.kBaseHiveIndex)
  late String displayName;

  @HiveField(BaseObject.kBaseHiveIndex + 1)
  late String phoneNumber;

  @HiveField(BaseObject.kBaseHiveIndex + 2)
  late String status;

  static User fromJson(dynamic json) => _$UserFromJson(json);

  static User fromString(String json) => _$UserFromJson(jsonDecode(json));

  @override
  String toString() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
