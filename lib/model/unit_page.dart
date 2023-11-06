import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:m_dharura/model/page.dart';
import 'package:m_dharura/model/unit.dart';

part 'unit_page.g.dart';

@JsonSerializable()
class UnitPage extends Page<Unit> {
  @override
  String toString() => jsonEncode(toJson());

  static UnitPage fromJson(dynamic json) => _$UnitPageFromJson(json);

  Map<String, dynamic> toJson() => _$UnitPageToJson(this);
}
