// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'graph_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GraphItem _$GraphItemFromJson(Map<String, dynamic> json) => GraphItem()
  ..name = json['name'] as String?
  ..value = json['value'] as int?;

Map<String, dynamic> _$GraphItemToJson(GraphItem instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('value', instance.value);
  return val;
}
