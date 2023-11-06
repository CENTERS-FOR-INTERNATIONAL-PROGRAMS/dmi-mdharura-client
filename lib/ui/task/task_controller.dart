import 'package:get/get.dart';
import 'package:m_dharura/api/task_api.dart';
import 'package:m_dharura/helper/util.dart';
import 'package:m_dharura/model/task.dart';

class TaskController extends GetxController {
  var isFetching = false.obs;

  final String taskId;

  TaskController({required this.taskId});

  Rx<Task?> task = Rx(null);

  final _taskApi = Get.put(TaskApi());

  @override
  void onInit() async {
    super.onInit();

    fetch();
  }

  void fetch() async {
    if (isFetching.isTrue) return;

    isFetching.value = true;

    try {
      Map<String, dynamic> query = {'taskId': taskId};

      task.value = (await _taskApi.retrieve(query)).data?.task;
    } catch (e) {
      Util.toast(e);
    }

    isFetching.value = false;
  }
}
