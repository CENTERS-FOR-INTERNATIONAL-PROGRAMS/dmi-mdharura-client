import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:m_dharura/api/analytics_api.dart';
import 'package:m_dharura/api/unit_api.dart';
import 'package:m_dharura/helper/util.dart';
import 'package:m_dharura/model/dashboard.dart';
import 'package:m_dharura/model/unit.dart';
import 'package:m_dharura/helper/extension.dart';

class UserDatalistController extends GetxController {
  var isFetching = false.obs;

  final _analyticsApi = Get.put(AnalyticsApi());

  final _unitApi = Get.put(UnitApi());

  final String unitId;

  RxList<Dashboard> dashboards = RxList.empty();

  RxString state = RxString('Live');

  Rx<Unit?> unit = Rx(null);

  UserDatalistController({required this.unitId});

  Rx<DateTime> dateStart = Rx<DateTime>(DateTime.now().subtract(const Duration(days: 7)).startOfDay());
  Rx<DateTime> dateEnd = Rx<DateTime>(DateTime.now().subtract(const Duration(days: 1)).endOfDay());

  @override
  void onInit() async {
    super.onInit();

    await fetch();
  }

  fetch() async {
    if (isFetching.isTrue) return;

    isFetching.value = true;

    try {
      unit.value = (await _unitApi.retrieve({'unitId': unitId})).data?.unit;

      Map<String, dynamic> query = {
        'unitId': unitId,
        'dateStart': dateStart.value.startOfDay().toUtc().toIso8601String(),
        'dateEnd': dateEnd.value.endOfDay().toUtc().toIso8601String(),
      };

      if (kDebugMode) {
        print('Query $query');
      }

      if (state.value != 'All') {
        query.addAll({'state': state.value.toLowerCase()});
      }

      dashboards.clear();

      dashboards.addAll((await _analyticsApi.retrieve(query)).data!.dashboards!);
    } catch (e) {
      Util.toast(e);
    }

    isFetching.value = false;
  }
}
