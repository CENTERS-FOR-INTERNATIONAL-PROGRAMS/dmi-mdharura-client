import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:m_dharura/model/page.dart';
import 'package:m_dharura/model/user.dart';

part 'user_page.g.dart';

@JsonSerializable()
class UserPage extends Page<User> {
  @override
  String toString() => jsonEncode(toJson());

  static UserPage fromJson(dynamic json) => _$UserPageFromJson(json);

  Map<String, dynamic> toJson() => _$UserPageToJson(this);
}
