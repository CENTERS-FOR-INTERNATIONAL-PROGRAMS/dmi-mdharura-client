import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_dharura/api/unit_api.dart';
import 'package:m_dharura/api/user_api.dart';
import 'package:m_dharura/constant/routes.dart';
import 'package:m_dharura/helper/util.dart';
import 'package:m_dharura/model/unit.dart';
import 'package:m_dharura/ui/_/dialog_widget.dart';

class AddRoleController extends GetxController {
  var isFetching = false.obs;
  var isVerifying = false.obs;
  var isAdding = false.obs;

  Rx<Unit?> unit = Rx(null);

  final _unitApi = Get.put(UnitApi());

  final _userApi = Get.put(UserApi());

  Rx<String?> spot = Rx(null);
  Rx<String?> name = Rx(null);
  Rx<String?> phoneNumber = Rx(null);

  final String unitId;

  TextEditingController smsCode = TextEditingController();

  AddRoleController({required this.unitId});

  @override
  void onInit() async {
    super.onInit();

    fetch();
  }

  verify() async {
    if (isVerifying.isTrue) return;

    isVerifying.value = true;

    if (check()) {
      try {
        if (phoneNumber.value == null || phoneNumber.value!.isEmpty) {
          throw 'Enter your phone number';
        }

        var response = (await _userApi.verify(
                phoneNumber.value!.trim(), {'isRegistered': false.toString()}))
            .data;

        String token = response!.token!;

        await Get.dialog(
          DialogWidget(
            title: 'Add ${spot.value}?',
            content:
                'You are about to add a new ${spot.value} role in ${unit.value!.name} (${unit.value!.type}). Please confirm by entering the SMS Code sent to ${phoneNumber.value}.',
            onConfirm: () async {
              await add(token, smsCode.text);
            },
            hintText: 'SMS Code',
            onResend: () async => await verify(),
            inputController: smsCode,
          ),
        );
      } catch (e) {
        Util.toast(e);
      }
    }

    isVerifying.value = false;
  }

  void fetch() async {
    if (isFetching.isTrue || isAdding.isTrue) return;

    isFetching.value = true;

    try {
      unit.value = (await _unitApi.retrieve({'unitId': unitId})).data?.unit;
    } catch (e) {
      Util.toast(e);
    }

    isFetching.value = false;
  }

  add(String token, String smsCode) async {
    if (isFetching.isTrue || isAdding.isTrue) return;

    isAdding.value = true;

    if (check()) {
      try {
        var user = (await _userApi.create(token, unit.value!.id!, {
          'displayName': name.trim(),
          'spot': spot.value,
          'smsCode': smsCode.trim()
        }))
            .data!
            .user;

        if (user != null) await Get.offAndToNamed(Routes.kUserSuccess);
      } catch (e) {
        Util.toast(e);

        if (e
            .toString()
            .toLowerCase()
            .contains('problem verifying phone number')) {
          Get.dialog(
            DialogWidget(
              title: 'Resend Code',
              content:
                  'Unable to verify the phone number $phoneNumber. Would you like to resend the code?',
              onConfirm: () async => await verify(),
              confirmText: 'Resend',
            ),
          );
        }
      }
    }

    isAdding.value = false;
  }

  bool check() {
    try {
      if (name.value!.isEmpty) throw 'Enter name';

      if (phoneNumber.value!.isEmpty) {
        throw 'Enter phone number';
      }

      if (spot.value == null) throw 'Select role';

      return true;
    } catch (e) {
      Util.toast(e);

      return false;
    }
  }
}
