import 'package:json_annotation/json_annotation.dart';
import 'package:m_dharura/helper/base_object.dart';
import 'package:m_dharura/model/form/_/escalation_form.dart';
import 'package:m_dharura/model/form/_/investigation_form.dart';
import 'package:m_dharura/model/form/_/lab_form.dart';
import 'package:m_dharura/model/form/_/response_form.dart';
import 'package:m_dharura/model/form/_/summary_form.dart';
import 'package:m_dharura/model/form/_/verification_form.dart';

part 'cebs.g.dart';

@JsonSerializable()
class Cebs extends BaseObject {
  VerificationForm? verificationForm;
  InvestigationForm? investigationForm;
  ResponseForm? responseForm;
  EscalationForm? escalationForm;
  SummaryForm? summaryForm;
  LabForm? labForm;

  static Cebs fromJson(dynamic json) => _$CebsFromJson(json);

  @override
  String toString() => toJson().toString();

  Map<String, dynamic> toJson() => _$CebsToJson(this);
}
