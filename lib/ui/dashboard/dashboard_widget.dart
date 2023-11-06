import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_dharura/helper/util.dart';
import 'package:m_dharura/ui/_/custom_drop_down_widget.dart';
import 'package:m_dharura/ui/_/item/dashboard_item_widget.dart';
import 'package:m_dharura/ui/_/responsive_widget.dart';
import 'package:m_dharura/ui/dashboard/dashboard_controller.dart';

class DashboardWidget extends ResponsiveWidget<DashboardController> {
  final String unitId;

  DashboardWidget({Key? key, required this.unitId}) : super(key: key);

  @override
  String get tag => 'dashboard unitId: $unitId';

  @override
  bool get shouldAdjust => true;

  @override
  DashboardController get controller => Get.put(
        DashboardController(unitId: unitId),
        tag: tag,
        permanent: true,
      );

  @override
  init() {
    if (controller.dashboards.isEmpty) controller.fetch();
  }

  @override
  Widget? tablet() => Obx(
        () => Scaffold(
          appBar: AppBar(
            title: Text(
              controller.unit.value == null
                  ? 'Dashboard'
                  : controller.unit.value!.name,
            ),
            backgroundColor: controller.state.value == 'Test'
                ? Colors.black
                : Colors.lightGreen,
          ),
          body: controller.isFetching.isTrue && controller.dashboards.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : RefreshIndicator(
                  onRefresh: () async {
                    controller.fetch();
                  },
                  child: ListView(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
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
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 8),
                                        child: GestureDetector(
                                          onTap: () async {
                                            var selectedDateTime =
                                                await showDatePicker(
                                              context: screen.context,
                                              initialDate:
                                                  controller.dateStart.value,
                                              firstDate: DateTime(
                                                  DateTime.now().year - 100),
                                              lastDate: DateTime.now(),
                                              initialDatePickerMode:
                                                  DatePickerMode.day,
                                            );

                                            if (selectedDateTime != null) {
                                              controller.dateStart.value =
                                                  selectedDateTime;

                                              controller.fetch();
                                            }
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.grey.shade100,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            padding: const EdgeInsets.all(16),
                                            child: Text(
                                              Util.formatDate(
                                                  controller.dateStart.value),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
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
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 8),
                                        child: GestureDetector(
                                          onTap: () async {
                                            var selectedDateTime =
                                                await showDatePicker(
                                              context: screen.context,
                                              initialDate:
                                                  controller.dateEnd.value,
                                              firstDate: DateTime(
                                                  DateTime.now().year - 100),
                                              lastDate: DateTime.now(),
                                              initialDatePickerMode:
                                                  DatePickerMode.day,
                                            );

                                            if (selectedDateTime != null) {
                                              controller.dateEnd.value =
                                                  selectedDateTime;

                                              controller.fetch();
                                            }
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.grey.shade100,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            padding: const EdgeInsets.all(16),
                                            child: Text(
                                              Util.formatDate(
                                                  controller.dateEnd.value),
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

                                controller.fetch();
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
                      ...List.generate(
                        controller.dashboards.length,
                        (index) => DashboardItemWidget(
                          dashboard: controller.dashboards[index],
                          index: index + 1,
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      );
}
