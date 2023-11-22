import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:m_dharura/api/task_api.dart';
import 'package:m_dharura/api/unit_api.dart';
import 'package:m_dharura/constant/env.dart';
import 'package:m_dharura/helper/util.dart';
import 'package:m_dharura/model/file.dart';
import 'package:m_dharura/model/task.dart';
import 'package:m_dharura/model/task_page.dart';
import 'package:m_dharura/model/unit.dart';
import 'package:m_dharura/helper/extension.dart';

class TaskDatalistController extends GetxController {
  var isFetching = false.obs;
  var isDownloading = false.obs;

  final String unitId;

  RxList<Task> tasks = RxList.empty();

  Rx<TaskPage?> taskPage = Rx(null);

  final _taskApi = Get.put(TaskApi());

  final _unitApi = Get.put(UnitApi());

  RxString state = RxString('Live');

  Rx<Unit?> unit = Rx(null);
  Rx<File?> file = Rx(null);

  TaskDatalistController({required this.unitId});

  Rx<DateTime> dateStart = Rx<DateTime>(DateTime.now().subtract(const Duration(days: 30)).startOfDay());
  Rx<DateTime> dateEnd = Rx<DateTime>(DateTime.now().subtract(const Duration(days: 1)).endOfDay());

  @override
  void onInit() async {
    super.onInit();

    await fetch(refresh: true);
  }

  fetch({bool refresh = false, String direction = 'next'}) async {
    if (isFetching.isTrue) return;

    isFetching.value = true;

    if (refresh) {
      tasks.clear();

      taskPage.value = null;
    } else if (taskPage.value != null && taskPage.value!.isEnd) {
      isFetching.value = false;
      return;
    }

    try {
      unit.value ??= (await _unitApi.retrieve({'unitId': unitId})).data?.unit;

      int page = taskPage.value == null
          ? 1
          : direction == 'prev'
              ? taskPage.value!.prev
              : taskPage.value!.next;

      Map<String, dynamic> query = {
        'unitId': unitId,
        'dateStart': dateStart.value.startOfDay().toUtc().toIso8601String(),
        'dateEnd': dateEnd.value.endOfDay().toUtc().toIso8601String(),
        'page': page.toString(),
        'type': '',
      };

      if (kDebugMode) {
        print('Query $query');
      }

      if (state.value != 'All') {
        query.addAll({'state': state.value.toLowerCase()});
      }

      taskPage.value = (await _taskApi.retrieve(query)).data?.taskPage;

      tasks.value = taskPage.value!.docs;
    } catch (e) {
      Util.toast(e);
    }

    isFetching.value = false;
  }

  download() async {
    if (isDownloading.isTrue) return;

    isDownloading.value = true;

    try {
      file.value = (await _taskApi.downloadTasks({
        'unitId': unit.value!.id,
        'dateStart': dateStart.value.startOfDay().toUtc().toIso8601String(),
        'dateEnd': dateEnd.value.endOfDay().toUtc().toIso8601String(),
      }))
          .data
          ?.file;

      if (file.value != null) {
        Util.url('${kBaseApiUrl}v1/file/${file.value!.filename}');
      }
    } catch (e) {
      Util.toast(e);
    }

    isDownloading.value = false;
  }
}
