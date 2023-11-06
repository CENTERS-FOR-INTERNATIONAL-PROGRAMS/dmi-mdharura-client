import 'package:hive/hive.dart';
import 'package:m_dharura/db/type_id.dart';
import 'package:m_dharura/model/user.dart';

part 'auth.g.dart';

@HiveType(typeId: TypeId.kAuth)
class Auth {
  @HiveField(0)
  late User user;

  @HiveField(1)
  late String token;
}
