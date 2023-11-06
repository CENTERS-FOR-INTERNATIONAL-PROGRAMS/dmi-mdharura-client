import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:m_dharura/api/task_api.dart';
import 'package:m_dharura/api/unit_api.dart';
import 'package:m_dharura/constant/env.dart';
import 'package:m_dharura/constant/routes.dart';
import 'package:m_dharura/db/db.dart';
import 'package:m_dharura/helper/extension.dart';
import 'package:m_dharura/helper/session.dart';
import 'package:m_dharura/helper/util.dart';
import 'package:m_dharura/model/form/pmebs/pmebs_request_form.dart';
import 'package:m_dharura/model/pending.dart';
import 'package:m_dharura/model/unit.dart';
import 'package:m_dharura/model/unit_page.dart';
import 'package:m_dharura/ui/_/dialog_widget.dart';
import 'package:m_dharura/ui/pending/pending_controller.dart';

class PmebsRequestFormController extends GetxController {
  Rx<PmebsRequestForm> form = Rx(PmebsRequestForm());
  var isFetching = false.obs;
  var isAdding = false.obs;
  var pages = [0].obs;
  final int total = 7;

  var isFetchingUnits = false.obs;

  Rx<String?> signal = Rx(null);

  final _unitApi = Get.put(UnitApi());

  final _taskApi = Get.put(TaskApi());

  RxList<Unit> units = RxList<Unit>.empty();

  Rx<Unit?> selectedUnit = Rx(null);

  UnitPage? _unitsPage;

  final String? signalId;

  PmebsRequestFormController({this.signalId});

  @override
  void onInit() {
    super.onInit();

    signal.value = signalId;
  }

  fetchUnits(bool refresh) async {
    if (isFetchingUnits.isTrue) return;

    isFetchingUnits.value = true;

    if (refresh) {
      units.clear();

      _unitsPage = null;
    } else if ((_unitsPage!.page >= _unitsPage!.pages ||
        _unitsPage!.docs.isEmpty)) {
      isFetchingUnits.value = false;

      return;
    }

    try {
      int page = _unitsPage == null ? 1 : _unitsPage!.page + 1;

      Map<String, dynamic> query = {
        'page': page.toString(),
        'signalId': signal.value
      };

      _unitsPage = (await _unitApi.retrieve(query)).data?.unitPage;

      units.addAll(_unitsPage!.docs);
    } catch (e) {
      Util.toast(e);
    }

    isFetchingUnits.value = false;
  }

  add() async {
    if (isFetching.isTrue || isAdding.isTrue) return;

    isAdding.value = true;

    try {
      await Session.user();

      var task = (await _taskApi.requestPmebs(
        signal.value!,
        selectedUnit.value!.id!,
        form.toJson(),
      ))
          .data!
          .task;

      if (task != null) await Get.offAndToNamed(Routes.kFormSuccess);
    } catch (e) {
      var m = Util.toast(e);

      if (m.contains('It seems you are offline')) {
        await Get.dialog(
          DialogWidget(
            title: 'Submit form using SMS?',
            content:
                'You are about to submit this form using SMS. Please confirm',
            onConfirm: () async => await Util.sms(kSmsShortCode,
                '${kSmsPrefix}pmv ${signal.value!.trim()} ${selectedUnit.value!.id} ${jsonEncode(form.value.toJson().trim())}'),
          ),
        );
      }
    }

    isAdding.value = false;
  }

  next() {
    int page = pages.last;

    var f = form.value;

    try {
      if (page < total - 1) {
        switch (page) {
          case 0:
            if (signal.value!.isEmpty) {
              throw 'Please type';
            }
            page += 1;
            break;

          case 1:
            if (f.dateRequested == null) throw 'Please select';
            page += 1;
            break;
          case 2:
            if (selectedUnit.value == null) throw 'Please select county';
            page += 1;
            break;
          case 3:
            if (f.locality == null || f.locality!.isEmpty) throw 'Please type';

            page += 1;
            break;
          case 4:
            if (f.description == null || f.description!.isEmpty) {
              throw 'Please type';
            }
            page += 1;
            break;
          case 5:
            if (f.dateReported == null) throw 'Please select';

            page += 1;
            break;
          case 6:
            page += 1;
            break;

          default:
            page += 1;
        }
        pages.add(page);

        if (page == 2) {
          fetchUnits(true);
        }
      } else {
        add();
      }
    } catch (e) {
      Util.toast(e);
    }
  }

  previous() async {
    if (pages.length > 1) {
      pages.removeLast();
    } else {
      Get.back();
    }
  }

  save() async {
    await Get.dialog(
      DialogWidget(
        title: 'Save this form?',
        content:
            'You are about to save this form. You will be able to edit and submit it later. Please confirm',
        onConfirm: () async {
          try {
            var box = await Db.pending();

            await box.put(
                '${signal.value}_pmebs_request',
                Pending()
                  ..signalId = signal.value!
                  ..type = 'pmebs'
                  ..subType = 'request'
                  ..form = form.value.toJson());

            Get.put(
              PendingController(),
              tag: 'pending',
              permanent: true,
            ).fetch();

            Get.back();
          } catch (e) {
            if (kDebugMode) {
              print(e);
            }
          }
        },
        onCancel: () async {
          Get.back();
        },
      ),
    );
  }
}
