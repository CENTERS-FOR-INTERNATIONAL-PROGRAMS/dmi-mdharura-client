// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verification_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerificationForm _$VerificationFormFromJson(Map<String, dynamic> json) =>
    VerificationForm()
      ..id = json['_id'] as String?
      ..baseStatus = json['_status'] as String?
      ..createdAt = json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String)
      ..user = json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>)
      ..source = json['source'] as String?
      ..description = json['description'] as String?
      ..isMatchingSignal = json['isMatchingSignal'] as String?
      ..updatedSignal = json['updatedSignal'] as String?
      ..isReportedBefore = json['isReportedBefore'] as String?
      ..dateHealthThreatStarted = json['dateHealthThreatStarted'] == null
          ? null
          : DateTime.parse(json['dateHealthThreatStarted'] as String)
      ..informant = json['informant'] as String?
      ..otherInformant = json['otherInformant'] as String?
      ..isThreatStillExisting = json['isThreatStillExisting'] as String?
      ..additionalInformation = json['additionalInformation'] as String?
      ..threatTo = json['threatTo'] as String?
      ..dateVerified = json['dateVerified'] == null
          ? null
          : DateTime.parse(json['dateVerified'] as String)
      ..dateSCDSCInformed = json['dateSCDSCInformed'] == null
          ? null
          : DateTime.parse(json['dateSCDSCInformed'] as String);

Map<String, dynamic> _$VerificationFormToJson(VerificationForm instance) {
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
  writeNotNull('source', instance.source);
  writeNotNull('description', instance.description);
  writeNotNull('isMatchingSignal', instance.isMatchingSignal);
  writeNotNull('updatedSignal', instance.updatedSignal);
  writeNotNull('isReportedBefore', instance.isReportedBefore);
  writeNotNull('dateHealthThreatStarted',
      instance.dateHealthThreatStarted?.toIso8601String());
  writeNotNull('informant', instance.informant);
  writeNotNull('otherInformant', instance.otherInformant);
  writeNotNull('isThreatStillExisting', instance.isThreatStillExisting);
  writeNotNull('additionalInformation', instance.additionalInformation);
  writeNotNull('threatTo', instance.threatTo);
  writeNotNull('dateVerified', instance.dateVerified?.toIso8601String());
  writeNotNull(
      'dateSCDSCInformed', instance.dateSCDSCInformed?.toIso8601String());
  return val;
}
