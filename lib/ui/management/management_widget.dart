import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_dharura/ui/_/responsive_widget.dart';
import 'package:m_dharura/ui/management/management_controller.dart';
import 'package:m_dharura/ui/roles/roles_widget.dart';

class ManagementWidget extends ResponsiveWidget<ManagementController> {
  ManagementWidget({Key? key}) : super(key: key);

  @override
  String get tag => 'management';

  @override
  bool get shouldAdjust => true;

  @override
  init() => Get.put(
        ManagementController(),
        tag: tag,
      );

  @override
  Widget? tablet() => Scaffold(
        appBar: AppBar(
          title: const Text('Management'),
        ),
        body: Obx(
          () => controller.user.value == null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : RolesWidget(
                  userId: controller.user.value!.id,
                ),
        ),
      );
}
