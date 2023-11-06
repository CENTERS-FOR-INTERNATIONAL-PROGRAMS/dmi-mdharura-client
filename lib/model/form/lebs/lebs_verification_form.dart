import 'package:json_annotation/json_annotation.dart';
import 'package:m_dharura/helper/base_object.dart';

import '../../user.dart';

part 'lebs_verification_form.g.dart';

@JsonSerializable()
class LebsVerificationForm extends BaseObject {
  User? user;
  String? description;
  String? isMatchingSignal;
  String? updatedSignal;
  DateTime? dateHealthThreatStarted;
  String? informant;
  String? otherInformant;
  String? additionalInformation;
  String? isStillHappening;
  DateTime? dateVerified;

  static LebsVerificationForm fromJson(dynamic json) =>
      _$LebsVerificationFormFromJson(json);

  @override
  String toString() => toJson().toString();

  Map<String, dynamic> toJson() => _$LebsVerificationFormToJson(this);
}
