import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:m_dharura/api/role_api.dart';
import 'package:m_dharura/api/unit_api.dart';
import 'package:m_dharura/helper/util.dart';
import 'package:m_dharura/model/file.dart';
import 'package:m_dharura/model/role.dart';
import 'package:m_dharura/model/role_page.dart';
import 'package:m_dharura/model/unit.dart';
import 'package:m_dharura/helper/extension.dart';

class UserDatalistController extends GetxController {
  var isFetching = false.obs;
  var isDownloading = false.obs;

  final _unitApi = Get.put(UnitApi());
  final _roleApi = Get.put(RoleApi());

  final String unitId;

  RxList<Role> roles = RxList.empty();
  Rx<RolePage?> rolePage = Rx(null);

  Rx<Unit?> unit = Rx(null);
  Rx<File?> file = Rx(null);

  UserDatalistController({required this.unitId});

  Rx<DateTime> dateStart = Rx<DateTime>(DateTime.now().subtract(const Duration(days: 30)).startOfDay());
  Rx<DateTime> dateEnd = Rx<DateTime>(DateTime.now().subtract(const Duration(days: 1)).endOfDay());

  @override
  void onInit() async {
    super.onInit();

    await fetch(true);
  }

  fetch(bool refresh) async {
    if (isFetching.isTrue) return;

    isFetching.value = true;

    if (refresh) {
      roles.clear();

      rolePage.value = null;
    } else if (rolePage.value != null && rolePage.value!.isEnd) {
      isFetching.value = false;
      return;
    }

    try {
      unit.value ??= (await _unitApi.retrieve({'unitId': unitId})).data?.unit;

      int page = rolePage.value == null ? 1 : rolePage.value!.next;

      Map<String, dynamic> query = {
        'unitId': unitId,
        'dateStart': dateStart.value.startOfDay().toUtc().toIso8601String(),
        'dateEnd': dateEnd.value.endOfDay().toUtc().toIso8601String(),
        'page': page.toString(),
      };

      if (kDebugMode) {
        print('Query $query');
      }

      rolePage.value = (await _roleApi.retrieve(query)).data?.rolePage;

      roles.addAll(rolePage.value!.docs);
    } catch (e) {
      Util.toast(e);
    }

    isFetching.value = false;
  }
}
