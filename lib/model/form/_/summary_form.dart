import 'package:m_dharura/helper/base_object.dart';
import 'package:m_dharura/model/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'summary_form.g.dart';

@JsonSerializable()
class SummaryForm extends BaseObject {
  User? user;
  String? eventStatus;
  String? escalatedTo;
  String? cause;

  static SummaryForm fromJson(dynamic json) => _$SummaryFormFromJson(json);

  @override
  String toString() => toJson().toString();

  Map<String, dynamic> toJson() => _$SummaryFormToJson(this);
}
