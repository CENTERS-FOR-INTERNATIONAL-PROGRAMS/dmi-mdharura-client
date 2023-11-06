import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:m_dharura/model/page.dart';
import 'package:m_dharura/model/role.dart';

part 'role_page.g.dart';

@JsonSerializable()
class RolePage extends Page<Role> {
  @override
  String toString() => jsonEncode(toJson());

  static RolePage fromJson(dynamic json) => _$RolePageFromJson(json);

  Map<String, dynamic> toJson() => _$RolePageToJson(this);
}
