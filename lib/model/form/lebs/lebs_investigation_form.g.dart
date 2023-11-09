// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lebs_investigation_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LebsInvestigationForm _$LebsInvestigationFormFromJson(
        Map<String, dynamic> json) =>
    LebsInvestigationForm()
      ..id = json['_id'] as String?
      ..baseStatus = json['_status'] as String?
      ..createdAt = json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String)
      ..user = json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>)
      ..dateInvestigationStarted = json['dateInvestigationStarted'] == null
          ? null
          : DateTime.parse(json['dateInvestigationStarted'] as String)
      ..symptoms =
          (json['symptoms'] as List<dynamic>?)?.map((e) => e as String).toList()
      ..symptomsOther = json['symptomsOther'] as String?
      ..isCovid19WorkingCaseDefinitionMet =
          json['isCovid19WorkingCaseDefinitionMet'] as String?
      ..isSamplesCollected = json['isSamplesCollected'] as String?
      ..labResults = json['labResults'] as String?
      ..isEventSettingPromotingSpread =
          json['isEventSettingPromotingSpread'] as String?
      ..measureHandHygiene = json['measureHandHygiene'] as String?
      ..measureTempScreening = json['measureTempScreening'] as String?
      ..measurePhysicalDistancing = json['measurePhysicalDistancing'] as String?
      ..measureSocialDistancing = json['measureSocialDistancing'] as String?
      ..measureUseOfMasks = json['measureUseOfMasks'] as String?
      ..measureVentilation = json['measureVentilation'] as String?
      ..additionalInformation = json['additionalInformation'] as String?
      ..riskClassification = json['riskClassification'] as String?
      ..eventCategories = (json['eventCategories'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
      ..isEventInfectious = json['isEventInfectious'] as String?
      ..systemsAffectedByEvent =
          (json['systemsAffectedByEvent'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList()
      ..responseActivities = (json['responseActivities'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList();

Map<String, dynamic> _$LebsInvestigationFormToJson(
    LebsInvestigationForm instance) {
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
  writeNotNull('dateInvestigationStarted',
      instance.dateInvestigationStarted?.toIso8601String());
  writeNotNull('symptoms', instance.symptoms);
  writeNotNull('symptomsOther', instance.symptomsOther);
  writeNotNull('isCovid19WorkingCaseDefinitionMet',
      instance.isCovid19WorkingCaseDefinitionMet);
  writeNotNull('isSamplesCollected', instance.isSamplesCollected);
  writeNotNull('labResults', instance.labResults);
  writeNotNull(
      'isEventSettingPromotingSpread', instance.isEventSettingPromotingSpread);
  writeNotNull('measureHandHygiene', instance.measureHandHygiene);
  writeNotNull('measureTempScreening', instance.measureTempScreening);
  writeNotNull('measurePhysicalDistancing', instance.measurePhysicalDistancing);
  writeNotNull('measureSocialDistancing', instance.measureSocialDistancing);
  writeNotNull('measureUseOfMasks', instance.measureUseOfMasks);
  writeNotNull('measureVentilation', instance.measureVentilation);
  writeNotNull('additionalInformation', instance.additionalInformation);
  writeNotNull('riskClassification', instance.riskClassification);
  writeNotNull('eventCategories', instance.eventCategories);
  writeNotNull('isEventInfectious', instance.isEventInfectious);
  writeNotNull('systemsAffectedByEvent', instance.systemsAffectedByEvent);
  writeNotNull('responseActivities', instance.responseActivities);
  return val;
}
