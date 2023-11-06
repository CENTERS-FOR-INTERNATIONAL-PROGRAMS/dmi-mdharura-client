import 'package:m_dharura/helper/base_object.dart';
import 'package:m_dharura/model/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'verification_form.g.dart';

@JsonSerializable()
class VerificationForm extends BaseObject {
  User? user;
  String? source;
  String? description;
  String? isMatchingSignal;
  String? updatedSignal;
  String? isReportedBefore;
  DateTime? dateHealthThreatStarted;
  String? informant;
  String? otherInformant;
  String? isThreatStillExisting;
  String? additionalInformation;
  String? threatTo;
  DateTime? dateVerified;
  DateTime? dateSCDSCInformed;

  static VerificationForm fromJson(dynamic json) =>
      _$VerificationFormFromJson(json);

  @override
  String toString() => toJson().toString();

  Map<String, dynamic> toJson() => _$VerificationFormToJson(this);
}
