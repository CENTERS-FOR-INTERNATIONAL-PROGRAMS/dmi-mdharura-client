import 'dart:convert';

import 'package:get/get.dart';
import 'package:m_dharura/api/task_api.dart';
import 'package:m_dharura/api/unit_api.dart';
import 'package:m_dharura/constant/env.dart';
import 'package:m_dharura/constant/routes.dart';
import 'package:m_dharura/constant/signal.dart';
import 'package:m_dharura/helper/extension.dart';
import 'package:m_dharura/helper/session.dart';
import 'package:m_dharura/helper/util.dart';
import 'package:m_dharura/model/form/pmebs/pmebs_report_form.dart';
import 'package:m_dharura/model/signal.dart';
import 'package:m_dharura/model/unit.dart';
import 'package:m_dharura/model/unit_page.dart';
import 'package:m_dharura/ui/_/dialog_widget.dart';

class PmebsReportFormController extends GetxController {
  Rx<PmebsReportForm> form = Rx(PmebsReportForm());
  var isFetching = false.obs;
  var isAdding = false.obs;
  var pages = [0].obs;
  final int total = 10;

  var isFetchingCounties = false.obs;
  var isFetchingSubCounties = false.obs;

  RxList<Signal> signals = RxList.empty();

  Rx<String?> type = Rx(null);
  Rx<String?> signal = Rx(null);

  final _unitApi = Get.put(UnitApi());

  final _taskApi = Get.put(TaskApi());

  RxList<Unit> counties = RxList<Unit>.empty();
  RxList<Unit> subCounties = RxList<Unit>.empty();

  Rx<Unit?> selectedCounty = Rx(null);
  Rx<Unit?> selectedSubCounty = Rx(null);

  UnitPage? _countiesPage, _subCountiesPage;

  String getParentId(List<Unit> units, String name) {
    Unit? unit;
    int index = units.indexWhere((e) => e.name == name);

    if (index != -1) {
      unit = units[index];
    } else {
      unit = null;

      return '';
    }

    return unit.id!;
  }

  fetchUnits(bool refresh) async {
    UnitPage? unitPage = UnitPage();
    bool isFetching = false;
    Map<String, String> query = {};

    switch (pages.last) {
      case 3:
        unitPage = _countiesPage;
        isFetching = isFetchingCounties.value;
        query = {'type': 'County'};
        break;
      case 4:
        unitPage = _subCountiesPage;
        isFetching = isFetchingSubCounties.value;

        query = {
          'parent': getParentId(counties, selectedCounty.value!.name),
          'type': 'Subcounty'
        };
        break;

      default:
    }

    if (isFetching) return;

    isFetching = true;

    if (refresh) {
      unitPage = null;
      subCounties.clear();
    } else if ((unitPage!.page >= unitPage.pages || unitPage.docs.isEmpty)) {
      isFetching = false;

      updatePage(isFetching: false);

      return;
    }

    updatePage(isFetching: isFetching);

    try {
      int page = unitPage == null ? 1 : unitPage.page + 1;

      query.addAll({'page': page.toString()});

      unitPage = (await _unitApi.retrieve(query)).data?.unitPage;

      updatePage(isFetching: isFetching, unitPage: unitPage);
    } catch (e) {
      Util.toast(e);
    }
    updatePage(isFetching: false);
  }

  updatePage({bool? isFetching, UnitPage? unitPage}) {
    switch (pages.last) {
      case 3:
        isFetchingCounties.value = isFetching ?? false;

        // counties.addAll(unitPage.docs);

        if (unitPage != null) {
          _countiesPage = unitPage;

          for (var e in unitPage.docs) {
            int cIndex = counties.indexWhere((m) => m.name == e.name);

            counties.addIf(cIndex == -1, e);
          }
        }

        break;
      case 4:
        isFetchingSubCounties.value = isFetching ?? false;

        if (unitPage != null) {
          _subCountiesPage = unitPage;

          subCounties.addAll(unitPage.docs);
        }

        break;

      default:
    }
  }

  add() async {
    if (isFetching.isTrue || isAdding.isTrue) return;

    isAdding.value = true;

    try {
      await Session.user();

      var task = (await _taskApi.reportPmebs(
        selectedSubCounty.value!.id!,
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
                '${kSmsPrefix}pmr ${selectedSubCounty.value!.id} ${jsonEncode(form.value.toJson().trim())}'),
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
            if (type.value == null || type.value!.isEmpty) {
              throw 'Please select';
            }

            if (type.value == 'CEBS') {
              signals.assignAll(cebsSignals);
            } else if (type.value == 'LEBS') {
              signals.assignAll(lebsSignals);
            } else if (type.value == 'HEBS') {
              signals.assignAll(hebsSignals);
            } else {
              signals.assignAll(vebsSignals);
            }

            page += 1;
            break;

          case 1:
            if (f.dateDetected == null) throw 'Please select';
            page += 1;
            break;
          case 2:
            if (signal.value == null || signal.value!.isEmpty) {
              throw 'Please type';
            }
            page += 1;
            break;
          case 3:
            if (selectedCounty.value == null) throw 'Please select';
            page += 1;
            break;
          case 4:
            if (selectedSubCounty.value == null) throw 'Please select';
            page += 1;
            break;
          case 5:
            if (f.locality == null || f.locality!.isEmpty) throw 'Please type';
            page += 1;
            break;
          case 6:
            if (f.description == null || f.description!.isEmpty) {
              throw 'Please type';
            }
            page += 1;
            break;
          case 7:
            if (f.source == null || f.source!.isEmpty) throw 'Please select';
            page += 1;
            break;
          case 8:
            if (f.dateReported == null) throw 'Please select';
            page += 1;
            break;
          case 9:
            page += 1;
            break;

          default:
            page += 1;
        }
        pages.add(page);

        if (page == 3 || page == 4) {
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
}
