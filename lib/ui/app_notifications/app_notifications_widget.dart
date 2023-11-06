import 'package:m_dharura/helper/util.dart';
import 'package:m_dharura/ui/_/item/app_notification_item_widget.dart';
import 'package:m_dharura/ui/_/responsive_widget.dart';
import 'package:m_dharura/ui/app_notifications/app_notifications_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppNotificationsWidget
    extends ResponsiveWidget<AppNotificationsController> {
  final String userId;
  final String unitId;

  AppNotificationsWidget({
    Key? key,
    required this.userId,
    required this.unitId,
  }) : super(key: key);

  @override
  bool get shouldAdjust => true;

  @override
  String get tag => 'app-notifications $userId $unitId';

  @override
  AppNotificationsController get controller => Get.put(
        AppNotificationsController(
          userId: userId,
          unitId: unitId,
        ),
        tag: tag,
        permanent: true,
      );

  @override
  Widget? tablet() => Obx(
        () => Scaffold(
          appBar: AppBar(
            title: Text(
              controller.user.value == null && controller.unit.value == null
                  ? 'Notifications'
                  : controller.user.value != null
                      ? controller.user.value!.displayName
                      : controller.unit.value!.name,
            ),
            actions: [
              if (controller.user.value != null)
                IconButton(
                  icon: const Icon(Icons.call),
                  onPressed: () async =>
                      await Util.call(controller.user.value!.phoneNumber),
                )
            ],
          ),
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
              child: controller.isFetching.isTrue &&
                      controller.appNotifications.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Column(
                      children: [
                        if (controller.appNotificationPage.value != null)
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
                                  '${controller.isFetching.isTrue ? 'Loading more... ' : ''}You are viewing ${controller.appNotificationPage.value!.currentTotal} of ${controller.appNotificationPage.value!.total}',
                                  style: Theme.of(screen.context)
                                      .textTheme
                                      .bodySmall,
                                ),
                              ),
                            ],
                          ),
                        Expanded(
                          child: ListView.builder(
                            itemBuilder: (context, index) => index == 0
                                ? Column(
                                    children: [
                                      if (controller
                                              .appNotificationPage.value ==
                                          null)
                                        const SizedBox(
                                          height: 16,
                                        ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                    ],
                                  )
                                : AppNotificationItemWidget(
                                    appNotification:
                                        controller.appNotifications[index - 1],
                                  ),
                            itemCount: controller.appNotifications.length + 1,
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ),
      );
}
