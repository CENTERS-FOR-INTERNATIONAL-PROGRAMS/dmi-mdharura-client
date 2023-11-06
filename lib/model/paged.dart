import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:m_dharura/model/app_notification.dart';
import 'package:m_dharura/model/dashboard.dart';
import 'package:m_dharura/model/error.dart';
import 'package:m_dharura/model/file.dart';
import 'package:m_dharura/model/graph.dart';
import 'package:m_dharura/model/graph_item.dart';
import 'package:m_dharura/model/role.dart';
import 'package:m_dharura/model/task.dart';
import 'package:m_dharura/model/unit.dart';
import 'package:m_dharura/model/user.dart';

part 'paged.g.dart';

@JsonSerializable(createToJson: false)
class Paged<T> {
  @JsonKey(fromJson: _listFromJson)
  final List<T> docs;
  final int total;
  final int page;
  final int pages;
  final int limit;
  final String sort;

  Paged(this.docs, this.total, this.page, this.pages, this.limit, this.sort);

  int get next => page + 1;

  bool get isEnd => page >= pages || docs.isEmpty;

  factory Paged.fromJson(Map<String, dynamic> json) => _$PagedFromJson(json);

  static T _listFromJson<T>(List<dynamic> jsonList) {
    if (kDebugMode) {
      print('Jsonlist $T');
    }

    if (T == typeOf<List<AppNotification>>()) {
      return jsonList.isEmpty
          ? List<AppNotification>.empty() as T
          : jsonList
              .map<AppNotification>((json) => AppNotification.fromJson(json))
              .toList() as T;
    }
    if (T == typeOf<List<Dashboard>>()) {
      return jsonList.isEmpty
          ? List<Dashboard>.empty() as T
          : jsonList.map<Dashboard>((json) => Dashboard.fromJson(json)).toList()
              as T;
    }
    if (T == typeOf<List<Error>>()) {
      return jsonList.isEmpty
          ? List<Error>.empty() as T
          : jsonList.map<Error>((json) => Error.fromJson(json)).toList() as T;
    }
    if (T == typeOf<List<File>>()) {
      return jsonList.isEmpty
          ? List<File>.empty() as T
          : jsonList.map<File>((json) => File.fromJson(json)).toList() as T;
    }
    if (T == typeOf<List<GraphItem>>()) {
      return jsonList.isEmpty
          ? List<GraphItem>.empty() as T
          : jsonList.map<GraphItem>((json) => GraphItem.fromJson(json)).toList()
              as T;
    }
    if (T == typeOf<List<Graph>>()) {
      return jsonList.isEmpty
          ? List<Graph>.empty() as T
          : jsonList
              .map<AppNotification>((json) => AppNotification.fromJson(json))
              .toList() as T;
    }
    if (T == typeOf<List<Role>>()) {
      return jsonList.isEmpty
          ? List<Role>.empty() as T
          : jsonList.map<Role>((json) => Role.fromJson(json)).toList() as T;
    }
    if (T == typeOf<List<Task>>()) {
      return jsonList.isEmpty
          ? List<Task>.empty() as T
          : jsonList.map<Task>((json) => Task.fromJson(json)).toList() as T;
    }
    if (T == typeOf<List<Unit>>()) {
      return jsonList.isEmpty
          ? List<Unit>.empty() as T
          : jsonList.map<Unit>((json) => Unit.fromJson(json)).toList() as T;
    }
    if (T == typeOf<List<Task>>()) {
      return jsonList.isEmpty
          ? List<Task>.empty() as T
          : jsonList.map<Task>((json) => Task.fromJson(json)).toList() as T;
    }
    if (T == typeOf<List<User>>()) {
      return jsonList.isEmpty
          ? List<User>.empty() as T
          : jsonList.map<User>((json) => User.fromJson(json)).toList() as T;
    }

    throw ArgumentError.value(
      T,
      'type',
      'Unknown type conversion',
    );
  }
}

Type typeOf<X>() => X;
