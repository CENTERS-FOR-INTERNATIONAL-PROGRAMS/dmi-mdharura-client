import 'package:get/get.dart';
import 'package:m_dharura/api/task_api.dart';
import 'package:m_dharura/helper/util.dart';
import 'package:m_dharura/model/task.dart';
import 'package:m_dharura/model/task_page.dart';

class TasksController extends GetxController {
  var isFetching = false.obs;

  RxList<Task> tasks = RxList.empty();

  Rx<TaskPage?> taskPage = Rx(null);

  final _taskApi = Get.put(TaskApi());

  final String unitId;
  final String type;

  RxString state = RxString('All');

  TasksController({required this.unitId, required this.type});

  @override
  void onInit() async {
    super.onInit();

    fetch(true);
  }

  void fetch(bool refresh) async {
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
      int page = taskPage.value == null ? 1 : taskPage.value!.next;

      Map<String, dynamic> query = {
        'page': page.toString(),
        'type': type,
      };

      query.addAll({'unitId': unitId});

      if (state.value != 'All') {
        query.addAll({'state': state.value.toLowerCase()});
      }

      taskPage.value = (await _taskApi.retrieve(query)).data?.taskPage;

      tasks.addAll(taskPage.value!.docs);
    } catch (e) {
      Util.toast(e);
    }

    isFetching.value = false;
  }
}
