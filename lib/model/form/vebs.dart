import 'package:json_annotation/json_annotation.dart';
import 'package:m_dharura/helper/base_object.dart';
import 'package:m_dharura/model/form/_/escalation_form.dart';
import 'package:m_dharura/model/form/_/investigation_form.dart';
import 'package:m_dharura/model/form/_/response_form.dart';
import 'package:m_dharura/model/form/_/verification_form.dart';

part 'vebs.g.dart';

@JsonSerializable()
class Vebs extends BaseObject {
  VerificationForm? verificationForm;
  InvestigationForm? investigationForm;
  ResponseForm? responseForm;
  EscalationForm? escalationForm;

  static Vebs fromJson(dynamic json) => _$VebsFromJson(json);

  @override
  String toString() => toJson().toString();

  Map<String, dynamic> toJson() => _$VebsToJson(this);
}
