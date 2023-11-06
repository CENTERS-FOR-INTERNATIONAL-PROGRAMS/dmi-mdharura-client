// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'investigation_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvestigationForm _$InvestigationFormFromJson(Map<String, dynamic> json) =>
    InvestigationForm()
      ..id = json['_id'] as String?
      ..baseStatus = json['_status'] as String?
      ..createdAt = json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String)
      ..user = json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>)
      ..dateSCDSCInformed = json['dateSCDSCInformed'] == null
          ? null
          : DateTime.parse(json['dateSCDSCInformed'] as String)
      ..dateInvestigationStarted = json['dateInvestigationStarted'] == null
          ? null
          : DateTime.parse(json['dateInvestigationStarted'] as String)
      ..dateEventStarted = json['dateEventStarted'] == null
          ? null
          : DateTime.parse(json['dateEventStarted'] as String)
      ..symptoms = json['symptoms'] as String?
      ..humansCases = json['humansCases'] as int?
      ..humansCasesHospitalized = json['humansCasesHospitalized'] as int?
      ..humansDead = json['humansDead'] as int?
      ..animalsCases = json['animalsCases'] as int?
      ..animalsDead = json['animalsDead'] as int?
      ..isCauseKnown = json['isCauseKnown'] as String?
      ..cause = json['cause'] as String?
      ..isLabSamplesCollected = json['isLabSamplesCollected'] as String?
      ..dateSampleCollected = json['dateSampleCollected'] == null
          ? null
          : DateTime.parse(json['dateSampleCollected'] as String)
      ..labResults = json['labResults'] as String?
      ..dateLabResultsReceived = json['dateLabResultsReceived'] == null
          ? null
          : DateTime.parse(json['dateLabResultsReceived'] as String)
      ..isNewCasedReportedFromInitialArea =
          json['isNewCasedReportedFromInitialArea'] as String?
      ..isNewCasedReportedFromNewAreas =
          json['isNewCasedReportedFromNewAreas'] as String?
      ..isEventSettingPromotingSpread =
          json['isEventSettingPromotingSpread'] as String?
      ..additionalInformation = json['additionalInformation'] as String?
      ..riskClassification = json['riskClassification'] as String?
      ..responseActivities = (json['responseActivities'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
      ..dateSCMOHInformed = json['dateSCMOHInformed'] == null
          ? null
          : DateTime.parse(json['dateSCMOHInformed'] as String);

Map<String, dynamic> _$InvestigationFormToJson(InvestigationForm instance) {
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
      'dateSCDSCInformed', instance.dateSCDSCInformed?.toIso8601String());
  writeNotNull('dateInvestigationStarted',
      instance.dateInvestigationStarted?.toIso8601String());
  writeNotNull(
      'dateEventStarted', instance.dateEventStarted?.toIso8601String());
  writeNotNull('symptoms', instance.symptoms);
  writeNotNull('humansCases', instance.humansCases);
  writeNotNull('humansCasesHospitalized', instance.humansCasesHospitalized);
  writeNotNull('humansDead', instance.humansDead);
  writeNotNull('animalsCases', instance.animalsCases);
  writeNotNull('animalsDead', instance.animalsDead);
  writeNotNull('isCauseKnown', instance.isCauseKnown);
  writeNotNull('cause', instance.cause);
  writeNotNull('isLabSamplesCollected', instance.isLabSamplesCollected);
  writeNotNull(
      'dateSampleCollected', instance.dateSampleCollected?.toIso8601String());
  writeNotNull('labResults', instance.labResults);
  writeNotNull('dateLabResultsReceived',
      instance.dateLabResultsReceived?.toIso8601String());
  writeNotNull('isNewCasedReportedFromInitialArea',
      instance.isNewCasedReportedFromInitialArea);
  writeNotNull('isNewCasedReportedFromNewAreas',
      instance.isNewCasedReportedFromNewAreas);
  writeNotNull(
      'isEventSettingPromotingSpread', instance.isEventSettingPromotingSpread);
  writeNotNull('additionalInformation', instance.additionalInformation);
  writeNotNull('riskClassification', instance.riskClassification);
  writeNotNull('responseActivities', instance.responseActivities);
  writeNotNull(
      'dateSCMOHInformed', instance.dateSCMOHInformed?.toIso8601String());
  return val;
}
