import 'package:json_annotation/json_annotation.dart';
import 'package:m_dharura/helper/base_object.dart';
import 'package:m_dharura/model/user.dart';

part 'pmebs_request_form.g.dart';

@JsonSerializable()
class PmebsRequestForm extends BaseObject {
  User? user;
  DateTime? dateReported;
  DateTime? dateRequested;
  String? description;
  String? locality;

  static PmebsRequestForm fromJson(dynamic json) =>
      _$PmebsRequestFormFromJson(json);

  @override
  String toString() => toJson().toString();

  Map<String, dynamic> toJson() => _$PmebsRequestFormToJson(this);
}
