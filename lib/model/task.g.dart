// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Task _$TaskFromJson(Map<String, dynamic> json) => Task()
  ..id = json['_id'] as String?
  ..baseStatus = json['_status'] as String?
  ..createdAt = json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String)
  ..unit = Unit.fromJson(json['unit'] as Map<String, dynamic>)
  ..user = User.fromJson(json['user'] as Map<String, dynamic>)
  ..signal = json['signal'] as String
  ..signalId = json['signalId'] as String
  ..cebs = json['cebs'] == null
      ? null
      : Cebs.fromJson(json['cebs'] as Map<String, dynamic>)
  ..hebs = json['hebs'] == null
      ? null
      : Hebs.fromJson(json['hebs'] as Map<String, dynamic>)
  ..lebs = json['lebs'] == null
      ? null
      : Lebs.fromJson(json['lebs'] as Map<String, dynamic>)
  ..pmebs = json['pmebs'] == null
      ? null
      : Pmebs.fromJson(json['pmebs'] as Map<String, dynamic>)
  ..vebs = json['vebs'] == null
      ? null
      : Vebs.fromJson(json['vebs'] as Map<String, dynamic>)
  ..status = json['status'] as String
  ..state = json['state'] as String
  ..via = json['via'] as String;

Map<String, dynamic> _$TaskToJson(Task instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('_id', instance.id);
  writeNotNull('_status', instance.baseStatus);
  writeNotNull('createdAt', instance.createdAt?.toIso8601String());
  val['unit'] = instance.unit;
  val['user'] = instance.user;
  val['signal'] = instance.signal;
  val['signalId'] = instance.signalId;
  writeNotNull('cebs', instance.cebs);
  writeNotNull('hebs', instance.hebs);
  writeNotNull('lebs', instance.lebs);
  writeNotNull('pmebs', instance.pmebs);
  writeNotNull('vebs', instance.vebs);
  val['status'] = instance.status;
  val['state'] = instance.state;
  val['via'] = instance.via;
  return val;
}
