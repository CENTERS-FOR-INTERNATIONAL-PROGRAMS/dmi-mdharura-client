import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:m_dharura/helper/base_object.dart';

part 'unit.g.dart';

@JsonSerializable()
class Unit extends BaseObject {
  late String type;
  late String name;
  String? parent;
  String? code;
  late String state;

  static Unit fromJson(dynamic json) => _$UnitFromJson(json);

  static Unit fromString(String json) => _$UnitFromJson(jsonDecode(json));

  @override
  String toString() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$UnitToJson(this);
}
