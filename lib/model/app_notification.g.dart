// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppNotification _$AppNotificationFromJson(Map<String, dynamic> json) =>
    AppNotification()
      ..id = json['_id'] as String?
      ..baseStatus = json['_status'] as String?
      ..createdAt = json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String)
      ..unit = Unit.fromJson(json['unit'] as Map<String, dynamic>)
      ..user = User.fromJson(json['user'] as Map<String, dynamic>)
      ..refId = json['refId'] as String
      ..type = json['type'] as String
      ..message = json['message'] as String
      ..status = json['status'] as String;

Map<String, dynamic> _$AppNotificationToJson(AppNotification instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('_id', instance.id);
  writeNotNull('_status', instance.baseStatus);
  writeNotNull('createdAt', instance.createdAt?.toIso8601String());
  val['unit'] = instance.unit;
  val['user'] = instance.user;
  val['refId'] = instance.refId;
  val['type'] = instance.type;
  val['message'] = instance.message;
  val['status'] = instance.status;
  return val;
}
