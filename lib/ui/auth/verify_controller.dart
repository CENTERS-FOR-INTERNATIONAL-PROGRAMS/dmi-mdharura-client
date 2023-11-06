import 'package:get/get.dart';
import 'package:m_dharura/api/auth_api.dart';
import 'package:m_dharura/helper/base_response.dart';
import 'package:m_dharura/helper/session.dart';
import 'package:m_dharura/helper/util.dart';

class VerifyController extends GetxController {
  var isVerifying = false.obs;

  String smsCode = '';

  final _authApi = Get.put(AuthApi());

  final String token, phoneNumber;

  VerifyController({required this.token, required this.phoneNumber});

  verify() async {
    if (isVerifying.isTrue) return;

    isVerifying.value = true;

    try {
      if (smsCode.isEmpty) throw 'Enter SMS Code';

      BaseResponse? response =
          (await _authApi.auth(token, smsCode.trim())).data;

      isVerifying.value = false;

      await Session.login(user: response!.user!, token: response.token!);
    } catch (e) {
      isVerifying.value = false;

      Util.toast(e);
    }
  }
}
