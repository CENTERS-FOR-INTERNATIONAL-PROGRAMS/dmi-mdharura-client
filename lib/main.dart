import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:m_dharura/constant/notification.dart';
import 'package:m_dharura/constant/routes.dart';
import 'package:m_dharura/constant/theme.dart';
import 'package:m_dharura/db/db.dart';
import 'package:m_dharura/route/route.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();

//   if (kDebugMode) {
//     print('Firebase message received: ${message.messageId}');
//   }
// }

// Future<void> _firebaseMessagingTokenHandler(String token) async {
//   await Firebase.initializeApp();

//   if (kDebugMode) {
//     print('Firebase token refreshed: $token');
//   }

//   await Get.put(SystemApi()).ping();
// }

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();

    HttpOverrides.global = MyHttpOverrides();

    await dotenv.load();

    await initializeDateFormatting();

    await Db.init();

    if (GetPlatform.isAndroid) {
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()!
          .createNotificationChannel(kAndroidNotificationChannel);
    }
  } catch (e) {
    if (kDebugMode) {
      print('$e');
    }
  }

  runApp(
    GetMaterialApp(
      initialRoute: Routes.kSplash,
      getPages: kRoutes,
      theme: kAppTheme,
      debugShowCheckedModeBanner: false,
      onInit: () async {
        // try {
        //   await FirebaseMessaging.instance.requestPermission();
        // } catch (e) {
        //   if (kDebugMode) {
        //     print(e);
        //   }
        // }

        // FirebaseMessaging.onMessage.listen((message) async {
        //   if (kDebugMode) {
        //     print('Firebase message received: ${message.messageId}');
        //   }

        //   RemoteNotification? remoteNotification = message.notification;

        //   if (remoteNotification != null) {
        //     Util.toast(
        //         '${remoteNotification.title}\n${remoteNotification.body}');
        //   }

        //   try {
        //     await Get.find<HomeController>(tag: 'home').fetch();
        //   } catch (e) {
        //     if (kDebugMode) {
        //       print(e);
        //     }
        //   }
        // });
      },
    ),
  );
}
