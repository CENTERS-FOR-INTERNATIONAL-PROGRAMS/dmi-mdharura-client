import 'package:get/get.dart';
import 'package:m_dharura/api/unit_api.dart';
import 'package:m_dharura/helper/util.dart';
import 'package:m_dharura/model/unit.dart';
import 'package:m_dharura/model/unit_page.dart';

class UnitsController extends GetxController {
  var isFetching = false.obs;
  var isDeleting = false.obs;
  var isUpdating = false.obs;

  RxList<Unit> units = RxList.empty();

  Rx<UnitPage?> unitPage = Rx(null);

  final _unitApi = Get.put(UnitApi());

  final String? unitId;
  RxString type = RxString('All');

  RxString state = RxString('All');

  UnitsController({required this.unitId});

  @override
  void onInit() async {
    super.onInit();

    fetch(true);
  }

  fetch(bool refresh) async {
    if (isFetching.isTrue) return;

    isFetching.value = true;

    if (refresh) {
      units.clear();

      unitPage.value = null;
    } else if (unitPage.value != null && unitPage.value!.isEnd) {
      isFetching.value = false;
      return;
    }

    try {
      int page = unitPage.value == null ? 1 : unitPage.value!.next;

      var query = {'parent': unitId, 'page': page.toString()};

      if (type.value != 'All') query.addAll({'type': type.value});

      if (state.value != 'All') {
        query.addAll({'state': state.value.toLowerCase()});
      }

      unitPage.value = (await _unitApi.retrieve(query)).data?.unitPage;

      units.addAll(unitPage.value!.docs);
    } catch (e) {
      Util.toast(e);
    }

    isFetching.value = false;
  }

  remove(String unitId) async {
    if (isDeleting.isTrue) return;

    isDeleting.value = true;

    try {
      var unit = (await _unitApi.remove(unitId)).data?.unit;

      units.removeWhere((element) => unit!.id == element.id);
    } catch (e) {
      Util.toast(e);
    }

    isDeleting.value = false;
  }

  updateState(String unitId, String state) async {
    if (isUpdating.isTrue) return;

    isUpdating.value = true;

    try {
      var unit = (await _unitApi.update(unitId, {'state': state})).data?.unit;

      var index = units.indexWhere((element) => unit!.id == element.id);

      if (index > -1) units[index] = unit!;
    } catch (e) {
      Util.toast(e);
    }

    isUpdating.value = false;
  }
}
