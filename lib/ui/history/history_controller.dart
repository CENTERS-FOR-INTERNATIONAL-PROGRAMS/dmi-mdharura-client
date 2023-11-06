import 'package:get/get.dart';
import 'package:m_dharura/api/task_api.dart';
import 'package:m_dharura/api/user_api.dart';
import 'package:m_dharura/helper/util.dart';
import 'package:m_dharura/model/task.dart';
import 'package:m_dharura/model/task_page.dart';
import 'package:m_dharura/model/user.dart';

class HistoryController extends GetxController {
  var isFetching = false.obs;

  final _taskApi = Get.put(TaskApi());

  final _userApi = Get.put(UserApi());

  RxList<Task> tasks = RxList.empty();

  Rx<TaskPage?> taskPage = Rx(null);

  RxString state = RxString('All');

  final String userId;

  Rx<User?> user = Rx(null);

  HistoryController({required this.userId});

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

      user.value = null;

      taskPage.value = null;
    } else if (taskPage.value != null && taskPage.value!.isEnd) {
      isFetching.value = false;
      return;
    }

    try {
      int page = taskPage.value == null ? 1 : taskPage.value!.next;

      Map<String, dynamic> query = {
        'userId': userId,
        'page': page.toString(),
        'type': 'history',
      };

      if (state.value != 'All') {
        query.addAll({'state': state.value.toLowerCase()});
      }

      user.value ??= (await _userApi.retrieve({'userId': userId})).data?.user;

      taskPage.value = (await _taskApi.retrieve(query)).data?.taskPage;

      tasks.addAll(taskPage.value!.docs);
    } catch (e) {
      Util.toast(e);
    }

    isFetching.value = false;
  }
}
