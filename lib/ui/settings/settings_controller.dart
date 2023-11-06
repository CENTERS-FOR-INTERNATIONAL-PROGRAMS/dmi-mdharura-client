import 'package:get/get.dart';
import 'package:m_dharura/constant/key.dart';
import 'package:m_dharura/db/db.dart';
import 'package:m_dharura/helper/util.dart';
import 'package:m_dharura/model/settings.dart';
import 'package:m_dharura/ui/home/home_controller.dart';

class SettingsController extends GetxController {
  Rx<AppSettings> appSettings = Rx<AppSettings>(AppSettings());

  fetch() async {
    try {
      var box = await Db.appSettings();

      var settings = box.get(kAppSettings);

      if (settings != null) {
        appSettings.value = settings;
      } else {
        appSettings.value = AppSettings()
          ..cebs = true
          ..hebs = true
          ..lebs = true
          ..vebs = true
          ..pebs = true
          ..history = true
          ..management = true
          ..tasks = true;
      }

      await Get.put(
        HomeController(),
        tag: 'home',
        permanent: true,
      ).fetch();
    } catch (e) {
      Util.toast(e);
    }
  }

  updateAppSettings(int index, bool value) async {
    try {
      var box = await Db.appSettings();

      appSettings.update((val) {
        switch (index) {
          case 0:
            val?.cebs = value;
            break;
          case 1:
            val?.hebs = value;
            break;
          case 2:
            val?.vebs = value;
            break;
          case 3:
            val?.lebs = value;
            break;
          case 4:
            val?.pebs = value;
            break;
          case 5:
            val?.tasks = value;
            break;
          case 6:
            val?.history = value;
            break;
          case 7:
            val?.management = value;
            break;
          default:
        }
      });

      await box.put(kAppSettings, appSettings.value);

      await fetch();
    } catch (e) {
      Util.toast(e);
    }
  }
}
