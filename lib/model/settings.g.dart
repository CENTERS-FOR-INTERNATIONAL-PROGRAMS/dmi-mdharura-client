// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AppSettingsAdapter extends TypeAdapter<AppSettings> {
  @override
  final int typeId = 3;

  @override
  AppSettings read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AppSettings()
      ..cebs = fields[3] as bool
      ..hebs = fields[4] as bool
      ..lebs = fields[5] as bool
      ..vebs = fields[6] as bool
      ..pebs = fields[7] as bool
      ..tasks = fields[8] as bool
      ..management = fields[9] as bool
      ..history = fields[10] as bool;
  }

  @override
  void write(BinaryWriter writer, AppSettings obj) {
    writer
      ..writeByte(8)
      ..writeByte(3)
      ..write(obj.cebs)
      ..writeByte(4)
      ..write(obj.hebs)
      ..writeByte(5)
      ..write(obj.lebs)
      ..writeByte(6)
      ..write(obj.vebs)
      ..writeByte(7)
      ..write(obj.pebs)
      ..writeByte(8)
      ..write(obj.tasks)
      ..writeByte(9)
      ..write(obj.management)
      ..writeByte(10)
      ..write(obj.history);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppSettingsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppSettings _$AppSettingsFromJson(Map<String, dynamic> json) => AppSettings()
  ..cebs = json['cebs'] as bool
  ..hebs = json['hebs'] as bool
  ..lebs = json['lebs'] as bool
  ..vebs = json['vebs'] as bool
  ..pebs = json['pebs'] as bool
  ..tasks = json['tasks'] as bool
  ..management = json['management'] as bool
  ..history = json['history'] as bool;

Map<String, dynamic> _$AppSettingsToJson(AppSettings instance) =>
    <String, dynamic>{
      'cebs': instance.cebs,
      'hebs': instance.hebs,
      'lebs': instance.lebs,
      'vebs': instance.vebs,
      'pebs': instance.pebs,
      'tasks': instance.tasks,
      'management': instance.management,
      'history': instance.history,
    };
