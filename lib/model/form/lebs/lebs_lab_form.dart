import 'package:m_dharura/helper/base_object.dart';
import 'package:m_dharura/model/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'lebs_lab_form.g.dart';

@JsonSerializable()
class LebsLabForm extends BaseObject {
  User? user;
  DateTime? dateOfSampleCollected;
  String? labResults;
  DateTime? dateLabResultsReceived;

  static LebsLabForm fromJson(dynamic json) => _$LebsLabFormFromJson(json);

  @override
  String toString() => toJson().toString();

  Map<String, dynamic> toJson() => _$LebsLabFormToJson(this);
}
