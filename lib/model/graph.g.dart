// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'graph.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Graph _$GraphFromJson(Map<String, dynamic> json) => Graph()
  ..id = json['id'] as String?
  ..color = json['color'] as String?
  ..graphItems = (json['graphItems'] as List<dynamic>?)
      ?.map((e) => GraphItem.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$GraphToJson(Graph instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('color', instance.color);
  writeNotNull('graphItems', instance.graphItems);
  return val;
}
