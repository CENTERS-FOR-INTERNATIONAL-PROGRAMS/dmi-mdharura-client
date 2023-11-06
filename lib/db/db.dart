import 'package:hive_flutter/hive_flutter.dart';
import 'package:m_dharura/db/type_id.dart';
import 'package:m_dharura/model/auth.dart';
import 'package:m_dharura/model/pending.dart';
import 'package:m_dharura/model/settings.dart';
import 'package:m_dharura/model/user.dart';

class Db {
  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(AuthAdapter());
    Hive.registerAdapter(UserAdapter());
    Hive.registerAdapter(PendingAdapter());
    Hive.registerAdapter(AppSettingsAdapter());
  }

  static Future<Box<Auth>> auth() async {
    return await Hive.openBox<Auth>(TypeId.kAuth.toString());
  }

  static Future<Box<Pending>> pending() async {
    return await Hive.openBox<Pending>(TypeId.kPending.toString());
  }

  static Future<Box<AppSettings>> appSettings() async {
    return await Hive.openBox<AppSettings>(TypeId.kAppSettings.toString());
  }
}
