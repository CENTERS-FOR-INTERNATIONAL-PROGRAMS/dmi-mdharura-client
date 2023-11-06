import 'package:m_dharura/helper/base_object.dart';
import 'package:m_dharura/model/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'investigation_form.g.dart';

@JsonSerializable()
class InvestigationForm extends BaseObject {
  User? user;
  DateTime? dateSCDSCInformed;
  DateTime? dateInvestigationStarted;
  DateTime? dateEventStarted;
  String? symptoms;

  // int humansExposed;
  // int humansPresentingSymptoms;
  int? humansCases;
  int? humansCasesHospitalized;
  int? humansDead;

  // int animalsExposed;
  int? animalsCases;

  // int animalsSick;
  int? animalsDead;
  String? isCauseKnown;
  String? cause;
  String? isLabSamplesCollected;
  DateTime? dateSampleCollected;

  // String typeOfSample;
  // String testRequested;
  String? labResults;
  DateTime? dateLabResultsReceived;
  String? isNewCasedReportedFromInitialArea;
  String? isNewCasedReportedFromNewAreas;
  String? isEventSettingPromotingSpread;
  String? additionalInformation;
  String? riskClassification;
  List<String>? responseActivities;
  DateTime? dateSCMOHInformed;

  double humanAttackRate() => humansCasesHospitalized! * 100 / humansCases!;

  double humanHospitalizationRate() =>
      humansCasesHospitalized! * 100 / humansCases!;

  double humanFatalityRate() => humansDead! * 100 / humansCases!;

  double animalFatalityRate() => animalsDead! * 100 / animalsCases!;

  static InvestigationForm fromJson(dynamic json) =>
      _$InvestigationFormFromJson(json);

  @override
  String toString() => toJson().toString();

  Map<String, dynamic> toJson() => _$InvestigationFormToJson(this);
}
