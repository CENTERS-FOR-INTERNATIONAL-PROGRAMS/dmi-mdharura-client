// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_notification_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppNotificationPage _$AppNotificationPageFromJson(Map<String, dynamic> json) =>
    AppNotificationPage()
      ..docs = (json['docs'] as List<dynamic>)
          .map((e) => AppNotification.fromJson(e as Map<String, dynamic>))
          .toList()
      ..total = json['total'] as int
      ..page = json['page'] as int
      ..pages = json['pages'] as int
      ..limit = json['limit'] as int
      ..sort = json['sort'] as String;

Map<String, dynamic> _$AppNotificationPageToJson(
        AppNotificationPage instance) =>
    <String, dynamic>{
      'docs': instance.docs,
      'total': instance.total,
      'page': instance.page,
      'pages': instance.pages,
      'limit': instance.limit,
      'sort': instance.sort,
    };
