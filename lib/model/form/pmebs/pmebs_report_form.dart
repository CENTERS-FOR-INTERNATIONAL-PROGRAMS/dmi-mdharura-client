import 'package:json_annotation/json_annotation.dart';
import 'package:m_dharura/helper/base_object.dart';
import 'package:m_dharura/model/user.dart';

part 'pmebs_report_form.g.dart';

@JsonSerializable()
class PmebsReportForm extends BaseObject {
  User? user;
  DateTime? dateReported;
  DateTime? dateDetected;
  String? description;
  String? locality;
  String? signal;
  String? source;

  static PmebsReportForm fromJson(dynamic json) =>
      _$PmebsReportFormFromJson(json);

  @override
  String toString() => toJson().toString();

  Map<String, dynamic> toJson() => _$PmebsReportFormToJson(this);
}
