import 'package:json_annotation/json_annotation.dart';
import 'package:m_dharura/model/form/_/escalation_form.dart';
import 'package:m_dharura/model/user.dart';

part 'lebs_escalation_form.g.dart';

@JsonSerializable()
class LebsEscalationForm extends EscalationForm {
  static LebsEscalationForm fromJson(dynamic json) =>
      _$LebsEscalationFormFromJson(json);

  @override
  String toString() => toJson().toString();

  @override
  Map<String, dynamic> toJson() => _$LebsEscalationFormToJson(this);
}
