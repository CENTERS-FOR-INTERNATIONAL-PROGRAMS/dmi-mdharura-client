import 'package:get/get.dart';
import 'package:m_dharura/constant/routes.dart';
import 'package:m_dharura/ui/_/message_widget.dart';
import 'package:m_dharura/ui/_/test_widget.dart';
import 'package:m_dharura/ui/auth/auth_widget.dart';
import 'package:m_dharura/ui/auth/verify_widget.dart';
import 'package:m_dharura/ui/cebs/cebs_widget.dart';
import 'package:m_dharura/ui/dashboard/dashboard_widget.dart';
import 'package:m_dharura/ui/form/form_widget.dart';
import 'package:m_dharura/ui/hebs/hebs_widget.dart';
import 'package:m_dharura/ui/history/history_widget.dart';
import 'package:m_dharura/ui/home/home_widget.dart';
import 'package:m_dharura/ui/lebs/lebs_widget.dart';
import 'package:m_dharura/ui/management/management_widget.dart';
import 'package:m_dharura/ui/my_tasks/my_tasks_widget.dart';
import 'package:m_dharura/ui/pending/pending_widget.dart';
import 'package:m_dharura/ui/pmebs/pmebs_widget.dart';
import 'package:m_dharura/ui/roles/add/add_role_widget.dart';
import 'package:m_dharura/ui/settings/settings_widget.dart';
import 'package:m_dharura/ui/splash/splash_widget.dart';
import 'package:m_dharura/ui/task/task_widget.dart';
import 'package:m_dharura/ui/unit/add/add_unit_widget.dart';
import 'package:m_dharura/ui/unit/unit_widget.dart';
import 'package:m_dharura/ui/vebs/vebs_widget.dart';

final kRoutes = [
  GetPage(
    name: Routes.kSettings,
    page: () => SettingsWidget(),
  ),
  GetPage(
    name: Routes.kUnitSuccess,
    page: () => MessageWidget(
      title: 'Level Added',
      subtitle: 'Level added successfully',
      description: 'You have added a new unit successfully.',
    ),
  ),
  GetPage(
    name: Routes.kUserSuccess,
    page: () => MessageWidget(
      title: 'User Added',
      subtitle: 'User added successfully',
      description: 'You have added a new user successfully.',
    ),
  ),
  GetPage(
    name: '${Routes.kUnit}:unitId',
    page: () => UnitWidget(
      unitId: Get.parameters['unitId']!,
    ),
    children: [
      GetPage(
        name: Routes.kAddUser,
        page: () => AddRoleWidget(
          unitId: Get.parameters['unitId']!,
        ),
      ),
      GetPage(
        name: Routes.kAddUnit,
        page: () => AddUnitWidget(
          unitId: Get.parameters['unitId']!,
        ),
      ),
    ],
  ),
  GetPage(
    name: Routes.kFormSuccess,
    page: () => MessageWidget(
      title: 'Form Sent',
      subtitle: 'Form sent successfully',
      description:
          'You have sent a new form successfully. The task is completed and escalated to your supervisors for follow up.',
    ),
  ),
  GetPage(
    name: '${Routes.kForm}:type/:subtype',
    page: () => FormWidget(
      type: Get.parameters['type']!,
      subtype: Get.parameters['subtype']!,
      signalId: Get.arguments == null ? null : Get.arguments['signalId'],
    ),
  ),
  GetPage(
    name: Routes.kManagement,
    page: () {
      return ManagementWidget();
    },
  ),
  GetPage(
    name: '${Routes.kHistory}:userId',
    page: () => HistoryWidget(
      userId: Get.parameters['userId']!,
    ),
  ),
  GetPage(
    name: '${Routes.kDashboard}:unitId',
    page: () => DashboardWidget(
      unitId: Get.parameters['unitId']!,
    ),
  ),
  GetPage(
    name: Routes.kMyTasks,
    page: () => MyTasksWidget(),
  ),
  GetPage(
    name: Routes.kLEBS,
    page: () => LebsWidget(),
  ),
  GetPage(
    name: Routes.kHEBS,
    page: () => HebsWidget(),
  ),
  GetPage(
    name: Routes.kCEBS,
    page: () => CebsWidget(),
  ),
  GetPage(
    name: Routes.kVEBS,
    page: () => VebsWidget(),
  ),
  GetPage(
    name: Routes.kPMEBS,
    page: () => PmebsWidget(),
  ),
  GetPage(
    name: Routes.kPending,
    page: () => PendingWidget(),
  ),
  GetPage(
    name: Routes.kHome,
    page: () => HomeWidget(),
  ),
  GetPage(
    name: Routes.kAuth,
    page: () => AuthWidget(),
    children: [
      GetPage(
        name: '${Routes.kVerify}:token/:phoneNumber',
        page: () => VerifyWidget(
          token: Get.parameters['token']!,
          phoneNumber: Get.parameters['phoneNumber']!,
        ),
      ),
    ],
  ),
  GetPage(
    name: Routes.kSplash,
    page: () => SplashWidget(),
  ),
  GetPage(
    name: Routes.kTest,
    page: () => const TestWidget(),
  ),
  GetPage(
    name: '${Routes.kTask}:taskId',
    page: () => TaskWidget(
      taskId: Get.parameters['taskId']!,
    ),
  ),
];
