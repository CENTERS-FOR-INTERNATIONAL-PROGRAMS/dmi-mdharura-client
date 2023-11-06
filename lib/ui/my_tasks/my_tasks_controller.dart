import 'package:get/get.dart';
import 'package:m_dharura/api/task_api.dart';
import 'package:m_dharura/helper/session.dart';
import 'package:m_dharura/helper/util.dart';
import 'package:m_dharura/model/task.dart';
import 'package:m_dharura/model/task_page.dart';

class MyTasksController extends GetxController {
  var isFetching = false.obs;

  final _taskApi = Get.put(TaskApi());

  RxList<Task> tasks = RxList.empty();

  Rx<TaskPage?> taskPage = Rx(null);

  RxString state = RxString('All');

  @override
  void onInit() async {
    super.onInit();

    fetch(true);
  }

  fetch(bool refresh) async {
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

      var userId = (await Session.user()).id;

      Map<String, dynamic> query = {
        'userId': userId,
        'page': page.toString(),
        'type': 'todo',
      };

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
