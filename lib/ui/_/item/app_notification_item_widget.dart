import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_dharura/constant/routes.dart';
import 'package:m_dharura/helper/util.dart';
import 'package:m_dharura/model/app_notification.dart';

class AppNotificationItemWidget extends StatelessWidget {
  final AppNotification appNotification;

  const AppNotificationItemWidget({
    Key? key,
    required this.appNotification,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          border: Border.all(
            color: Colors.grey.shade200,
          ),
          color: appNotification.status != 'read'
              ? Colors.grey.shade50
              : Colors.white,
        ),
        child: Column(
          children: [
            ListTile(
              title: Text(
                appNotification.message,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: appNotification.status == 'read'
                          ? FontWeight.normal
                          : FontWeight.bold,
                    ),
              ),
              subtitle: Text(
                Util.formatDate(appNotification.createdAt, withTime: true),
                style: Theme.of(context).textTheme.bodySmall,
              ),
              onTap: () {
                switch (appNotification.type) {}
              },
            ),
            ListTile(
              title: Text(
                appNotification.user.displayName,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              subtitle: Text(
                'Recipient · ${Util.formatPhoneNumber(appNotification.user.phoneNumber)}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              onTap: () async => await Get.toNamed(
                  '${Routes.kHistory}${appNotification.user.id}'),
            ),
            ListTile(
              title: Text(
                appNotification.unit.name,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              subtitle: Text(
                '${appNotification.unit.state.capitalize} · ${appNotification.unit.type}${appNotification.unit.type == 'Health facility' ? ' · MFL ${appNotification.unit.code}' : ''}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              onTap: () async => await Get.toNamed(
                  '${Routes.kUnit}${appNotification.unit.id}'),
            ),
          ],
        ),
      );
}
