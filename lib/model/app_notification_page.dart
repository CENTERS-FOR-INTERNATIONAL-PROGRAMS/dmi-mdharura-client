import 'package:m_dharura/model/app_notification.dart';
import 'package:m_dharura/model/page.dart';
import 'package:json_annotation/json_annotation.dart';

part 'app_notification_page.g.dart';

@JsonSerializable()
class AppNotificationPage extends Page<AppNotification> {
  static AppNotificationPage fromJson(dynamic json) =>
      _$AppNotificationPageFromJson(json);

  Map<String, dynamic> toJson() => _$AppNotificationPageToJson(this);
}
