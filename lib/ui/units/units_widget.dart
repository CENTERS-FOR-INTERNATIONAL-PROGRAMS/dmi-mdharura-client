import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_dharura/constant/routes.dart';
import 'package:m_dharura/constant/unit.dart';
import 'package:m_dharura/ui/_/custom_drop_down_widget.dart';
import 'package:m_dharura/ui/_/dialog_widget.dart';
import 'package:m_dharura/ui/_/item/unit_item_widget.dart';
import 'package:m_dharura/ui/_/responsive_widget.dart';
import 'package:m_dharura/ui/units/units_controller.dart';

class UnitsWidget extends ResponsiveWidget<UnitsController> {
  final String? unitId;
  final String type;

  UnitsWidget({Key? key, required this.unitId, required this.type})
      : super(key: key);

  @override
  String get tag => 'units: unitId:$unitId type:$type';

  @override
  UnitsController get controller =>
      Get.put(UnitsController(unitId: unitId), tag: tag, permanent: true);

  @override
  init() {
    if (controller.units.isEmpty) controller.fetch(true);
  }

  @override
  Widget? tablet() => Scaffold(
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
            child: Obx(
              () => controller.isFetching.isTrue && controller.units.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Column(
                      children: [
                        if (controller.unitPage.value != null)
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
                                  '${controller.isFetching.isTrue ? 'Loading more... ' : ''}You are viewing ${controller.unitPage.value!.currentTotal} of ${controller.unitPage.value!.total}',
                                  style: Theme.of(screen.context)
                                      .textTheme
                                      .bodySmall,
                                ),
                              ),
                            ],
                          ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: controller.units.length + 1,
                            itemBuilder: (context, index) => index == 0
                                ? Column(
                                    children: [
                                      if (controller.unitPage.value == null)
                                        const SizedBox(
                                          height: 16,
                                        ),
                                      Row(
                                        children: [
                                          if (subTypes(type).length > 1) ...[
                                            const SizedBox(
                                              width: 16,
                                            ),
                                            Expanded(
                                              child: CustomDropDownWidget(
                                                value: controller.type.value,
                                                onChanged: (value) async {
                                                  controller.type.value =
                                                      value!;

                                                  controller.fetch(true);
                                                },
                                                items: [
                                                  'All',
                                                  ...subTypes(type)
                                                ],
                                                labelText: 'Level',
                                              ),
                                            ),
                                          ],
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
                                : UnitItemWidget(
                                    unit: controller.units[index - 1],
                                    onRemove: () async => await Get.dialog(
                                      DialogWidget(
                                        title:
                                            'Remove ${controller.units[index - 1].name}?',
                                        content:
                                            'You are about to remove ${controller.units[index - 1].name}. Please confirm.',
                                        onConfirm: () async =>
                                            await controller.remove(controller
                                                .units[index - 1].id!),
                                        confirmText: 'Remove',
                                      ),
                                    ),
                                    onStateChanged: (bool value) async =>
                                        await Get.dialog(
                                      DialogWidget(
                                        title:
                                            'Change ${controller.units[index - 1].name}\'s state?',
                                        content:
                                            'You are about to change ${controller.units[index - 1].name}\'s state to ${value ? 'live' : 'test'}. Please confirm.',
                                        onConfirm: () async =>
                                            await controller.updateState(
                                                controller.units[index - 1].id!,
                                                value ? 'live' : 'test'),
                                        confirmText: 'Change',
                                      ),
                                    ),
                                  ),
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ),
        floatingActionButton: unitId == null
            ? null
            : FloatingActionButton(
                onPressed: () async {
                  await Get.toNamed('${Routes.kUnit}$unitId${Routes.kAddUnit}');
                  await controller.fetch(true);
                },
                child: const Icon(
                  Icons.add_location_alt_outlined,
                ),
              ),
      );
}
