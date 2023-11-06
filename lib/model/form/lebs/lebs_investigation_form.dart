import 'package:json_annotation/json_annotation.dart';
import 'package:m_dharura/helper/base_object.dart';

import '../../user.dart';

part 'lebs_investigation_form.g.dart';

@JsonSerializable()
class LebsInvestigationForm extends BaseObject {
  User? user;
  DateTime? dateInvestigationStarted;
  List<String>? symptoms;
  String? symptomsOther;
  String? isCovid19WorkingCaseDefinitionMet;
  String? isSamplesCollected;
  String? labResults;
  String? isEventSettingPromotingSpread;
  String? measureHandHygiene;
  String? measureTempScreening;
  String? measurePhysicalDistancing;
  String? measureSocialDistancing;
  String? measureUseOfMasks;
  String? measureVentilation;
  String? additionalInformation;
  String? riskClassification;
  List<String>? responseActivities;

  static LebsInvestigationForm fromJson(dynamic json) =>
      _$LebsInvestigationFormFromJson(json);

  @override
  String toString() => toJson().toString();

  Map<String, dynamic> toJson() => _$LebsInvestigationFormToJson(this);
}
