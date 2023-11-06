import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:m_dharura/helper/base_object.dart';
import 'package:m_dharura/model/unit.dart';
import 'package:m_dharura/model/user.dart';

part 'role.g.dart';

@JsonSerializable()
class Role extends BaseObject {
  late Unit unit;
  late User user;
  late String spot;
  late String status;

  static Role fromJson(dynamic json) => _$RoleFromJson(json);

  static Role fromString(String json) => _$RoleFromJson(jsonDecode(json));

  @override
  String toString() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$RoleToJson(this);
}
