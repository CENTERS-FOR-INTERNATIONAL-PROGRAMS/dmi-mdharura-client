import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_dharura/constant/routes.dart';
import 'package:m_dharura/helper/util.dart';
import 'package:m_dharura/model/task.dart';
import 'package:m_dharura/ui/_/custom_drop_down_widget.dart';
import 'package:m_dharura/ui/_/responsive_widget.dart';
import 'package:m_dharura/ui/datalist/task/task_datalist_controller.dart';

class TaskDatalistWidget extends ResponsiveWidget<TaskDatalistController> {
  final String unitId;

  TaskDatalistWidget({Key? key, required this.unitId}) : super(key: key);

  @override
  String get tag => 'task datalist unitId: $unitId';

  @override
  bool get shouldAdjust => true;

  @override
  TaskDatalistController get controller => Get.put(
        TaskDatalistController(unitId: unitId),
        tag: tag,
      );

  @override
  init() {
    // controller.fetch(true);
  }

  @override
  Widget? tablet() => Obx(
        () => Scaffold(
          appBar: AppBar(
            title: Text(
              controller.unit.value == null ? 'TaskDatalist' : controller.unit.value!.name,
            ),
            backgroundColor: controller.state.value == 'Test' ? Colors.black : Colors.lightGreen,
            actions: [
              if (controller.tasks.isNotEmpty)
                IconButton(
                  icon: controller.isDownloading.isTrue
                      ? const CircularProgressIndicator(
                          backgroundColor: Colors.white,
                          strokeWidth: 2,
                        )
                      : const Icon(Icons.download),
                  onPressed: () async => controller.download(),
                )
            ],
          ),
          body: controller.isFetching.isTrue && controller.tasks.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : RefreshIndicator(
                  onRefresh: () async {
                    controller.fetch(true);
                  },
                  child: NotificationListener<ScrollNotification>(
                    onNotification: (scrollInfo) {
                      if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
                        controller.fetch(false);
                      }
                      return false;
                    },
                    child: ListView(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.date_range,
                                              size: 16.0,
                                              color: Colors.grey.shade800,
                                            ),
                                            const SizedBox(
                                              width: 8.0,
                                            ),
                                            const Text('From'),
                                          ],
                                        ),
                                        Container(
                                          margin: const EdgeInsets.symmetric(vertical: 8),
                                          child: GestureDetector(
                                            onTap: () async {
                                              var selectedDateTime = await showDatePicker(
                                                context: screen.context,
                                                initialDate: controller.dateStart.value,
                                                firstDate: DateTime(DateTime.now().year - 100),
                                                lastDate: DateTime.now(),
                                                initialDatePickerMode: DatePickerMode.day,
                                              );

                                              if (selectedDateTime != null) {
                                                controller.dateStart.value = selectedDateTime;

                                                controller.fetch(true);
                                              }
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Colors.grey.shade100,
                                                borderRadius: BorderRadius.circular(5),
                                              ),
                                              padding: const EdgeInsets.all(16),
                                              child: Text(
                                                Util.formatDate(controller.dateStart.value),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 16.0,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.date_range,
                                              size: 16.0,
                                              color: Colors.grey.shade800,
                                            ),
                                            const SizedBox(
                                              width: 8.0,
                                            ),
                                            const Text('To'),
                                          ],
                                        ),
                                        Container(
                                          margin: const EdgeInsets.symmetric(vertical: 8),
                                          child: GestureDetector(
                                            onTap: () async {
                                              var selectedDateTime = await showDatePicker(
                                                context: screen.context,
                                                initialDate: controller.dateEnd.value,
                                                firstDate: DateTime(DateTime.now().year - 100),
                                                lastDate: DateTime.now(),
                                                initialDatePickerMode: DatePickerMode.day,
                                              );

                                              if (selectedDateTime != null) {
                                                controller.dateEnd.value = selectedDateTime;

                                                controller.fetch(true);
                                              }
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Colors.grey.shade100,
                                                borderRadius: BorderRadius.circular(5),
                                              ),
                                              padding: const EdgeInsets.all(16),
                                              child: Text(
                                                Util.formatDate(controller.dateEnd.value),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 8,
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
                                items: const ['All', 'Live', 'Test'],
                                labelText: 'State of signals reported',
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
                                  style: Theme.of(screen.context).textTheme.bodySmall,
                                ),
                              ),
                            ],
                          ),
                        Row(
                          children: [
                            Expanded(
                              child: SingleChildScrollView(
                                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                scrollDirection: Axis.horizontal,
                                child: DataTable(
                                  border: TableBorder.symmetric(
                                    outside: BorderSide(
                                      color: Colors.grey.shade300,
                                    ),
                                    inside: BorderSide(
                                      color: Colors.grey.shade200,
                                    ),
                                  ),
                                  columns: getColumns(),
                                  rows: getRows(controller.tasks),
                                  headingRowColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
                                    if (states.contains(MaterialState.hovered)) {
                                      return Colors.grey.shade200;
                                    }
                                    return Colors.grey.shade100;
                                  }),
                                  headingRowHeight: 48.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      );

  final List<String> columns = [
    'Item',
    'Signal',
    'Signal Id',
    'Status',
    'State',
    'Via',
    'Created At',
    'Unit name',
    'Unit type',
    'Unit state',
    'Reported By',
    'Reported By phonenumber',
    'Reported By status',
    'CEBS Verification Form',
    'CEBS Investigation Form',
    'CEBS Response Form',
    'CEBS Escalation Form',
    'CEBS Summary Form',
    'CEBS Lab Form',
    'HEBS Verification Form',
    'HEBS Investigation Form',
    'HEBS Response Form',
    'HEBS Escalation Form',
    'HEBS Summary Form',
    'HEBS Lab Form',
    'VEBS Verification Form',
    'VEBS Investigation Form',
    'VEBS Response Form',
    'VEBS Escalation Form',
    'VEBS Summary Form',
    'VEBS Lab Form',
    'LEBS Verification Form',
    'LEBS Investigation Form',
    'LEBS Response Form',
    'LEBS Escalation Form',
    'LEBS Summary Form',
    'LEBS Lab Form',
    'PMEBS Request Form',
    'PMEBS Report Form',
  ];

  List<DataColumn> getColumns() => columns
      .map(
        (e) => DataColumn(
          label: Text(
            e,
          ),
        ),
      )
      .toList();

  List<DataRow> getRows(List<Task> tasks) => List.generate(
        tasks.length,
        (index) {
          final task = tasks[index];
          return DataRow(
            cells: [
              DataCell(Text('${index + 1}'), onTap: () => onCellTap(task)),
              DataCell(Text(task.signal), onTap: () => onCellTap(task)),
              DataCell(
                Text(
                  task.signalId,
                ),
                onTap: () => onCellTap(task),
              ),
              DataCell(
                Text(
                  task.status,
                ),
                onTap: () => onCellTap(task),
              ),
              DataCell(
                Text(
                  task.state,
                ),
                onTap: () => onCellTap(task),
              ),
              DataCell(
                Text(
                  task.via,
                ),
                onTap: () => onCellTap(task),
              ),
              DataCell(
                Text(
                  Util.formatDate(task.createdAt),
                ),
                onTap: () => onCellTap(task),
              ),
              DataCell(
                Text(
                  task.unit.name,
                ),
                onTap: () => onCellTap(task),
              ),
              DataCell(
                Text(
                  task.unit.type,
                ),
                onTap: () => onCellTap(task),
              ),
              DataCell(
                Text(
                  task.unit.state,
                ),
                onTap: () => onCellTap(task),
              ),
              DataCell(
                Text(
                  task.user.displayName,
                ),
                onTap: () => onCellTap(task),
              ),
              DataCell(
                Text(
                  task.user.phoneNumber,
                ),
                onTap: () => onCellTap(task),
              ),
              DataCell(
                Text(
                  task.user.status,
                ),
                onTap: () => onCellTap(task),
              ),
              DataCell(
                Text(task.cebs == null
                    ? 'N/A'
                    : task.cebs!.verificationForm != null
                        ? 'Filled'
                        : 'Pending'),
                onTap: () => onCellTap(task),
              ),
              DataCell(
                Text(task.cebs == null
                    ? 'N/A'
                    : task.cebs!.investigationForm != null
                        ? 'Filled'
                        : 'Pending'),
                onTap: () => onCellTap(task),
              ),
              DataCell(
                Text(task.cebs == null
                    ? 'N/A'
                    : task.cebs!.responseForm != null
                        ? 'Filled'
                        : 'Pending'),
                onTap: () => onCellTap(task),
              ),
              DataCell(
                Text(task.cebs == null
                    ? 'N/A'
                    : task.cebs!.escalationForm != null
                        ? 'Filled'
                        : 'Pending'),
                onTap: () => onCellTap(task),
              ),
              DataCell(
                Text(task.cebs == null
                    ? 'N/A'
                    : task.cebs!.summaryForm != null
                        ? 'Filled'
                        : 'Pending'),
                onTap: () => onCellTap(task),
              ),
              DataCell(
                Text(task.cebs == null
                    ? 'N/A'
                    : task.cebs!.labForm != null
                        ? 'Filled'
                        : 'Pending'),
                onTap: () => onCellTap(task),
              ),
              DataCell(
                Text(task.hebs == null
                    ? 'N/A'
                    : task.hebs!.verificationForm != null
                        ? 'Filled'
                        : 'Pending'),
                onTap: () => onCellTap(task),
              ),
              DataCell(
                Text(task.hebs == null
                    ? 'N/A'
                    : task.hebs!.investigationForm != null
                        ? 'Filled'
                        : 'Pending'),
                onTap: () => onCellTap(task),
              ),
              DataCell(
                Text(task.hebs == null
                    ? 'N/A'
                    : task.hebs!.responseForm != null
                        ? 'Filled'
                        : 'Pending'),
                onTap: () => onCellTap(task),
              ),
              DataCell(
                Text(task.hebs == null
                    ? 'N/A'
                    : task.hebs!.escalationForm != null
                        ? 'Filled'
                        : 'Pending'),
                onTap: () => onCellTap(task),
              ),
              DataCell(
                Text(task.hebs == null
                    ? 'N/A'
                    : task.hebs!.summaryForm != null
                        ? 'Filled'
                        : 'Pending'),
                onTap: () => onCellTap(task),
              ),
              DataCell(
                Text(task.hebs == null
                    ? 'N/A'
                    : task.hebs!.labForm != null
                        ? 'Filled'
                        : 'Pending'),
                onTap: () => onCellTap(task),
              ),
              DataCell(
                Text(task.vebs == null
                    ? 'N/A'
                    : task.vebs!.verificationForm != null
                        ? 'Filled'
                        : 'Pending'),
                onTap: () => onCellTap(task),
              ),
              DataCell(
                Text(task.vebs == null
                    ? 'N/A'
                    : task.vebs!.investigationForm != null
                        ? 'Filled'
                        : 'Pending'),
                onTap: () => onCellTap(task),
              ),
              DataCell(
                Text(task.vebs == null
                    ? 'N/A'
                    : task.vebs!.responseForm != null
                        ? 'Filled'
                        : 'Pending'),
                onTap: () => onCellTap(task),
              ),
              DataCell(
                Text(task.vebs == null
                    ? 'N/A'
                    : task.vebs!.escalationForm != null
                        ? 'Filled'
                        : 'Pending'),
                onTap: () => onCellTap(task),
              ),
              DataCell(
                Text(task.vebs == null
                    ? 'N/A'
                    : task.vebs!.summaryForm != null
                        ? 'Filled'
                        : 'Pending'),
                onTap: () => onCellTap(task),
              ),
              DataCell(
                Text(task.vebs == null
                    ? 'N/A'
                    : task.vebs!.labForm != null
                        ? 'Filled'
                        : 'Pending'),
                onTap: () => onCellTap(task),
              ),
              DataCell(
                Text(task.lebs == null
                    ? 'N/A'
                    : task.lebs!.verificationForm != null
                        ? 'Filled'
                        : 'Pending'),
                onTap: () => onCellTap(task),
              ),
              DataCell(
                Text(task.lebs == null
                    ? 'N/A'
                    : task.lebs!.investigationForm != null
                        ? 'Filled'
                        : 'Pending'),
                onTap: () => onCellTap(task),
              ),
              DataCell(
                Text(task.lebs == null
                    ? 'N/A'
                    : task.lebs!.responseForm != null
                        ? 'Filled'
                        : 'Pending'),
                onTap: () => onCellTap(task),
              ),
              DataCell(
                Text(task.lebs == null
                    ? 'N/A'
                    : task.lebs!.escalationForm != null
                        ? 'Filled'
                        : 'Pending'),
                onTap: () => onCellTap(task),
              ),
              DataCell(
                Text(task.lebs == null
                    ? 'N/A'
                    : task.lebs!.summaryForm != null
                        ? 'Filled'
                        : 'Pending'),
                onTap: () => onCellTap(task),
              ),
              DataCell(
                Text(task.lebs == null
                    ? 'N/A'
                    : task.lebs!.labForm != null
                        ? 'Filled'
                        : 'Pending'),
                onTap: () => onCellTap(task),
              ),
              DataCell(
                Text(task.pmebs == null
                    ? 'N/A'
                    : task.pmebs!.requestForm != null
                        ? 'Filled'
                        : 'Pending'),
                onTap: () => onCellTap(task),
              ),
              DataCell(
                Text(task.pmebs == null
                    ? 'N/A'
                    : task.pmebs!.reportForm != null
                        ? 'Filled'
                        : 'Pending'),
                onTap: () => onCellTap(task),
              ),
            ],
          );
        },
      ).toList();

  void onCellTap(Task task) => Get.toNamed('${Routes.kTask}${task.id}');
}
