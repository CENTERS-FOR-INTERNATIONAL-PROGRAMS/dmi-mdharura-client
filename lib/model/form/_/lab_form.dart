import 'package:m_dharura/helper/base_object.dart';
import 'package:m_dharura/model/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'lab_form.g.dart';

@JsonSerializable()
class LabForm extends BaseObject {
  User? user;
  DateTime? dateSampleCollected;
  String? labResults;
  DateTime? dateLabResultsReceived;

  static LabForm fromJson(dynamic json) => _$LabFormFromJson(json);

  @override
  String toString() => toJson().toString();

  Map<String, dynamic> toJson() => _$LabFormToJson(this);
}
