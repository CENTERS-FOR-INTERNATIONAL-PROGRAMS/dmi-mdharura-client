import 'package:json_annotation/json_annotation.dart';
import 'package:m_dharura/model/app_notification.dart';
import 'package:m_dharura/model/app_notification_page.dart';
import 'package:m_dharura/model/dashboard.dart';
import 'package:m_dharura/model/error.dart';
import 'package:m_dharura/model/role.dart';
import 'package:m_dharura/model/role_page.dart';
import 'package:m_dharura/model/task.dart';
import 'package:m_dharura/model/task_page.dart';
import 'package:m_dharura/model/unit.dart';
import 'package:m_dharura/model/unit_page.dart';
import 'package:m_dharura/model/user.dart';
import 'package:m_dharura/model/user_page.dart';

part 'base_response.g.dart';

@JsonSerializable()
class BaseResponse {
  String? token;

  Error? error;

  UserPage? userPage;

  User? user;

  UnitPage? unitPage;

  Unit? unit;

  TaskPage? taskPage;

  Task? task;

  RolePage? rolePage;

  Role? role;

  List<Dashboard>? dashboards;

  @JsonKey(name: 'notification')
  AppNotification? appNotification;

  @JsonKey(name: 'notificationPage')
  AppNotificationPage? appNotificationPage;

  static BaseResponse fromJson(dynamic json) => _$BaseResponseFromJson(json);

  @override
  String toString() => toJson().toString();

  Map<String, dynamic> toJson() => _$BaseResponseToJson(this);
}
