import 'package:get/get.dart';
import 'package:m_dharura/api/task_api.dart';
import 'package:m_dharura/constant/env.dart';
import 'package:m_dharura/constant/routes.dart';
import 'package:m_dharura/helper/session.dart';
import 'package:m_dharura/helper/util.dart';
import 'package:m_dharura/ui/_/dialog_widget.dart';

class SignalFormController extends GetxController {
  Rx<String?> form = Rx(null);

  var isReporting = false.obs;

  final _taskApi = Get.put(TaskApi());

  report() async {
    if (isReporting.isTrue) return;

    isReporting.value = true;

    try {
      if (form.value == null) throw 'Select signal to report';

      await Session.user();

      var task = (await _taskApi.create({'signal': form.value})).data?.task;

      if (task != null) await Get.offAndToNamed(Routes.kFormSuccess);
    } catch (e) {
      var m = Util.toast(e);

      if (m.contains('It seems you are offline')) {
        await Get.dialog(
          DialogWidget(
            title: 'Submit form using SMS?',
            content:
                'You are about to submit this form using SMS. Please confirm',
            onConfirm: () async => await Util.sms(
                kSmsShortCode, '$kSmsPrefix${form.value!.toUpperCase()}'),
          ),
        );
      }
    }

    isReporting.value = false;
  }
}
