import 'package:flutter/foundation.dart';
import 'package:m_dharura/api/app_notification_api.dart';
import 'package:m_dharura/api/unit_api.dart';
import 'package:m_dharura/api/user_api.dart';
import 'package:m_dharura/helper/util.dart';
import 'package:m_dharura/model/app_notification.dart';
import 'package:m_dharura/model/app_notification_page.dart';
import 'package:m_dharura/model/unit.dart';
import 'package:m_dharura/model/user.dart';
import 'package:m_dharura/ui/home/home_controller.dart';
import 'package:get/get.dart';

class AppNotificationsController extends GetxController {
  var isFetching = false.obs;

  final _appNotificationApi = Get.put(AppNotificationApi());

  RxList<AppNotification> appNotifications = RxList.empty();

  Rx<AppNotificationPage?> appNotificationPage = Rx(null);

  Rx<User?> user = Rx(null);

  Rx<Unit?> unit = Rx(null);

  final _userApi = Get.put(UserApi());

  final _unitApi = Get.put(UnitApi());

  final String userId;
  final String unitId;

  AppNotificationsController({
    required this.userId,
    required this.unitId,
  });

  @override
  void onInit() async {
    super.onInit();

    fetch(true);
  }

  void fetch(bool refresh) async {
    if (isFetching.isTrue) return;

    isFetching.value = true;

    if (refresh) {
      appNotifications.clear();

      user.value = null;

      unit.value = null;

      appNotificationPage.value = null;
    } else if ((appNotificationPage.value!.page >=
            appNotificationPage.value!.pages ||
        appNotificationPage.value!.docs.isEmpty)) {
      isFetching.value = false;
      return;
    }

    try {
      int page = appNotificationPage.value == null
          ? 1
          : appNotificationPage.value!.page + 1;

      var query = {
        'page': page.toString(),
      };

      query.addAll({'userId': userId});

      user.value ??= (await _userApi.retrieve({'userId': userId})).data?.user;

      query.addAll({'unitId': unitId});

      unit.value ??= (await _unitApi.retrieve({'unitId': unitId})).data?.unit;

      appNotificationPage.value =
          (await _appNotificationApi.retrieve(query)).data?.appNotificationPage;

      appNotifications.addAll(appNotificationPage.value!.docs);

      try {
        var homeController = Get.put(HomeController(), tag: 'home');

        await homeController.fetch();
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
      }
    } catch (e) {
      Util.toast(e);
    }
    isFetching.value = false;
  }
}
