import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_dharura/constant/routes.dart';
import 'package:m_dharura/constant/unit.dart';
import 'package:m_dharura/ui/_/custom_drop_down_widget.dart';
import 'package:m_dharura/ui/_/dialog_widget.dart';
import 'package:m_dharura/ui/_/item/role_item_widget.dart';
import 'package:m_dharura/ui/_/responsive_widget.dart';
import 'package:m_dharura/ui/roles/roles_controller.dart';

class RolesWidget extends ResponsiveWidget<RolesController> {
  final String? unitId, userId, type;
  final bool showManage;

  RolesWidget({
    Key? key,
    this.unitId,
    this.userId,
    this.showManage = true,
    this.type,
  }) : super(key: key);

  @override
  String get tag => 'roles: unitId:$unitId userId:$userId type:$type';

  @override
  RolesController get controller =>
      Get.put(RolesController(userId: userId, unitId: unitId),
          tag: tag, permanent: true);

  @override
  init() {
    if (controller.roles.isEmpty) controller.fetch(true);
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
              () => controller.isFetching.isTrue && controller.roles.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Column(
                      children: [
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
                                  style: Theme.of(screen.context)
                                      .textTheme
                                      .bodySmall,
                                ),
                              ),
                            ],
                          ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: controller.roles.length + 1,
                            itemBuilder: (context, index) => index == 0
                                ? Column(
                                    children: [
                                      if (controller.rolePage.value == null)
                                        const SizedBox(
                                          height: 16,
                                        ),
                                      Row(
                                        children: [
                                          if (spots(type).length > 1) ...[
                                            const SizedBox(
                                              width: 16,
                                            ),
                                            Expanded(
                                              child: CustomDropDownWidget(
                                                value: controller.spot.value,
                                                onChanged: (value) async {
                                                  controller.spot.value =
                                                      value!;

                                                  controller.fetch(true);
                                                },
                                                items: ['All', ...spots(type)],
                                                labelText: 'Role',
                                              ),
                                            ),
                                          ],
                                          const SizedBox(
                                            width: 16,
                                          ),
                                          Expanded(
                                            child: CustomDropDownWidget(
                                              value: controller.status.value,
                                              onChanged: (value) async {
                                                controller.status.value =
                                                    value!;

                                                controller.fetch(true);
                                              },
                                              items: const [
                                                'All',
                                                'Active',
                                                'Blocked'
                                              ],
                                              labelText: 'Status',
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
                                : RoleItemWidget(
                                    showManage: showManage,
                                    role: controller.roles[index - 1],
                                    onStatusChanged: (bool value) async =>
                                        await Get.dialog(
                                      DialogWidget(
                                        title:
                                            'Change ${controller.roles[index - 1].user.displayName}\'s status?',
                                        content:
                                            'You are about to change ${controller.roles[index - 1].user.displayName}\'s status to ${value ? 'active' : 'blocked'}. Please confirm.',
                                        onConfirm: () async =>
                                            await controller.updateStatus(
                                                controller.roles[index - 1].id!,
                                                value ? 'active' : 'blocked'),
                                        confirmText: 'Change',
                                      ),
                                    ),
                                    onRoleChanged: (String value) async =>
                                        await Get.dialog(
                                      DialogWidget(
                                        title:
                                            'Change ${controller.roles[index - 1].user.displayName}\'s role?',
                                        content:
                                            'You are about to change ${controller.roles[index - 1].user.displayName}\'s role to $value. Please confirm.',
                                        onConfirm: () async =>
                                            await controller.updateSpot(
                                                controller.roles[index - 1].id!,
                                                value),
                                        confirmText: 'Change',
                                      ),
                                    ),
                                    onRemove: () async => await Get.dialog(
                                      DialogWidget(
                                        title:
                                            'Remove ${controller.roles[index - 1].user.displayName}?',
                                        content:
                                            'You are about to remove ${controller.roles[index - 1].user.displayName} from ${controller.roles[index - 1].unit.name}. Please confirm.',
                                        onConfirm: () async =>
                                            await controller.remove(controller
                                                .roles[index - 1].id!),
                                        confirmText: 'Remove',
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
                  await Get.toNamed('${Routes.kUnit}$unitId${Routes.kAddUser}');
                  await controller.fetch(true);
                },
                child: const Icon(
                  Icons.person_add_alt,
                ),
              ),
      );
}
