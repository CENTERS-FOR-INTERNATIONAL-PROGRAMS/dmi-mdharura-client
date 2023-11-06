import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_dharura/constant/unit.dart';
import 'package:m_dharura/ui/_/custom_drop_down_widget.dart';
import 'package:m_dharura/ui/_/dialog_widget.dart';
import 'package:m_dharura/ui/_/responsive_widget.dart';
import 'package:m_dharura/ui/unit/add/add_unit_controller.dart';

class AddUnitWidget extends ResponsiveWidget<AddUnitController> {
  final String unitId;

  AddUnitWidget({Key? key, required this.unitId}) : super(key: key);

  @override
  String get tag => 'unit: $unitId';

  @override
  bool get shouldAdjust => true;

  @override
  init() => Get.put(
        AddUnitController(unitId: unitId),
        tag: tag,
      );

  @override
  Widget? tablet() => Scaffold(
        appBar: AppBar(
          title: const Text('Add a new level'),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            controller.fetch();
          },
          child: Obx(
            () => controller.unit.value == null
                ? ListView()
                : Container(
                    padding: const EdgeInsets.all(32),
                    child: ListView(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 64),
                          child: Text(
                            controller.unit.value!.name,
                            style: Theme.of(screen.context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color:
                                        Theme.of(screen.context).primaryColor),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 16),
                          child: Text(
                            controller.unit.value!.type,
                            style: Theme.of(screen.context).textTheme.bodySmall,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 16),
                          child: Text(
                              'Enter the name and type of unit to add in ${controller.unit.value!.name} (${controller.unit.value!.type})'),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(5)),
                          padding: const EdgeInsets.only(right: 16, left: 16),
                          margin: const EdgeInsets.only(bottom: 16),
                          child: TextField(
                            decoration: const InputDecoration(
                              labelText: 'Enter name',
                              border: InputBorder.none,
                            ),
                            onChanged: (value) => controller.name.value = value,
                            textCapitalization: TextCapitalization.words,
                          ),
                        ),
                        CustomDropDownWidget(
                          value: controller.type.value,
                          onChanged: (value) {
                            controller.type.value = value;
                          },
                          items: subTypes(controller.unit.value!.type),
                          labelText: 'Type',
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  if (controller.check()) {
                                    Get.dialog(
                                      DialogWidget(
                                        title: 'Add Level?',
                                        content:
                                            'You are about to add a new ${controller.type.value} in ${controller.unit.value!.name} (${controller.unit.value!.type}). Please confirm.',
                                        onConfirm: () {
                                          controller.add();
                                        },
                                      ),
                                    );
                                  }
                                },
                                child: controller.isAdding.isTrue
                                    ? const CircularProgressIndicator(
                                        backgroundColor: Colors.white,
                                        strokeWidth: 2,
                                      )
                                    : const Text('Add'),
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
}
