// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lebs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Lebs _$LebsFromJson(Map<String, dynamic> json) => Lebs()
  ..id = json['_id'] as String?
  ..baseStatus = json['_status'] as String?
  ..createdAt = json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String)
  ..verificationForm = json['verificationForm'] == null
      ? null
      : LebsVerificationForm.fromJson(
          json['verificationForm'] as Map<String, dynamic>)
  ..investigationForm = json['investigationForm'] == null
      ? null
      : LebsInvestigationForm.fromJson(
          json['investigationForm'] as Map<String, dynamic>)
  ..responseForm = json['responseForm'] == null
      ? null
      : LebsResponseForm.fromJson(json['responseForm'] as Map<String, dynamic>)
  ..escalationForm = json['escalationForm'] == null
      ? null
      : LebsEscalationForm.fromJson(
          json['escalationForm'] as Map<String, dynamic>)
  ..summaryForm = json['summaryForm'] == null
      ? null
      : SummaryForm.fromJson(json['summaryForm'] as Map<String, dynamic>);

Map<String, dynamic> _$LebsToJson(Lebs instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('_id', instance.id);
  writeNotNull('_status', instance.baseStatus);
  writeNotNull('createdAt', instance.createdAt?.toIso8601String());
  writeNotNull('verificationForm', instance.verificationForm);
  writeNotNull('investigationForm', instance.investigationForm);
  writeNotNull('responseForm', instance.responseForm);
  writeNotNull('escalationForm', instance.escalationForm);
  writeNotNull('summaryForm', instance.summaryForm);
  return val;
}
