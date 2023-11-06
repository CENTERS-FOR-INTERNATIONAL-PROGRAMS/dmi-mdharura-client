import 'package:m_dharura/helper/base_object.dart';
import 'package:m_dharura/model/unit.dart';
import 'package:m_dharura/model/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'app_notification.g.dart';

@JsonSerializable()
class AppNotification extends BaseObject {
  late Unit unit;
  late User user;
  late String refId;
  late String type;
  late String message;
  late String status;

  static AppNotification fromJson(dynamic json) =>
      _$AppNotificationFromJson(json);

  @override
  String toString() => toJson().toString();

  Map<String, dynamic> toJson() => _$AppNotificationToJson(this);
}
