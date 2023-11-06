// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lebs_verification_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LebsVerificationForm _$LebsVerificationFormFromJson(
        Map<String, dynamic> json) =>
    LebsVerificationForm()
      ..id = json['_id'] as String?
      ..baseStatus = json['_status'] as String?
      ..createdAt = json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String)
      ..user = json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>)
      ..description = json['description'] as String?
      ..isMatchingSignal = json['isMatchingSignal'] as String?
      ..updatedSignal = json['updatedSignal'] as String?
      ..dateHealthThreatStarted = json['dateHealthThreatStarted'] == null
          ? null
          : DateTime.parse(json['dateHealthThreatStarted'] as String)
      ..informant = json['informant'] as String?
      ..otherInformant = json['otherInformant'] as String?
      ..additionalInformation = json['additionalInformation'] as String?
      ..isStillHappening = json['isStillHappening'] as String?
      ..dateVerified = json['dateVerified'] == null
          ? null
          : DateTime.parse(json['dateVerified'] as String);

Map<String, dynamic> _$LebsVerificationFormToJson(
    LebsVerificationForm instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('_id', instance.id);
  writeNotNull('_status', instance.baseStatus);
  writeNotNull('createdAt', instance.createdAt?.toIso8601String());
  writeNotNull('user', instance.user);
  writeNotNull('description', instance.description);
  writeNotNull('isMatchingSignal', instance.isMatchingSignal);
  writeNotNull('updatedSignal', instance.updatedSignal);
  writeNotNull('dateHealthThreatStarted',
      instance.dateHealthThreatStarted?.toIso8601String());
  writeNotNull('informant', instance.informant);
  writeNotNull('otherInformant', instance.otherInformant);
  writeNotNull('additionalInformation', instance.additionalInformation);
  writeNotNull('isStillHappening', instance.isStillHappening);
  writeNotNull('dateVerified', instance.dateVerified?.toIso8601String());
  return val;
}
