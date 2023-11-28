import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_dharura/api/unit_api.dart';
import 'package:m_dharura/helper/util.dart';
import 'package:m_dharura/model/unit.dart';

class UnitController extends GetxController with GetTickerProviderStateMixin {
  var isFetching = false.obs;
  var isUpdating = false.obs;
  var isDeleting = false.obs;
  var position = 0.obs;

  Rx<Unit?> unit = Rx(null);

  final _unitApi = Get.put(UnitApi());

  final String unitId;

  late TabController tabController;

  UnitController({required this.unitId});

  @override
  void onInit() async {
    super.onInit();

    fetch();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  fetch() async {
    if (isFetching.isTrue) return;

    isFetching.value = true;

    try {
      var unitFetched = (await _unitApi.retrieve({'unitId': unitId})).data!.unit!;

      tabController = TabController(
          initialIndex: position.value,
          length: unitFetched.type == 'Community unit' ||
                  unitFetched.type == 'Learning institution' ||
                  unitFetched.type == 'Health facility' ||
                  unitFetched.type == 'Veterinary facility'
              ? 3
              : 4,
          vsync: this);

      tabController.addListener(() {
        position.value = tabController.index;
      });

      unit.value = unitFetched;
    } catch (e) {
      Util.toast(e);
    }

    isFetching.value = false;
  }

  updateState(String unitId, String state) async {
    if (isUpdating.isTrue) return;

    isUpdating.value = true;

    try {
      unit.value = (await _unitApi.update(unitId, {'state': state})).data?.unit!;
    } catch (e) {
      Util.toast(e);
    }

    isUpdating.value = false;
  }

  remove(String unitId) async {
    if (isDeleting.isTrue) return;

    isDeleting.value = true;

    try {
      unit.value = (await _unitApi.remove(unitId)).data?.unit!;
    } catch (e) {
      Util.toast(e);
    }

    isDeleting.value = false;
  }
}
