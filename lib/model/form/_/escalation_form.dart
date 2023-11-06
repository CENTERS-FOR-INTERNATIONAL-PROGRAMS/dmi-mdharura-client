import 'package:m_dharura/helper/base_object.dart';
import 'package:m_dharura/model/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'escalation_form.g.dart';

@JsonSerializable()
class EscalationForm extends BaseObject {
  User? user;
  String? eventType;
  // String cause;
  DateTime? dateResponseStarted;
  String? reason;
  String? reasonOther;
  DateTime? dateEscalated;

  static EscalationForm fromJson(dynamic json) =>
      _$EscalationFormFromJson(json);

  @override
  String toString() => toJson().toString();

  Map<String, dynamic> toJson() => _$EscalationFormToJson(this);
}
