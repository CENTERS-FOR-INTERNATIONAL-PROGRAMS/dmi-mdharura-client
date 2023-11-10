import 'package:json_annotation/json_annotation.dart';
import 'package:m_dharura/helper/base_object.dart';
import 'package:m_dharura/model/form/pmebs/pmebs_report_form.dart';
import 'package:m_dharura/model/form/pmebs/pmebs_request_form.dart';

part 'pmebs.g.dart';

@JsonSerializable()
class Pmebs extends BaseObject {
  PmebsRequestForm? requestForm;
  PmebsReportForm? reportForm;

  static Pmebs fromJson(dynamic json) => _$PmebsFromJson(json);

  @override
  String toString() => toJson().toString();

  Map<String, dynamic> toJson() => _$PmebsToJson(this);
}
