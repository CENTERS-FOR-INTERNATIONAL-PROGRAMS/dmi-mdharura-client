// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Dashboard _$DashboardFromJson(Map<String, dynamic> json) => Dashboard()
  ..title = json['title'] as String?
  ..graphs = (json['graphs'] as List<dynamic>?)
      ?.map((e) => Graph.fromJson(e as Map<String, dynamic>))
      .toList()
  ..columns = json['columns'] as int?
  ..height = (json['height'] as num?)?.toDouble();

Map<String, dynamic> _$DashboardToJson(Dashboard instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('title', instance.title);
  writeNotNull('graphs', instance.graphs);
  writeNotNull('columns', instance.columns);
  writeNotNull('height', instance.height);
  return val;
}
