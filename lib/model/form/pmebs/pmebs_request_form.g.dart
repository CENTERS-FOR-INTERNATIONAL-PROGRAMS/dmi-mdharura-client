// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pmebs_request_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PmebsRequestForm _$PmebsRequestFormFromJson(Map<String, dynamic> json) =>
    PmebsRequestForm()
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
      ..dateRequested = json['dateRequested'] == null
          ? null
          : DateTime.parse(json['dateRequested'] as String)
      ..description = json['description'] as String?
      ..locality = json['locality'] as String?;

Map<String, dynamic> _$PmebsRequestFormToJson(PmebsRequestForm instance) {
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
  writeNotNull('dateRequested', instance.dateRequested?.toIso8601String());
  writeNotNull('description', instance.description);
  writeNotNull('locality', instance.locality);
  return val;
}
