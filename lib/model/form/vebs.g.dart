// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vebs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Vebs _$VebsFromJson(Map<String, dynamic> json) => Vebs()
  ..id = json['_id'] as String?
  ..baseStatus = json['_status'] as String?
  ..createdAt = json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String)
  ..verificationForm = json['verificationForm'] == null
      ? null
      : VerificationForm.fromJson(
          json['verificationForm'] as Map<String, dynamic>)
  ..investigationForm = json['investigationForm'] == null
      ? null
      : InvestigationForm.fromJson(
          json['investigationForm'] as Map<String, dynamic>)
  ..responseForm = json['responseForm'] == null
      ? null
      : ResponseForm.fromJson(json['responseForm'] as Map<String, dynamic>)
  ..escalationForm = json['escalationForm'] == null
      ? null
      : EscalationForm.fromJson(json['escalationForm'] as Map<String, dynamic>)
  ..summaryForm = json['summaryForm'] == null
      ? null
      : SummaryForm.fromJson(json['summaryForm'] as Map<String, dynamic>)
  ..labForm = json['labForm'] == null
      ? null
      : LabForm.fromJson(json['labForm'] as Map<String, dynamic>);

Map<String, dynamic> _$VebsToJson(Vebs instance) {
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
  writeNotNull('labForm', instance.labForm);
  return val;
}
