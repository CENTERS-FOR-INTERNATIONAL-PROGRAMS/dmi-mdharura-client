import 'package:get/get.dart';
import 'package:m_dharura/api/user_api.dart';
import 'package:m_dharura/constant/routes.dart';
import 'package:m_dharura/helper/util.dart';

class AuthController extends GetxController {
  var isVerifying = false.obs;
  var isCodeSent = false.obs;

  String phoneNumber = '';
  String smsCode = '';

  final _userApi = Get.put(UserApi());

  verify() async {
    if (isVerifying.isTrue) return;

    isVerifying.value = true;

    try {
      if (phoneNumber.isEmpty) {
        throw 'Enter your phone number';
      }

      var response = (await _userApi
              .verify(phoneNumber.trim(), {'isRegistered': true.toString()}))
          .data;

      if (response!.user != null) {
        await Get.toNamed(
            '${Routes.kAuthVerify}${response.token}/$phoneNumber');
      } else {
        throw 'You are not registered. Please contact your supervisor.';
      }
    } catch (e) {
      Util.toast(e);
    }

    isVerifying.value = false;
  }
}
