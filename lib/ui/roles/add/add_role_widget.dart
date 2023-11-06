import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_dharura/constant/unit.dart';
import 'package:m_dharura/ui/_/custom_drop_down_widget.dart';
import 'package:m_dharura/ui/_/responsive_widget.dart';
import 'package:m_dharura/ui/roles/add/add_role_controller.dart';

class AddRoleWidget extends ResponsiveWidget<AddRoleController> {
  final String unitId;

  AddRoleWidget({Key? key, required this.unitId}) : super(key: key);

  @override
  String get tag => 'unit: $unitId';

  @override
  bool get shouldAdjust => true;

  @override
  init() => Get.put(
        AddRoleController(unitId: unitId),
        tag: tag,
      );

  @override
  Widget? tablet() => Scaffold(
        appBar: AppBar(
          title: const Text('Add a new user'),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            controller.fetch();
          },
          child: Obx(
            () => controller.isFetching.isTrue
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : controller.unit.value == null
                    ? ListView()
                    : Column(
                        children: [
                          Expanded(
                            child: ListView(
                              shrinkWrap: true,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(32),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                      Theme.of(screen.context)
                                                          .primaryColor),
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            const EdgeInsets.only(bottom: 16),
                                        child: Text(
                                          controller.unit.value!.type,
                                          style: Theme.of(screen.context)
                                              .textTheme
                                              .bodySmall,
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            const EdgeInsets.only(bottom: 16),
                                        child: Text(
                                            'Enter the name, phone number and role of user to add in ${controller.unit.value!.name} (${controller.unit.value!.type})'),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade200,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        padding: const EdgeInsets.only(
                                            right: 16, left: 16),
                                        margin:
                                            const EdgeInsets.only(bottom: 16),
                                        child: TextField(
                                          decoration: const InputDecoration(
                                            labelText: 'Enter name',
                                            border: InputBorder.none,
                                          ),
                                          textCapitalization:
                                              TextCapitalization.words,
                                          onChanged: (value) =>
                                              controller.name.value = value,
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.grey.shade200,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        padding: const EdgeInsets.only(
                                            right: 16, left: 16),
                                        margin:
                                            const EdgeInsets.only(bottom: 16),
                                        child: TextField(
                                          decoration: const InputDecoration(
                                            labelText: 'Enter phone number',
                                            border: InputBorder.none,
                                          ),
                                          keyboardType: TextInputType.number,
                                          onChanged: (value) => controller
                                              .phoneNumber.value = value,
                                        ),
                                      ),
                                      CustomDropDownWidget(
                                        value: controller.spot.value,
                                        onChanged: (value) {
                                          controller.spot.value = value;
                                        },
                                        items:
                                            spots(controller.unit.value!.type),
                                        labelText: 'Role',
                                      ),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: ElevatedButton(
                                              onPressed: () async {
                                                controller.verify();
                                              },
                                              child: controller
                                                          .isAdding.isTrue ||
                                                      controller
                                                          .isVerifying.isTrue
                                                  ? const CircularProgressIndicator(
                                                      strokeWidth: 2,
                                                      backgroundColor:
                                                          Colors.white,
                                                    )
                                                  : const Text('Add'),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
          ),
        ),
      );
}
