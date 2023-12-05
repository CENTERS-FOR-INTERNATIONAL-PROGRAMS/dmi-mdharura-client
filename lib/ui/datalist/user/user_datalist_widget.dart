import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_dharura/constant/routes.dart';
import 'package:m_dharura/helper/util.dart';
import 'package:m_dharura/model/role.dart';
import 'package:m_dharura/ui/_/responsive_widget.dart';
import 'package:m_dharura/ui/datalist/user/user_datalist_controller.dart';

class UserDatalistWidget extends ResponsiveWidget<UserDatalistController> {
  final String unitId;

  UserDatalistWidget({Key? key, required this.unitId}) : super(key: key);

  @override
  String get tag => 'user datalist unitId: $unitId';

  @override
  bool get shouldAdjust => true;

  @override
  UserDatalistController get controller => Get.put(
        UserDatalistController(unitId: unitId),
        tag: tag,
      );

  @override
  init() {}

  @override
  Widget? tablet() => Scaffold(
        appBar: AppBar(
          title: Obx(
            () => Text(
              controller.unit.value == null ? 'Userlist' : controller.unit.value!.name,
            ),
          ),
          backgroundColor: controller.unit.value?.state == 'Test' ? Colors.black : Colors.lightGreen,
        ),
        body: Obx(
          () => controller.isFetching.isTrue && controller.roles.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : RefreshIndicator(
                  onRefresh: () async {
                    controller.fetch(refresh: true);
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

                                              controller.fetch(refresh: true);
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

                                              controller.fetch(refresh: true);
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
                      if (controller.rolePage.value != null)
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
                                '${controller.isFetching.isTrue ? 'Loading more... ' : ''}You are viewing ${controller.rolePage.value!.currentTotal} of ${controller.rolePage.value!.total}',
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
                                rows: getRows(controller.roles),
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
                      const SizedBox(height: 8.0),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text('Page', style: Theme.of(screen.context).textTheme.bodySmall),
                                const SizedBox(width: 4.0),
                                Obx(() => Text(
                                      '${controller.rolePage.value?.page ?? 1}',
                                      style: Theme.of(screen.context).textTheme.bodySmall,
                                    )),
                                const SizedBox(width: 4.0),
                                Text(
                                  'of',
                                  style: Theme.of(screen.context).textTheme.bodySmall,
                                ),
                                const SizedBox(width: 4.0),
                                Obx(() => Text(
                                      '${controller.rolePage.value?.pages ?? 1}',
                                      style: Theme.of(screen.context).textTheme.bodySmall,
                                    )),
                              ],
                            ),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    ElevatedButton(
                                      style: Theme.of(screen.context).elevatedButtonTheme.style?.copyWith(
                                            minimumSize: MaterialStateProperty.all(const Size(56, 40)),
                                            backgroundColor: MaterialStateProperty.all(Colors.grey.shade100),
                                            shape: MaterialStatePropertyAll(
                                              RoundedRectangleBorder(
                                                side: BorderSide(color: Colors.grey.shade300),
                                                borderRadius: BorderRadius.circular(4.0),
                                              ),
                                            ),
                                            padding: MaterialStateProperty.all(
                                              const EdgeInsets.symmetric(horizontal: 8.0),
                                            ),
                                          ),
                                      onPressed: () => controller.fetch(refresh: false, direction: 'prev'),
                                      child: const Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(
                                            Icons.chevron_left,
                                            size: 16.0,
                                            color: Colors.black87,
                                          ),
                                          SizedBox(width: 4.0),
                                          Text(
                                            'Prev',
                                            style: TextStyle(
                                              color: Colors.black87,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(width: 8.0),
                                Row(
                                  children: [
                                    ElevatedButton(
                                      style: Theme.of(screen.context).elevatedButtonTheme.style?.copyWith(
                                            minimumSize: MaterialStateProperty.all(const Size(56, 40)),
                                            backgroundColor: MaterialStateProperty.all(Colors.grey.shade100),
                                            shape: MaterialStatePropertyAll(
                                              RoundedRectangleBorder(
                                                side: BorderSide(color: Colors.grey.shade300),
                                                borderRadius: BorderRadius.circular(4.0),
                                              ),
                                            ),
                                            padding: MaterialStateProperty.all(
                                              const EdgeInsets.symmetric(horizontal: 8.0),
                                            ),
                                          ),
                                      onPressed: () => controller.fetch(refresh: false, direction: 'next'),
                                      child: const Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Next',
                                            style: TextStyle(
                                              color: Colors.black87,
                                            ),
                                          ),
                                          SizedBox(width: 4.0),
                                          Icon(
                                            Icons.chevron_right,
                                            size: 16.0,
                                            color: Colors.black87,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
        ),
      );

  final List<String> columns = [
    'Item',
    'Name',
    'Phonenumber',
    'Spot',
    'Status',
    'Created At',
    'Unit name',
    'Unit type',
    'Unit state',
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

  List<DataRow> getRows(List<Role> roles) => List.generate(roles.length, (index) {
        final role = roles[index];
        return DataRow(cells: [
          DataCell(Text('${index + 1}'), onTap: () => onCellTap(role)),
          DataCell(
            Text(
              role.user.displayName,
            ),
            onTap: () => onCellTap(role),
          ),
          DataCell(
            Text(
              role.user.phoneNumber,
            ),
            onTap: () => onCellTap(role),
          ),
          DataCell(
            Text(
              role.spot,
            ),
            onTap: () => onCellTap(role),
          ),
          DataCell(
            Text(
              role.user.status,
            ),
            onTap: () => onCellTap(role),
          ),
          DataCell(
              Text(
                Util.formatDate(role.createdAt),
              ),
              onTap: () => onCellTap(role)),
          DataCell(
            Text(
              role.unit.name,
            ),
            onTap: () => onCellTap(role),
          ),
          DataCell(
            Text(
              role.unit.type,
            ),
            onTap: () => onCellTap(role),
          ),
          DataCell(
            Text(
              role.unit.state,
            ),
            onTap: () => onCellTap(role),
          ),
        ]);
      });

  void onCellTap(Role role) => Get.toNamed('${Routes.kHistory}${role.user.id}');
}
