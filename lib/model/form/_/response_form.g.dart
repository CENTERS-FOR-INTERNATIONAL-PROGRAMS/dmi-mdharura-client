// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseForm _$ResponseFormFromJson(Map<String, dynamic> json) => ResponseForm()
  ..id = json['_id'] as String?
  ..baseStatus = json['_status'] as String?
  ..createdAt = json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String)
  ..user = json['user'] == null
      ? null
      : User.fromJson(json['user'] as Map<String, dynamic>)
  ..eventType = json['eventType'] as String?
  ..dateSCMOHInformed = json['dateSCMOHInformed'] == null
      ? null
      : DateTime.parse(json['dateSCMOHInformed'] as String)
  ..dateResponseStarted = json['dateResponseStarted'] == null
      ? null
      : DateTime.parse(json['dateResponseStarted'] as String)
  ..responseActivities = (json['responseActivities'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList()
  ..otherResponseActivity = json['otherResponseActivity'] as String?
  ..outcomeOfResponse = json['outcomeOfResponse'] as String?
  ..recommendations = (json['recommendations'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList()
  ..dateEscalated = json['dateEscalated'] == null
      ? null
      : DateTime.parse(json['dateEscalated'] as String)
  ..dateOfReport = json['dateOfReport'] == null
      ? null
      : DateTime.parse(json['dateOfReport'] as String)
  ..additionalInformation = json['additionalInformation'] as String?;

Map<String, dynamic> _$ResponseFormToJson(ResponseForm instance) {
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
      'dateSCMOHInformed', instance.dateSCMOHInformed?.toIso8601String());
  writeNotNull(
      'dateResponseStarted', instance.dateResponseStarted?.toIso8601String());
  writeNotNull('responseActivities', instance.responseActivities);
  writeNotNull('otherResponseActivity', instance.otherResponseActivity);
  writeNotNull('outcomeOfResponse', instance.outcomeOfResponse);
  writeNotNull('recommendations', instance.recommendations);
  writeNotNull('dateEscalated', instance.dateEscalated?.toIso8601String());
  writeNotNull('dateOfReport', instance.dateOfReport?.toIso8601String());
  writeNotNull('additionalInformation', instance.additionalInformation);
  return val;
}
