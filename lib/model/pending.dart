import 'package:hive/hive.dart';
import 'package:m_dharura/db/type_id.dart';

part 'pending.g.dart';

@HiveType(typeId: TypeId.kPending)
class Pending {
  @HiveField(0)
  late String signalId;

  @HiveField(1)
  late String type;

  @HiveField(2)
  late String subType;

  @HiveField(3)
  late Map<String, dynamic> form;
}
