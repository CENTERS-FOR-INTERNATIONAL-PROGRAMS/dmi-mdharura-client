import 'package:get/get.dart';
import 'package:m_dharura/api/role_api.dart';
import 'package:m_dharura/helper/util.dart';
import 'package:m_dharura/model/role.dart';
import 'package:m_dharura/model/role_page.dart';

class RolesController extends GetxController {
  var isFetching = false.obs;
  var isUpdating = false.obs;
  var isDeleting = false.obs;

  RxList<Role> roles = RxList.empty();

  Rx<RolePage?> rolePage = Rx(null);

  final _roleApi = Get.put(RoleApi());

  final String? unitId, userId;

  RxString spot = RxString('All');

  RxString status = RxString('All');

  RolesController({required this.unitId, required this.userId});

  @override
  void onInit() async {
    super.onInit();

    fetch(true);
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
      int page = rolePage.value == null ? 1 : rolePage.value!.next;

      Map<String, dynamic> query = {'page': page.toString()};

      if (userId != null) {
        query.addAll({'userId': userId});
      }

      if (unitId != null) {
        query.addAll({'unitId': unitId});
      }

      if (spot.value != 'All') query.addAll({'spot': spot.value.toUpperCase()});

      if (status.value != 'All') {
        query.addAll({'status': status.value.toLowerCase()});
      }

      rolePage.value = (await _roleApi.retrieve(query)).data?.rolePage;

      roles.addAll(rolePage.value!.docs);
    } catch (e) {
      Util.toast(e);
    }

    isFetching.value = false;
  }

  updateStatus(String roleId, String status) async {
    if (isUpdating.isTrue) return;

    isUpdating.value = true;

    try {
      var role = (await _roleApi.update(roleId, {'status': status})).data?.role;

      var index = roles.indexWhere((element) => role!.id == element.id);

      if (index > -1) roles[index] = role!;
    } catch (e) {
      Util.toast(e);
    }

    isUpdating.value = false;
  }

  updateSpot(String roleId, String spot) async {
    if (isUpdating.isTrue) return;

    isUpdating.value = true;

    try {
      var role = (await _roleApi.update(roleId, {'spot': spot})).data?.role;

      if (role != null) await fetch(true);
    } catch (e) {
      Util.toast(e);
    }

    isUpdating.value = false;
  }

  remove(String roleId) async {
    if (isDeleting.isTrue) return;

    isDeleting.value = true;

    try {
      var role = (await _roleApi.remove(roleId)).data?.role;

      roles.removeWhere((element) => role!.id == element.id);
    } catch (e) {
      Util.toast(e);
    }

    isDeleting.value = false;
  }
}
