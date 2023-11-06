import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:m_dharura/api/task_api.dart';
import 'package:m_dharura/constant/env.dart';
import 'package:m_dharura/constant/routes.dart';
import 'package:m_dharura/db/db.dart';
import 'package:m_dharura/helper/extension.dart';
import 'package:m_dharura/helper/session.dart';
import 'package:m_dharura/helper/signal.dart';
import 'package:m_dharura/helper/util.dart';
import 'package:m_dharura/model/form/_/investigation_form.dart';
import 'package:m_dharura/model/pending.dart';
import 'package:m_dharura/ui/_/dialog_widget.dart';
import 'package:m_dharura/ui/pending/pending_controller.dart';

class InvestigationFormController extends GetxController {
  var isFetching = false.obs;
  var isAdding = false.obs;
  final int total = 24;
  var pages = [0].obs;

  Rx<InvestigationForm> form = Rx(InvestigationForm());

  final _taskApi = Get.put(TaskApi());

  final String? signalId;
  final String type;

  InvestigationFormController({required this.type, this.signalId});

  Rx<String?> signal = Rx(null);

  @override
  void onInit() async {
    super.onInit();

    signal.value = signalId;

    try {
      var box = await Db.pending();

      var pending = box.get('${signal.value}_investigation');

      if (pending != null) {
        form.value = InvestigationForm.fromJson(pending.form);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  add() async {
    if (isFetching.isTrue || isAdding.isTrue) return;

    isAdding.value = true;

    try {
      await Session.user();

      var task = (await _taskApi.updateForm(
        signal.value!.trim(),
        type,
        'investigation',
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
                '$kSmsPrefix${signalPrefix(type)}i ${signal.value!.trim()} ${jsonEncode(form.value.toJson().trim())}'),
          ),
        );
      }
    }

    isAdding.value = false;
  }

  next() async {
    int page = pages.last;

    try {
      var f = form.value;

      if (page < total - 1) {
        switch (page) {
          case 0:
            if (signal.value!.isEmpty) {
              throw 'Please type';
            }
            page += 1;
            break;
          case 1:
            if (f.dateSCDSCInformed == null) throw 'Please select';
            page += 1;
            break;
          case 2:
            if (f.dateInvestigationStarted == null) throw 'Please select';
            page += 1;
            break;
          case 3:
            if (f.dateEventStarted == null) throw 'Please select';
            page += 1;
            break;
          case 4:
            if (f.symptoms == null || f.symptoms!.isEmpty) throw 'Please type';
            page += 1;
            break;
          case 5:
            if (f.humansCases == null) throw 'Please type';
            page += 1;
            break;
          case 6:
            if (f.humansCasesHospitalized == null) throw 'Please type';
            page += 1;
            break;
          case 7:
            if (f.humansDead == null) throw 'Please type';
            page += 1;
            break;
          case 8:
            if (f.animalsCases == null) throw 'Please type';
            page += 1;
            break;
          case 9:
            if (f.animalsDead == null) throw 'Please type';
            page += 1;
            break;
          case 10:
            if (f.isCauseKnown == null) throw 'Please select';
            if (f.isCauseKnown!.toLowerCase() == 'no') {
              page += 2;
              break;
            }
            page += 1;
            break;
          case 11:
            if (f.cause == null || f.cause!.isEmpty) throw 'Please type';
            page += 1;
            break;
          case 12:
            if (f.isLabSamplesCollected == null) throw 'Please select';
            if (f.isLabSamplesCollected!.toLowerCase() == 'yes') {
              page += 1;
              break;
            }
            page += 4;
            break;
          case 13:
            if (f.dateSampleCollected == null) throw 'Please select';
            page += 1;
            break;
          case 14:
            if (f.labResults == null || f.labResults!.isEmpty) {
              throw 'Please type';
            }
            page += 1;
            break;
          case 15:
            if (f.dateLabResultsReceived == null) throw 'Please select';
            page += 1;
            break;
          case 16:
            if (f.isNewCasedReportedFromInitialArea == null) {
              throw 'Please select';
            }
            page += 1;
            break;
          case 17:
            if (f.isNewCasedReportedFromNewAreas == null) throw 'Please select';
            page += 1;
            break;
          case 18:
            if (f.isEventSettingPromotingSpread == null) throw 'Please select';
            page += 1;
            break;
          case 19:
            if (f.additionalInformation == null ||
                f.additionalInformation!.isEmpty) throw 'Please type';
            page += 1;
            break;
          case 20:
            if (f.riskClassification == null) throw 'Please select';
            page += 1;
            break;
          case 21:
            if (f.responseActivities == null || f.responseActivities!.isEmpty) {
              throw 'Please select';
            }
            page += 1;
            break;
          case 22:
            if (f.dateSCMOHInformed == null) throw 'Please select';
            page += 1;
            break;
          default:
            page += 1;
        }

        pages.add(page);
      } else {
        await add();
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
                '${signal.value}_investigation',
                Pending()
                  ..signalId = signal.value!
                  ..type = type
                  ..subType = 'investigation'
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
