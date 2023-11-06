import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_dharura/constant/env.dart';
import 'package:m_dharura/ui/_/responsive_widget.dart';
import 'package:m_dharura/ui/_/version/version_widget.dart';
import 'package:m_dharura/ui/auth/verify_controller.dart';

class VerifyWidget extends ResponsiveWidget<VerifyController> {
  final String token, phoneNumber;

  VerifyWidget({Key? key, required this.token, required this.phoneNumber})
      : super(key: key);

  @override
  String get tag => 'verify';

  @override
  bool get shouldAdjust => true;

  @override
  VerifyController get controller => Get.put(
        VerifyController(
          token: token,
          phoneNumber: phoneNumber,
        ),
        tag: tag,
      );

  @override
  Widget? tablet() => Scaffold(
        appBar: AppBar(
          title: const Text('Verify'),
        ),
        body: ListView(
          children: [
            Container(
              margin: const EdgeInsets.only(
                bottom: 8,
                top: 64,
                left: 32,
                right: 32,
              ),
              child: Text(
                kAppName,
                style:
                    Theme.of(screen.context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(screen.context).primaryColor,
                        ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                bottom: 16,
                left: 32,
                right: 32,
              ),
              child: Text('Enter the SMS Code sent to $phoneNumber'),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(5),
              ),
              padding: const EdgeInsets.only(
                right: 16,
                left: 16,
              ),
              margin: const EdgeInsets.only(
                bottom: 16,
                left: 32,
                right: 32,
              ),
              child: TextField(
                decoration: const InputDecoration(
                  labelText: 'SMS Code',
                  border: InputBorder.none,
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) => controller.smsCode = value,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 32,
                left: 32,
              ),
              child: ElevatedButton(
                onPressed: () async {
                  await controller.verify();
                },
                child: Obx(
                  () => controller.isVerifying.isTrue
                      ? const CircularProgressIndicator(
                          backgroundColor: Colors.white,
                          strokeWidth: 2.0,
                        )
                      : const Text('Verify'),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 16,
                right: 32,
                left: 32,
                bottom: 16,
              ),
              child: TextButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text('Resend code'),
              ),
            ),
            VersionWidget(),
          ],
        ),
      );
}
