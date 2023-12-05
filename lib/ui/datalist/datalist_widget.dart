import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_dharura/constant/data_list.dart';
import 'package:m_dharura/ui/_/message_widget.dart';
import 'package:m_dharura/ui/_/responsive_widget.dart';
import 'package:m_dharura/ui/datalist/datalist_controller.dart';
import 'package:m_dharura/ui/datalist/task/task_datalist_widget.dart';
import 'package:m_dharura/ui/datalist/user/user_datalist_widget.dart';

class DatalistWidget extends ResponsiveWidget<DatalistController> {
  final String type;
  final String unitId;

  DatalistWidget({
    Key? key,
    required this.type,
    required this.unitId,
  }) : super(key: key);

  @override
  String get tag => 'datalist: type: $type unitId: $unitId';

  @override
  bool get shouldAdjust => true;

  @override
  init() => Get.put(
        DatalistController(),
        tag: tag,
      );

  @override
  Widget? tablet() {
    switch (type) {
      case DatalistType.kTask:
        return TaskDatalistWidget(unitId: unitId);

      case DatalistType.kUser:
        return UserDatalistWidget(unitId: unitId);
    }

    return MessageWidget(
      title: 'Datalist not available',
      subtitle: 'Datalist not available',
      description: 'Update your app. If the problem persists contact your supervisor.',
      adjust: false,
    );
  }
}
