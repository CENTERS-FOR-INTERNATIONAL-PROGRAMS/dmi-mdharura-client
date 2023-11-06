// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnitPage _$UnitPageFromJson(Map<String, dynamic> json) => UnitPage()
  ..docs = (json['docs'] as List<dynamic>)
      .map((e) => Unit.fromJson(e as Map<String, dynamic>))
      .toList()
  ..total = json['total'] as int
  ..page = json['page'] as int
  ..pages = json['pages'] as int
  ..limit = json['limit'] as int
  ..sort = json['sort'] as String;

Map<String, dynamic> _$UnitPageToJson(UnitPage instance) => <String, dynamic>{
      'docs': instance.docs,
      'total': instance.total,
      'page': instance.page,
      'pages': instance.pages,
      'limit': instance.limit,
      'sort': instance.sort,
    };
