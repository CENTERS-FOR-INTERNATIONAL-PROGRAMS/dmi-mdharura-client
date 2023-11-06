// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lebs_response_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LebsResponseForm _$LebsResponseFormFromJson(Map<String, dynamic> json) =>
    LebsResponseForm()
      ..id = json['_id'] as String?
      ..baseStatus = json['_status'] as String?
      ..createdAt = json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String)
      ..user = json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>)
      ..dateSCMOHInformed = json['dateSCMOHInformed'] == null
          ? null
          : DateTime.parse(json['dateSCMOHInformed'] as String)
      ..dateResponseStarted = json['dateResponseStarted'] == null
          ? null
          : DateTime.parse(json['dateResponseStarted'] as String)
      ..humansCases = json['humansCases'] as int?
      ..responseActivities = (json['responseActivities'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
      ..humansQuarantined = json['humansQuarantined'] as int?
      ..quarantineTypes = (json['quarantineTypes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
      ..isHumansQuarantinedFollowedUp =
          json['isHumansQuarantinedFollowedUp'] as String?
      ..isHumansIsolated = json['isHumansIsolated'] as String?
      ..isolationTypes = (json['isolationTypes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
      ..humansDead = json['humansDead'] as int?
      ..eventStatuses = (json['eventStatuses'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
      ..additionalInformation = json['additionalInformation'] as String?;

Map<String, dynamic> _$LebsResponseFormToJson(LebsResponseForm instance) {
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
  writeNotNull(
      'dateSCMOHInformed', instance.dateSCMOHInformed?.toIso8601String());
  writeNotNull(
      'dateResponseStarted', instance.dateResponseStarted?.toIso8601String());
  writeNotNull('humansCases', instance.humansCases);
  writeNotNull('responseActivities', instance.responseActivities);
  writeNotNull('humansQuarantined', instance.humansQuarantined);
  writeNotNull('quarantineTypes', instance.quarantineTypes);
  writeNotNull(
      'isHumansQuarantinedFollowedUp', instance.isHumansQuarantinedFollowedUp);
  writeNotNull('isHumansIsolated', instance.isHumansIsolated);
  writeNotNull('isolationTypes', instance.isolationTypes);
  writeNotNull('humansDead', instance.humansDead);
  writeNotNull('eventStatuses', instance.eventStatuses);
  writeNotNull('additionalInformation', instance.additionalInformation);
  return val;
}
