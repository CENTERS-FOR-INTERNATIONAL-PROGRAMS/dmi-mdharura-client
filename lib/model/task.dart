import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:m_dharura/helper/base_object.dart';
import 'package:m_dharura/model/form/cebs.dart';
import 'package:m_dharura/model/form/hebs.dart';
import 'package:m_dharura/model/form/lebs.dart';
import 'package:m_dharura/model/form/pmebs.dart';
import 'package:m_dharura/model/form/vebs.dart';
import 'package:m_dharura/model/unit.dart';
import 'package:m_dharura/model/user.dart';

part 'task.g.dart';

@JsonSerializable()
class Task extends BaseObject {
  late Unit unit;

  late User user;

  late String signal;

  late String signalId;

  Cebs? cebs;

  Hebs? hebs;

  Lebs? lebs;

  Pmebs? pmebs;

  Vebs? vebs;

  late String status;

  late String state;

  late String via;

  static Task fromJson(dynamic json) => _$TaskFromJson(json);

  static Task fromString(String json) => _$TaskFromJson(jsonDecode(json));

  @override
  String toString() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$TaskToJson(this);
}
