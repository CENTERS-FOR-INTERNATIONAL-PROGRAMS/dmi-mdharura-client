import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:m_dharura/model/page.dart';
import 'package:m_dharura/model/task.dart';

part 'task_page.g.dart';

@JsonSerializable()
class TaskPage extends Page<Task> {
  @override
  String toString() => jsonEncode(toJson());

  static TaskPage fromJson(dynamic json) => _$TaskPageFromJson(json);

  Map<String, dynamic> toJson() => _$TaskPageToJson(this);
}
