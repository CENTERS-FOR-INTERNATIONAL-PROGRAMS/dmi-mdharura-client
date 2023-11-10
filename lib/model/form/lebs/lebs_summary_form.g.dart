// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lebs_summary_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LebsSummaryForm _$LebsSummaryFormFromJson(Map<String, dynamic> json) =>
    LebsSummaryForm()
      ..id = json['_id'] as String?
      ..baseStatus = json['_status'] as String?
      ..createdAt = json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String)
      ..user = json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>)
      ..eventStatus = json['eventStatus'] as String?
      ..escalatedTo = json['escalatedTo'] as String?
      ..cause = json['cause'] as String?;

Map<String, dynamic> _$LebsSummaryFormToJson(LebsSummaryForm instance) {
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
  writeNotNull('eventStatus', instance.eventStatus);
  writeNotNull('escalatedTo', instance.escalatedTo);
  writeNotNull('cause', instance.cause);
  return val;
}
