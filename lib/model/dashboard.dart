import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:m_dharura/model/graph.dart';

part 'dashboard.g.dart';

@JsonSerializable()
class Dashboard {
  String? title;
  List<Graph>? graphs;
  int? columns;
  double? height;

  static Dashboard fromJson(dynamic json) => _$DashboardFromJson(json);

  static Dashboard fromString(String json) =>
      _$DashboardFromJson(jsonDecode(json));

  @override
  String toString() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$DashboardToJson(this);
}
