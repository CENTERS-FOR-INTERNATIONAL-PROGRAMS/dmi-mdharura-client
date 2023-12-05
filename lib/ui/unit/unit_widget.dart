import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_dharura/constant/data_list.dart';
import 'package:m_dharura/constant/routes.dart';
import 'package:m_dharura/ui/_/dialog_widget.dart';
import 'package:m_dharura/ui/_/responsive_widget.dart';
import 'package:m_dharura/ui/roles/roles_widget.dart';
import 'package:m_dharura/ui/tasks/tasks_widget.dart';
import 'package:m_dharura/ui/unit/unit_controller.dart';
import 'package:m_dharura/ui/units/units_widget.dart';

class UnitWidget extends ResponsiveWidget<UnitController> {
  final String unitId;

  UnitWidget({Key? key, required this.unitId}) : super(key: key);

  @override
  String get tag => 'unit: $unitId';

  @override
  bool get shouldAdjust => true;

  @override
  UnitController get controller => Get.put(
        UnitController(unitId: unitId),
        tag: tag,
        permanent: true,
      );

  @override
  init() {
    controller.fetch();
  }

  @override
  Widget? tablet() => Obx(
        () => controller.unit.value == null
            ? Scaffold(
                appBar: AppBar(
                  title: const Text('Level'),
                ),
                body: RefreshIndicator(
                  onRefresh: () async {
                    controller.fetch();
                  },
                  child: controller.isFetching.isTrue
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView(),
                ),
              )
            : Scaffold(
                appBar: AppBar(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        controller.unit.value!.name,
                      ),
                      Text(
                        '${controller.unit.value!.state.capitalize} · ${controller.unit.value!.type}',
                        style: Theme.of(screen.context).textTheme.bodySmall?.copyWith(
                              color: Colors.white,
                            ),
                      ),
                    ],
                  ),
                  backgroundColor: controller.unit.value!.state == 'live' ? Colors.lightGreen : Colors.black,
                  actions: [
                    if (controller.unit.value != null)
                      IconButton(
                        icon: const Icon(Icons.more_vert),
                        onPressed: () async {
                          var unit = controller.unit.value!;

                          await Get.bottomSheet(
                            SingleChildScrollView(
                              child: SafeArea(
                                child: Column(
                                  children: [
                                    ListTile(
                                      title: Text(
                                        unit.name,
                                        style: Theme.of(screen.context).textTheme.bodyLarge?.copyWith(
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      subtitle: Text(
                                        '${unit.state.capitalize} · ${unit.type}${unit.type == 'Health facility' ? ' · MFL ${unit.code}' : ''}',
                                      ),
                                      onTap: () async {
                                        Get.back();

                                        await Get.toNamed('${Routes.kUnit}${unit.id}');
                                      },
                                    ),
                                    const Divider(),
                                    ListTile(
                                      leading: const Icon(Icons.stacked_bar_chart),
                                      title: Text(
                                        'View dashboard',
                                        style: Theme.of(screen.context).textTheme.bodyLarge,
                                      ),
                                      onTap: () async {
                                        Get.back();

                                        await Get.toNamed('${Routes.kDashboard}${unit.id}');
                                      },
                                    ),
                                    ListTile(
                                      leading: const Icon(Icons.table_rows),
                                      title: Text(
                                        'View users data list',
                                        style: Theme.of(screen.context).textTheme.bodyLarge,
                                      ),
                                      onTap: () async {
                                        Get.back();

                                        await Get.toNamed('${Routes.kDatalist}${DatalistType.kUser}/${unit.id}');
                                      },
                                    ),
                                    ListTile(
                                      leading: const Icon(Icons.table_rows),
                                      title: Text(
                                        'View tasks data list',
                                        style: Theme.of(screen.context).textTheme.bodyLarge,
                                      ),
                                      onTap: () async {
                                        Get.back();

                                        await Get.toNamed('${Routes.kDatalist}${DatalistType.kTask}/${unit.id}');
                                      },
                                    ),
                                    if (unit.parent != null)
                                      ListTile(
                                        leading: const Icon(Icons.call_made),
                                        title: Text(
                                          'View parent level',
                                          style: Theme.of(screen.context).textTheme.bodyLarge,
                                        ),
                                        onTap: () async {
                                          Get.back();

                                          await Get.toNamed('${Routes.kUnit}${unit.parent}');
                                        },
                                      ),
                                    SwitchListTile(
                                      title: Text(
                                        'State',
                                        style: Theme.of(screen.context).textTheme.bodyLarge,
                                      ),
                                      subtitle: Text('Currently in ${unit.state}'),
                                      value: unit.state == 'live',
                                      onChanged: (value) async {
                                        Get.back();

                                        await Get.dialog(DialogWidget(
                                          title: 'Change ${unit.name}\'s state?',
                                          content: 'You are about to change ${unit.name}\'s state to ${value ? 'live' : 'test'}. Please confirm.',
                                          onConfirm: () async => await controller.updateState(unit.id!, value ? 'live' : 'test'),
                                          confirmText: 'Change',
                                        ));
                                      },
                                    ),
                                    const Divider(),
                                    ListTile(
                                      title: Text(
                                        'Remove',
                                        style: Theme.of(screen.context).textTheme.bodyLarge?.copyWith(
                                              color: Colors.red,
                                            ),
                                      ),
                                      onTap: () async {
                                        Get.back();

                                        await Get.dialog(DialogWidget(
                                          title: 'Remove ${unit.name}?',
                                          content: 'You are about to remove ${unit.name}. Please confirm.',
                                          onConfirm: () async => await controller.remove(unit.id!),
                                          confirmText: 'Remove',
                                        ));
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            backgroundColor: Colors.white,
                          );
                        },
                      ),
                  ],
                  bottom: TabBar(
                    controller: controller.tabController,
                    tabs: [
                      const Tab(
                        icon: Icon(Icons.list_alt_outlined),
                        iconMargin: EdgeInsets.all(4),
                        text: 'Tasks',
                      ),
                      const Tab(
                        icon: Icon(Icons.history_outlined),
                        iconMargin: EdgeInsets.all(4),
                        text: 'History',
                      ),
                      if (controller.tabController.length > 3)
                        const Tab(
                          icon: Icon(Icons.location_on),
                          iconMargin: EdgeInsets.all(4),
                          text: 'Levels',
                        ),
                      const Tab(
                        icon: Icon(Icons.people_alt_outlined),
                        iconMargin: EdgeInsets.all(4),
                        text: 'Users',
                      ),
                    ].sublist(0, controller.tabController.length),
                  ),
                ),
                body: TabBarView(
                  controller: controller.tabController,
                  children: [
                    TasksWidget(
                      unitId: controller.unitId,
                      type: 'todo',
                    ),
                    TasksWidget(
                      unitId: controller.unitId,
                      type: 'history',
                    ),
                    if (controller.tabController.length > 3)
                      UnitsWidget(
                        unitId: controller.unitId,
                        type: controller.unit.value!.type,
                      ),
                    RolesWidget(
                      unitId: controller.unitId,
                      showManage: false,
                      type: controller.unit.value!.type,
                    ),
                  ].sublist(0, controller.tabController.length),
                ),
              ),
      );
}
