// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paged.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Paged<T> _$PagedFromJson<T>(Map<String, dynamic> json) => Paged<T>(
      Paged._listFromJson(json['docs'] as List),
      json['total'] as int,
      json['page'] as int,
      json['pages'] as int,
      json['limit'] as int,
      json['sort'] as String,
    );
