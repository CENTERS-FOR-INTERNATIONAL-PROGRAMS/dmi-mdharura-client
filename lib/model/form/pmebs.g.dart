// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pmebs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pmebs _$PmebsFromJson(Map<String, dynamic> json) => Pmebs()
  ..id = json['_id'] as String?
  ..baseStatus = json['_status'] as String?
  ..createdAt = json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String)
  ..requestForm = json['requestForm'] == null
      ? null
      : PmebsRequestForm.fromJson(json['requestForm'] as Map<String, dynamic>)
  ..reportForm = json['reportForm'] == null
      ? null
      : PmebsReportForm.fromJson(json['reportForm'] as Map<String, dynamic>);

Map<String, dynamic> _$PmebsToJson(Pmebs instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('_id', instance.id);
  writeNotNull('_status', instance.baseStatus);
  writeNotNull('createdAt', instance.createdAt?.toIso8601String());
  writeNotNull('requestForm', instance.requestForm);
  writeNotNull('reportForm', instance.reportForm);
  return val;
}
