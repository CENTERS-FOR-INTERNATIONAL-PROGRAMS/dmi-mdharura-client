import 'package:json_annotation/json_annotation.dart';
import 'package:m_dharura/helper/base_object.dart';

import '../../user.dart';

part 'lebs_response_form.g.dart';

@JsonSerializable()
class LebsResponseForm extends BaseObject {
  User? user;
  DateTime? dateSCMOHInformed;
  DateTime? dateResponseStarted;
  int? humansCases;
  List<String>? responseActivities;
  int? humansQuarantined;
  List<String>? quarantineTypes;
  String? isHumansQuarantinedFollowedUp;
  String? isHumansIsolated;
  List<String>? isolationTypes;
  int? humansDead;
  List<String>? eventStatuses;
  String? additionalInformation;

  static LebsResponseForm fromJson(dynamic json) =>
      _$LebsResponseFormFromJson(json);

  @override
  String toString() => toJson().toString();

  Map<String, dynamic> toJson() => _$LebsResponseFormToJson(this);
}
