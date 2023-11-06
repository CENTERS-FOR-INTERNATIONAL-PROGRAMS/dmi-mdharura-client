import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'graph_item.g.dart';

@JsonSerializable()
class GraphItem {
  String? name;

  int? value;

  static GraphItem fromJson(dynamic json) => _$GraphItemFromJson(json);

  static GraphItem fromString(String json) =>
      _$GraphItemFromJson(jsonDecode(json));

  @override
  String toString() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$GraphItemToJson(this);
}
