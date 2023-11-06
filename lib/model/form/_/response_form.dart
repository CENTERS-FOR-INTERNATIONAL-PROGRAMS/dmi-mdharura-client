import 'package:m_dharura/helper/base_object.dart';
import 'package:m_dharura/model/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'response_form.g.dart';

@JsonSerializable()
class ResponseForm extends BaseObject {
  User? user;
  String? eventType;
  DateTime? dateSCMOHInformed;
  DateTime? dateResponseStarted;
  List<String>? responseActivities;
  String? otherResponseActivity;
  String? outcomeOfResponse;
  List<String>? recommendations;
  DateTime? dateEscalated;
  DateTime? dateOfReport;
  String? additionalInformation;

  static ResponseForm fromJson(dynamic json) => _$ResponseFormFromJson(json);

  @override
  String toString() => toJson().toString();

  Map<String, dynamic> toJson() => _$ResponseFormToJson(this);
}
