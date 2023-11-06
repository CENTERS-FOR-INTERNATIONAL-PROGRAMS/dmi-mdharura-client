import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:m_dharura/model/graph_item.dart';

part 'graph.g.dart';

@JsonSerializable()
class Graph {
  String? id;
  String? color;
  List<GraphItem>? graphItems;

  static Graph fromJson(dynamic json) => _$GraphFromJson(json);

  static Graph fromString(String json) => _$GraphFromJson(jsonDecode(json));

  @override
  String toString() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$GraphToJson(this);
}
