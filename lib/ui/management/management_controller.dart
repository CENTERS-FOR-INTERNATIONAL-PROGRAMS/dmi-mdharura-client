import 'package:get/get.dart';
import 'package:m_dharura/helper/session.dart';
import 'package:m_dharura/helper/util.dart';
import 'package:m_dharura/model/user.dart';

class ManagementController extends GetxController {
  Rx<User?> user = Rx(null);

  @override
  void onInit() async {
    super.onInit();

    try {
      user.value = await Session.user();
    } catch (e) {
      Util.toast(e);
      await Session.logout();
    }
  }
}
