// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse _$BaseResponseFromJson(Map<String, dynamic> json) => BaseResponse()
  ..token = json['token'] as String?
  ..error = json['error'] == null
      ? null
      : Error.fromJson(json['error'] as Map<String, dynamic>)
  ..userPage = json['userPage'] == null
      ? null
      : UserPage.fromJson(json['userPage'] as Map<String, dynamic>)
  ..user = json['user'] == null
      ? null
      : User.fromJson(json['user'] as Map<String, dynamic>)
  ..unitPage = json['unitPage'] == null
      ? null
      : UnitPage.fromJson(json['unitPage'] as Map<String, dynamic>)
  ..unit = json['unit'] == null
      ? null
      : Unit.fromJson(json['unit'] as Map<String, dynamic>)
  ..taskPage = json['taskPage'] == null
      ? null
      : TaskPage.fromJson(json['taskPage'] as Map<String, dynamic>)
  ..task = json['task'] == null
      ? null
      : Task.fromJson(json['task'] as Map<String, dynamic>)
  ..rolePage = json['rolePage'] == null
      ? null
      : RolePage.fromJson(json['rolePage'] as Map<String, dynamic>)
  ..role = json['role'] == null
      ? null
      : Role.fromJson(json['role'] as Map<String, dynamic>)
  ..file = json['file'] == null
      ? null
      : File.fromJson(json['file'] as Map<String, dynamic>)
  ..dashboards = (json['dashboards'] as List<dynamic>?)
      ?.map((e) => Dashboard.fromJson(e as Map<String, dynamic>))
      .toList()
  ..appNotification = json['notification'] == null
      ? null
      : AppNotification.fromJson(json['notification'] as Map<String, dynamic>)
  ..appNotificationPage = json['notificationPage'] == null
      ? null
      : AppNotificationPage.fromJson(
          json['notificationPage'] as Map<String, dynamic>);

Map<String, dynamic> _$BaseResponseToJson(BaseResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('token', instance.token);
  writeNotNull('error', instance.error);
  writeNotNull('userPage', instance.userPage);
  writeNotNull('user', instance.user);
  writeNotNull('unitPage', instance.unitPage);
  writeNotNull('unit', instance.unit);
  writeNotNull('taskPage', instance.taskPage);
  writeNotNull('task', instance.task);
  writeNotNull('rolePage', instance.rolePage);
  writeNotNull('role', instance.role);
  writeNotNull('file', instance.file);
  writeNotNull('dashboards', instance.dashboards);
  writeNotNull('notification', instance.appNotification);
  writeNotNull('notificationPage', instance.appNotificationPage);
  return val;
}
