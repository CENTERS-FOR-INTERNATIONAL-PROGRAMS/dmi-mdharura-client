// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lebs_lab_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LebsLabForm _$LebsLabFormFromJson(Map<String, dynamic> json) => LebsLabForm()
  ..id = json['_id'] as String?
  ..baseStatus = json['_status'] as String?
  ..createdAt = json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String)
  ..user = json['user'] == null
      ? null
      : User.fromJson(json['user'] as Map<String, dynamic>)
  ..dateOfSampleCollected = json['dateOfSampleCollected'] == null
      ? null
      : DateTime.parse(json['dateOfSampleCollected'] as String)
  ..labResults = json['labResults'] as String?
  ..dateLabResultsReceived = json['dateLabResultsReceived'] == null
      ? null
      : DateTime.parse(json['dateLabResultsReceived'] as String);

Map<String, dynamic> _$LebsLabFormToJson(LebsLabForm instance) {
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
  writeNotNull('dateOfSampleCollected',
      instance.dateOfSampleCollected?.toIso8601String());
  writeNotNull('labResults', instance.labResults);
  writeNotNull('dateLabResultsReceived',
      instance.dateLabResultsReceived?.toIso8601String());
  return val;
}
