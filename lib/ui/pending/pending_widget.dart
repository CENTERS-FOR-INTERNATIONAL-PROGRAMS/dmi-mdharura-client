import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_dharura/ui/_/dialog_widget.dart';
import 'package:m_dharura/ui/_/item/pending_item_widget.dart';
import 'package:m_dharura/ui/_/responsive_widget.dart';
import 'package:m_dharura/ui/pending/pending_controller.dart';

class PendingWidget extends ResponsiveWidget<PendingController> {
  PendingWidget({Key? key}) : super(key: key);

  @override
  String get tag => 'pending';

  @override
  bool get shouldAdjust => true;

  @override
  PendingController get controller => Get.put(
        PendingController(),
        tag: tag,
        permanent: true,
      );

  @override
  init() {
    controller.fetch();
  }

  @override
  Widget? tablet() => Obx(
        () => Scaffold(
          appBar: AppBar(
            title: Text('Saved forms (${controller.pendings.length})'),
          ),
          body: RefreshIndicator(
            onRefresh: () async {
              await controller.fetch();
            },
            child: ListView.builder(
              itemCount: controller.pendings.length,
              itemBuilder: (context, index) => PendingItemWidget(
                pending: controller.pendings[index],
                onDelete: () async {
                  await Get.dialog(
                    DialogWidget(
                      title:
                          'Delete pending form ${controller.pendings[index].signalId}?',
                      content:
                          'You are about to delete ${controller.pendings[index].type.toUpperCase()} ${controller.pendings[index].subType.capitalize} pending form ${controller.pendings[index].signalId}. Please confirm',
                      onConfirm: () async => await controller.delete(index),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      );
}
