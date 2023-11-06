// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pmebs_report_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PmebsReportForm _$PmebsReportFormFromJson(Map<String, dynamic> json) =>
    PmebsReportForm()
      ..id = json['_id'] as String?
      ..baseStatus = json['_status'] as String?
      ..createdAt = json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String)
      ..user = json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>)
      ..dateReported = json['dateReported'] == null
          ? null
          : DateTime.parse(json['dateReported'] as String)
      ..dateDetected = json['dateDetected'] == null
          ? null
          : DateTime.parse(json['dateDetected'] as String)
      ..description = json['description'] as String?
      ..locality = json['locality'] as String?
      ..signal = json['signal'] as String?
      ..source = json['source'] as String?;

Map<String, dynamic> _$PmebsReportFormToJson(PmebsReportForm instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('_id', instance.id);
  writeNotNull('_status', instance.baseStatus);
  writeNotNull('createdAt', instance.createdAt?.toIso8601String());
  writeNotNull('user', instance.user);
  writeNotNull('dateReported', instance.dateReported?.toIso8601String());
  writeNotNull('dateDetected', instance.dateDetected?.toIso8601String());
  writeNotNull('description', instance.description);
  writeNotNull('locality', instance.locality);
  writeNotNull('signal', instance.signal);
  writeNotNull('source', instance.source);
  return val;
}
