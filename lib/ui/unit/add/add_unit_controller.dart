import 'package:get/get.dart';
import 'package:m_dharura/api/unit_api.dart';
import 'package:m_dharura/constant/routes.dart';
import 'package:m_dharura/helper/util.dart';
import 'package:m_dharura/model/unit.dart';

class AddUnitController extends GetxController {
  var isFetching = false.obs;
  var isAdding = false.obs;

  Rx<Unit?> unit = Rx(null);

  final _unitApi = Get.put(UnitApi());

  Rx<String?> type = Rx(null);
  Rx<String?> name = Rx(null);

  final String unitId;

  AddUnitController({required this.unitId});

  @override
  void onInit() async {
    super.onInit();

    fetch();
  }

  void fetch() async {
    if (isFetching.isTrue || isAdding.isTrue) return;

    isFetching.value = true;

    try {
      unit.value = (await _unitApi.retrieve({'unitId': unitId})).data?.unit!;
    } catch (e) {
      Util.toast(e);
    }

    isFetching.value = false;
  }

  void add() async {
    if (isFetching.isTrue || isAdding.isTrue) return;

    isAdding.value = true;

    if (check()) {
      try {
        var unit2 = (await _unitApi.create(
                unit.value!.id!, {'name': name.trim(), 'type': type.value}))
            .data!
            .unit;

        if (unit2 != null) Get.offAndToNamed(Routes.kUnitSuccess);
      } catch (e) {
        Util.toast(e);
      }
    }

    isAdding.value = false;
  }

  bool check() {
    try {
      if (name.value == null || name.value!.isEmpty) throw 'Enter name';

      if (type.value == null) throw 'Select type';

      return true;
    } catch (e) {
      Util.toast(e);

      return false;
    }
  }
}
