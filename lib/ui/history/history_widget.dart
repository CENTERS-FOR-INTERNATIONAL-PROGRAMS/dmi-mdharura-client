import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_dharura/helper/util.dart';
import 'package:m_dharura/ui/_/custom_drop_down_widget.dart';
import 'package:m_dharura/ui/_/item/task_item_widget.dart';
import 'package:m_dharura/ui/_/responsive_widget.dart';
import 'package:m_dharura/ui/history/history_controller.dart';

class HistoryWidget extends ResponsiveWidget<HistoryController> {
  final String userId;

  HistoryWidget({Key? key, required this.userId}) : super(key: key);

  @override
  String get tag => 'history $userId';

  @override
  bool get shouldAdjust => true;

  @override
  HistoryController get controller => Get.put(
        HistoryController(userId: userId),
        tag: tag,
        permanent: true,
      );

  @override
  init() {
    if (controller.tasks.isEmpty) controller.fetch(true);
  }

  @override
  Widget? tablet() => Obx(
        () => Scaffold(
          appBar: AppBar(
            title: Text(
              controller.user.value == null
                  ? 'History'
                  : controller.user.value!.displayName,
            ),
            backgroundColor: controller.state.value == 'Test'
                ? Colors.black
                : Colors.lightGreen,
            actions: [
              if (controller.user.value != null)
                IconButton(
                  icon: const Icon(Icons.call),
                  onPressed: () async =>
                      await Util.call(controller.user.value!.phoneNumber),
                )
            ],
          ),
          body: RefreshIndicator(
            onRefresh: () async {
              controller.fetch(true);
            },
            child: NotificationListener<ScrollNotification>(
              onNotification: (scrollInfo) {
                if (scrollInfo.metrics.pixels ==
                    scrollInfo.metrics.maxScrollExtent) controller.fetch(false);
                return false;
              },
              child: controller.isFetching.isTrue && controller.tasks.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Column(
                      children: [
                        if (controller.taskPage.value != null)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 8,
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 4,
                                  horizontal: 8,
                                ),
                                child: Text(
                                  '${controller.isFetching.isTrue ? 'Loading more... ' : ''}You are viewing ${controller.taskPage.value!.currentTotal} of ${controller.taskPage.value!.total}',
                                  style: Theme.of(screen.context)
                                      .textTheme
                                      .bodySmall,
                                ),
                              ),
                            ],
                          ),
                        Expanded(
                          child: ListView.builder(
                            itemBuilder: (context, index) => index == 0
                                ? Column(
                                    children: [
                                      if (controller.taskPage.value == null)
                                        const SizedBox(
                                          height: 16,
                                        ),
                                      Row(
                                        children: [
                                          const SizedBox(
                                            width: 16,
                                          ),
                                          Expanded(
                                            child: CustomDropDownWidget(
                                              value: controller.state.value,
                                              onChanged: (value) async {
                                                controller.state.value = value!;

                                                controller.fetch(true);
                                              },
                                              items: const [
                                                'All',
                                                'Live',
                                                'Test'
                                              ],
                                              labelText:
                                                  'State of signals reported',
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 16,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                    ],
                                  )
                                : TaskItemWidget(
                                    task: controller.tasks[index - 1],
                                  ),
                            itemCount: controller.tasks.length + 1,
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ),
      );
}
