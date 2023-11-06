import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:m_dharura/constant/env.dart';

part 'file.g.dart';

@JsonSerializable()
class File {
  String? filename;

  String get url => "${kBaseApiUrl}v1/file/$filename";

  static File fromJson(dynamic json) => _$FileFromJson(json);

  static File fromString(String json) => _$FileFromJson(jsonDecode(json));

  @override
  String toString() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$FileToJson(this);
}
