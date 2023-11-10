import 'package:json_annotation/json_annotation.dart';
import 'package:m_dharura/helper/base_object.dart';
import 'package:m_dharura/model/form/_/escalation_form.dart';
import 'package:m_dharura/model/form/_/investigation_form.dart';
import 'package:m_dharura/model/form/_/response_form.dart';
import 'package:m_dharura/model/form/_/summary_form.dart';
import 'package:m_dharura/model/form/_/verification_form.dart';

part 'hebs.g.dart';

@JsonSerializable()
class Hebs extends BaseObject {
  VerificationForm? verificationForm;
  InvestigationForm? investigationForm;
  ResponseForm? responseForm;
  EscalationForm? escalationForm;
  SummaryForm? summaryForm;

  static Hebs fromJson(dynamic json) => _$HebsFromJson(json);

  @override
  String toString() => toJson().toString();

  Map<String, dynamic> toJson() => _$HebsToJson(this);
}
