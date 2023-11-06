import 'package:get/get.dart';
import 'package:m_dharura/constant/routes.dart';
import 'package:m_dharura/helper/session.dart';

class SplashController extends GetxController {
  @override
  void onReady() async {
    super.onReady();

    try {
      if (await Session.isActive()) await Get.offAllNamed(Routes.kHome);
    } catch (e) {
      await Get.offAllNamed(Routes.kAuth);
    }
  }
}
