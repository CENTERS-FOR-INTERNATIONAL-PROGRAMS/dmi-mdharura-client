// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserPage _$UserPageFromJson(Map<String, dynamic> json) => UserPage()
  ..docs = (json['docs'] as List<dynamic>)
      .map((e) => User.fromJson(e as Map<String, dynamic>))
      .toList()
  ..total = json['total'] as int
  ..page = json['page'] as int
  ..pages = json['pages'] as int
  ..limit = json['limit'] as int
  ..sort = json['sort'] as String;

Map<String, dynamic> _$UserPageToJson(UserPage instance) => <String, dynamic>{
      'docs': instance.docs,
      'total': instance.total,
      'page': instance.page,
      'pages': instance.pages,
      'limit': instance.limit,
      'sort': instance.sort,
    };
