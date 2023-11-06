import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_dharura/ui/_/responsive_widget.dart';
import 'package:m_dharura/ui/splash/splash_controller.dart';

class SplashWidget extends ResponsiveWidget<SplashController> {
  SplashWidget({Key? key}) : super(key: key);

  @override
  String get tag => 'splash';

  @override
  bool get shouldAdjust => true;

  @override
  init() => Get.put(
        SplashController(),
        tag: tag,
      );

  @override
  Widget? tablet() => const Scaffold();
}
