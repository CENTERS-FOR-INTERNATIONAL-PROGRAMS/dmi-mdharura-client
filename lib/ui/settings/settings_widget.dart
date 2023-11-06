import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_dharura/constant/env.dart';
import 'package:m_dharura/helper/session.dart';
import 'package:m_dharura/helper/util.dart';
import 'package:m_dharura/ui/_/dialog_widget.dart';
import 'package:m_dharura/ui/_/divider_widget.dart';
import 'package:m_dharura/ui/_/responsive_widget.dart';
import 'package:m_dharura/ui/_/version/version_widget.dart';
import 'package:m_dharura/ui/settings/settings_controller.dart';

class SettingsWidget extends ResponsiveWidget<SettingsController> {
  SettingsWidget({Key? key}) : super(key: key);

  @override
  String get tag => 'settings';

  @override
  bool get shouldAdjust => true;

  @override
  SettingsController get controller => Get.put(
        SettingsController(),
        tag: tag,
        permanent: true,
      );

  @override
  init() {
    controller.fetch();
  }

  @override
  Widget? tablet() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Obx(
        () => ListView(
          children: [
            ListTile(
              title: Text(
                'Preferences',
                style: Theme.of(screen.context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              subtitle: const Text('Show and hide menus'),
            ),
            const DividerWidget(),
            SwitchListTile(
              value: controller.appSettings.value.cebs,
              onChanged: (value) {
                controller.updateAppSettings(0, value);
              },
              title: Text(
                'CEBS',
                style: Theme.of(screen.context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              subtitle: Text(
                  '${controller.appSettings.value.cebs ? 'Show' : 'Hide'} CEBS Forms'),
            ),
            SwitchListTile(
              value: controller.appSettings.value.hebs,
              onChanged: (value) {
                controller.updateAppSettings(1, value);
              },
              title: Text(
                'HEBS',
                style: Theme.of(screen.context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              subtitle: Text(
                  '${controller.appSettings.value.hebs ? 'Show' : 'Hide'} HEBS Forms'),
            ),
            SwitchListTile(
              value: controller.appSettings.value.vebs,
              onChanged: (value) {
                controller.updateAppSettings(2, value);
              },
              title: Text(
                'VEBS',
                style: Theme.of(screen.context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              subtitle: Text(
                  '${controller.appSettings.value.vebs ? 'Show' : 'Hide'} VEBS Forms'),
            ),
            SwitchListTile(
              value: controller.appSettings.value.lebs,
              onChanged: (value) {
                controller.updateAppSettings(3, value);
              },
              title: Text(
                'LEBS',
                style: Theme.of(screen.context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              subtitle: Text(
                  '${controller.appSettings.value.lebs ? 'Show' : 'Hide'} LEBS Forms'),
            ),
            SwitchListTile(
              value: controller.appSettings.value.pebs,
              onChanged: (value) {
                controller.updateAppSettings(4, value);
              },
              title: Text(
                'PEBS and MEBS',
                style: Theme.of(screen.context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              subtitle: Text(
                  '${controller.appSettings.value.pebs ? 'Show' : 'Hide'} PEBS and MEBS Forms'),
            ),
            SwitchListTile(
              value: controller.appSettings.value.tasks,
              onChanged: (value) {
                controller.updateAppSettings(5, value);
              },
              title: Text(
                'My Tasks',
                style: Theme.of(screen.context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              subtitle: Text(
                  '${controller.appSettings.value.tasks ? 'Show' : 'Hide'} My Tasks'),
            ),
            SwitchListTile(
              value: controller.appSettings.value.history,
              onChanged: (value) {
                controller.updateAppSettings(6, value);
              },
              title: Text(
                'History',
                style: Theme.of(screen.context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              subtitle: Text(
                  '${controller.appSettings.value.history ? 'Show' : 'Hide'} History'),
            ),
            SwitchListTile(
              value: controller.appSettings.value.management,
              onChanged: (value) {
                controller.updateAppSettings(7, value);
              },
              title: Text(
                'Management',
                style: Theme.of(screen.context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              subtitle: Text(
                  '${controller.appSettings.value.management ? 'Show' : 'Hide'} Management'),
            ),
            const DividerWidget(),
            ListTile(
              title: Text(
                'Update $kAppName',
                style: Theme.of(screen.context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              subtitle: const Text('Check for updates'),
              trailing: ElevatedButton(
                onPressed: () async {
                  try {
                    await Util.url(
                        'https://play.google.com/store/apps/details?id=ke.go.health.mdharura');
                  } catch (e) {
                    Util.toast('Something went wrong. Try again');
                  }
                },
                child: const Text('Check'),
              ),
            ),
            const DividerWidget(),
            ListTile(
              title: Text(
                'Log out',
                style: Theme.of(screen.context).textTheme.bodyLarge,
              ),
              onTap: () async => await Get.dialog(
                DialogWidget(
                  title: 'Log out?',
                  content: 'You are about to log out. Please confirm.',
                  onConfirm: () async => await Session.logout(),
                ),
              ),
            ),
            const SizedBox(
              height: 24.0,
            ),
            VersionWidget(),
          ],
        ),
      ),
    );
  }
}
