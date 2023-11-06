import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_dharura/ui/_/responsive_widget.dart';
import 'package:m_dharura/ui/_/version/version_controller.dart';

class VersionWidget extends ResponsiveWidget<VersionController> {
  VersionWidget({Key? key}) : super(key: key);

  @override
  String get tag => 'version';

  @override
  VersionController get controller => Get.put(VersionController(), tag: tag);

  @override
  Widget? tablet() => Obx(
        () => controller.packageInfo.value == null
            ? Container()
            : Padding(
                padding: const EdgeInsets.all(32),
                child: Center(
                  child: Text(
                    'v${controller.packageInfo.value?.version} ${controller.packageInfo.value?.buildNumber}',
                  ),
                ),
              ),
      );
}
