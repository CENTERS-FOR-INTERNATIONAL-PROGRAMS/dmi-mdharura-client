import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_dharura/constant/routes.dart';
import 'package:m_dharura/helper/session.dart';
import 'package:m_dharura/helper/util.dart';
import 'package:m_dharura/ui/_/item/menu_item_widget.dart';
import 'package:m_dharura/ui/_/responsive_widget.dart';
import 'package:m_dharura/ui/home/home_controller.dart';

class HomeWidget extends ResponsiveWidget<HomeController> {
  HomeWidget({Key? key}) : super(key: key);

  @override
  String get tag => 'home';

  @override
  bool get shouldAdjust => true;

  @override
  HomeController get controller => Get.put(
        HomeController(),
        tag: tag,
        permanent: true,
      );

  @override
  init() {
    controller.fetch();
  }

  @override
  Widget? tablet() => Scaffold(
        appBar: AppBar(
          title: Obx(() => Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (controller.user.value == null) ...[
                    const Text('Hello!'),
                    Text(
                      'You are working offline',
                      style: Theme.of(screen.context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ],
                  if (controller.user.value != null) ...[
                    Text('Hello! ${controller.user.value!.displayName}'),
                    Text(
                      Util.formatPhoneNumber(
                          controller.user.value!.phoneNumber),
                      style: Theme.of(screen.context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ]
                ],
              )),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () async {
                await Get.toNamed(Routes.kSettings);
              },
            ),
            const SizedBox(
              width: 16,
            ),
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            await controller.fetch();
          },
          child: Obx(
            () => ListView(
              children: [
                const SizedBox(
                  height: 18,
                ),
                if (controller.user.value == null) ...[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(
                        color: Colors.grey.shade300,
                      ),
                    ),
                    margin: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ListTile(
                      onTap: () async => await Session.logout(),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      title: Text(
                        'Please note!',
                        style: Theme.of(screen.context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      subtitle: const Text(
                          'PEBS and MEBS, History and Management options are unavailable while working offline'),
                      trailing: ElevatedButton(
                        onPressed: () async => await Session.logout(),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black),
                        ),
                        child: const Text('Go online'),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
                if (controller.pendings.isNotEmpty) ...[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(
                        color: Colors.red.shade300,
                      ),
                    ),
                    margin: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ListTile(
                      onTap: () async => await Get.toNamed(Routes.kPending),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      title: Text(
                        'Saved forms',
                        style: Theme.of(screen.context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      subtitle: const Text('View, edit and submit saved forms'),
                      trailing: ElevatedButton(
                        onPressed: () async =>
                            await Get.toNamed(Routes.kPending),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red),
                        ),
                        child: const Text('View'),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
                if (controller.appSettings.value.tasks &&
                    controller.user.value != null) ...[
                  const MenuItemWidget(
                    route: Routes.kMyTasks,
                    title: 'My Tasks',
                    subtitle: 'View and submit forms that require your action',
                    icon: Icon(
                      Icons.fact_check,
                      color: Colors.lightGreen,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
                if (controller.appSettings.value.cebs) ...[
                  const MenuItemWidget(
                    route: Routes.kCEBS,
                    title: 'CEBS',
                    subtitle: 'Report CEBS signals and submit CEBS forms',
                    icon: Icon(
                      Icons.people_alt,
                      color: Colors.lightGreen,
                    ),
                    isForm: true,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
                if (controller.appSettings.value.hebs) ...[
                  const MenuItemWidget(
                    route: Routes.kHEBS,
                    title: 'HEBS',
                    subtitle: 'Report HEBS signals and submit HEBS forms',
                    icon: Icon(
                      Icons.local_hospital,
                      color: Colors.lightGreen,
                    ),
                    isForm: true,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
                if (controller.appSettings.value.vebs) ...[
                  const MenuItemWidget(
                    route: Routes.kVEBS,
                    title: 'VEBS',
                    subtitle: 'Report VEBS signals and submit VEBS forms',
                    icon: Icon(
                      Icons.pets_outlined,
                      color: Colors.lightGreen,
                    ),
                    isForm: true,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
                if (controller.appSettings.value.lebs) ...[
                  const MenuItemWidget(
                    route: Routes.kLEBS,
                    title: 'LEBS',
                    subtitle: 'Report LEBS signals and submit LEBS forms',
                    icon: Icon(
                      Icons.school,
                      color: Colors.lightGreen,
                    ),
                    isForm: true,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
                if (controller.appSettings.value.pebs &&
                    controller.user.value != null) ...[
                  const MenuItemWidget(
                    route: Routes.kPMEBS,
                    title: 'PEBS and MEBS',
                    subtitle:
                        'Report PEBS/MEBS signals and submit PEBS/MEBS forms',
                    icon: Icon(
                      Icons.call,
                      color: Colors.lightGreen,
                    ),
                    isForm: true,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
                if (controller.appSettings.value.history &&
                    controller.user.value != null) ...[
                  MenuItemWidget(
                    route: '${Routes.kHistory}${controller.user.value!.id}',
                    title: 'History',
                    subtitle:
                        'View history of your activity including signals reported and forms submitted',
                    icon: const Icon(
                      Icons.history,
                      color: Colors.lightGreen,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
                if (controller.appSettings.value.management &&
                    controller.user.value != null) ...[
                  const MenuItemWidget(
                    route: Routes.kManagement,
                    title: 'Management',
                    subtitle:
                        'View and manage your roles and people you supervise',
                    icon: Icon(
                      Icons.supervisor_account,
                      color: Colors.lightGreen,
                    ),
                  )
                ],
                const SizedBox(
                  height: 18,
                ),
              ],
            ),
          ),
        ),
      );
}
