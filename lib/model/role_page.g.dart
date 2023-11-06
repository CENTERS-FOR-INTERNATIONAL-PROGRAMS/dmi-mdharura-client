// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'role_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RolePage _$RolePageFromJson(Map<String, dynamic> json) => RolePage()
  ..docs = (json['docs'] as List<dynamic>)
      .map((e) => Role.fromJson(e as Map<String, dynamic>))
      .toList()
  ..total = json['total'] as int
  ..page = json['page'] as int
  ..pages = json['pages'] as int
  ..limit = json['limit'] as int
  ..sort = json['sort'] as String;

Map<String, dynamic> _$RolePageToJson(RolePage instance) => <String, dynamic>{
      'docs': instance.docs,
      'total': instance.total,
      'page': instance.page,
      'pages': instance.pages,
      'limit': instance.limit,
      'sort': instance.sort,
    };
