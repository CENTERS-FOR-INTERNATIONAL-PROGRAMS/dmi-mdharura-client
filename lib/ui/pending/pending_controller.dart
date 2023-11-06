import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:m_dharura/db/db.dart';
import 'package:m_dharura/helper/util.dart';
import 'package:m_dharura/model/pending.dart';
import 'package:m_dharura/ui/home/home_controller.dart';

class PendingController extends GetxController {
  RxList<Pending> pendings = RxList.empty(growable: true);

  fetch() async {
    try {
      var box = await Db.pending();

      pendings.clear();

      pendings.addAll(box.values.toList());

      await Get.put(
        HomeController(),
        tag: 'home',
        permanent: true,
      ).fetch();
    } catch (e) {
      Util.toast(e);
    }
  }

  delete(int index) async {
    try {
      var box = await Db.pending();

      await box.deleteAt(index);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }

    await fetch();
  }
}
