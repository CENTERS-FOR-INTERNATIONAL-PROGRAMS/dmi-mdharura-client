import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:m_dharura/constant/routes.dart';
import 'package:m_dharura/db/db.dart';
import 'package:m_dharura/model/auth.dart';
import 'package:m_dharura/model/user.dart';

class Session {
  static Future<void> logout() async {
    var auth = await Db.auth();

    await auth.clear();

    await Get.deleteAll(force: true);

    await Get.offAllNamed(Routes.kSplash);

    if (kDebugMode) {
      print('Logged out');
    }
  }

  static Future<void> login({
    required User user,
    required String token,
    bool splash = true,
  }) async {
    var auth = await Db.auth();

    await auth.clear();

    await auth.add(
      Auth()
        ..user = user
        ..token = token,
    );

    if (splash) {
      await Get.deleteAll(force: true);

      await Get.offAllNamed(Routes.kSplash);
    }

    if (kDebugMode) {
      print('Logged in');
    }
  }

  static Future<bool> isActive() async {
    await _auth();

    return true;
  }

  static Future<User> user() async => (await _auth()).user;

  static Future<String> token() async => (await _auth()).token;

  static Future<Auth> _auth() async {
    var box = await Db.auth();

    if (box.isEmpty) throw 'It seems you are offline';

    var auth = box.getAt(0);

    if (auth == null) throw 'It seems you are offline';

    return auth;
  }
}
