import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:m_dharura/constant/key.dart';
import 'package:m_dharura/db/db.dart';
import 'package:m_dharura/helper/session.dart';
import 'package:m_dharura/helper/util.dart';
import 'package:m_dharura/model/pending.dart';
import 'package:m_dharura/model/settings.dart';
import 'package:m_dharura/model/user.dart';

class HomeController extends GetxController {
  RxList<Pending> pendings = RxList.empty();

  Rx<AppSettings> appSettings = Rx<AppSettings>(AppSettings());

  Rx<User?> user = Rx(null);

  @override
  void onInit() async {
    super.onInit();

    await fetch();
  }

  fetch() async {
    try {
      user.value = await Session.user();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }

    try {
      var pendingBox = await Db.pending();

      pendings.clear();

      pendings.addAll(pendingBox.values.toList());
    } catch (e) {
      Util.toast(e);
    }

    try {
      var settingBox = await Db.appSettings();

      var settings = settingBox.get(kAppSettings);

      if (settings != null) appSettings.value = settings;
    } catch (e) {
      Util.toast(e);
    }
  }
}
