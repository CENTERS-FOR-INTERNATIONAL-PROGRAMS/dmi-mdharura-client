import 'package:m_dharura/helper/base_object.dart';
import 'package:m_dharura/model/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'lebs_summary_form.g.dart';

@JsonSerializable()
class LebsSummaryForm extends BaseObject {
  User? user;
  String? eventStatus;
  String? escalatedTo;
  String? cause;

  static LebsSummaryForm fromJson(dynamic json) => _$LebsSummaryFormFromJson(json);

  @override
  String toString() => toJson().toString();

  Map<String, dynamic> toJson() => _$LebsSummaryFormToJson(this);
}
