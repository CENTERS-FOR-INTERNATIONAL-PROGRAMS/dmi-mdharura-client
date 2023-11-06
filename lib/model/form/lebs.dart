import 'package:json_annotation/json_annotation.dart';
import 'package:m_dharura/helper/base_object.dart';
import 'package:m_dharura/model/form/lebs/lebs_escalation_form.dart';
import 'package:m_dharura/model/form/lebs/lebs_investigation_form.dart';
import 'package:m_dharura/model/form/lebs/lebs_response_form.dart';
import 'package:m_dharura/model/form/lebs/lebs_verification_form.dart';

part 'lebs.g.dart';

@JsonSerializable()
class Lebs extends BaseObject {
  LebsVerificationForm? verificationForm;
  LebsInvestigationForm ?investigationForm;
  LebsResponseForm? responseForm;
  LebsEscalationForm? escalationForm;

  static Lebs fromJson(dynamic json) => _$LebsFromJson(json);

  @override
  String toString() => toJson().toString();

  Map<String, dynamic> toJson() => _$LebsToJson(this);
}
