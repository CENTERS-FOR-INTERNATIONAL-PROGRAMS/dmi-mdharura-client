// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lebs_escalation_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LebsEscalationForm _$LebsEscalationFormFromJson(Map<String, dynamic> json) =>
    LebsEscalationForm()
      ..id = json['_id'] as String?
      ..baseStatus = json['_status'] as String?
      ..createdAt = json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String)
      ..user = json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>)
      ..eventType = json['eventType'] as String?
      ..dateResponseStarted = json['dateResponseStarted'] == null
          ? null
          : DateTime.parse(json['dateResponseStarted'] as String)
      ..reason = json['reason'] as String?
      ..reasonOther = json['reasonOther'] as String?
      ..dateEscalated = json['dateEscalated'] == null
          ? null
          : DateTime.parse(json['dateEscalated'] as String);

Map<String, dynamic> _$LebsEscalationFormToJson(LebsEscalationForm instance) {
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
  writeNotNull('eventType', instance.eventType);
  writeNotNull(
      'dateResponseStarted', instance.dateResponseStarted?.toIso8601String());
  writeNotNull('reason', instance.reason);
  writeNotNull('reasonOther', instance.reasonOther);
  writeNotNull('dateEscalated', instance.dateEscalated?.toIso8601String());
  return val;
}
