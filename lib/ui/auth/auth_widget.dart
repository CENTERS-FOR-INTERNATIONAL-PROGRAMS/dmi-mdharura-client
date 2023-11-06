import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_dharura/constant/asset.dart';
import 'package:m_dharura/constant/env.dart';
import 'package:m_dharura/constant/routes.dart';
import 'package:m_dharura/ui/_/responsive_widget.dart';
import 'package:m_dharura/ui/_/version/version_widget.dart';
import 'package:m_dharura/ui/auth/auth_controller.dart';

class AuthWidget extends ResponsiveWidget<AuthController> {
  AuthWidget({Key? key}) : super(key: key);

  @override
  String get tag => 'auth';

  @override
  bool get shouldAdjust => true;

  @override
  AuthController get controller => Get.put(
        AuthController(),
        tag: tag,
      );

  @override
  Widget? tablet() => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
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
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image.asset(
                    Assets.imageLogo,
                    width: 72,
                    height: 72,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 8,
              ),
              child: Text(
                kAppName,
                textAlign: TextAlign.center,
                style:
                    Theme.of(screen.context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 32,
              ),
              child: Text(
                'An integrated event-based surveillance system',
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 16,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 2,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 16, left: 16),
                    child: const Text('LOGIN'),
                  ),
                  Expanded(
                    child: Container(
                      height: 2,
                      decoration: BoxDecoration(color: Colors.grey.shade200),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 16,
              ),
              child: Text('Enter your phone number (eg. 0700123456)'),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(5),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              margin: const EdgeInsets.symmetric(
                horizontal: 32,
              ),
              child: TextField(
                decoration: const InputDecoration(
                  labelText: 'Phone number',
                  border: InputBorder.none,
                ),
                keyboardType: TextInputType.phone,
                onChanged: (value) => controller.phoneNumber = value,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 32,
                right: 32,
                top: 16,
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
                      : const Text('Continue'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 32,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 2,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 16, left: 16),
                    child: const Text('OR'),
                  ),
                  Expanded(
                    child: Container(
                      height: 2,
                      decoration: BoxDecoration(color: Colors.grey.shade200),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 32,
                left: 32,
                right: 32,
              ),
              child: OutlinedButton(
                onPressed: () async {
                  await Get.offAllNamed(Routes.kHome);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                ),
                child: const Text(
                  'Work offline',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            VersionWidget(),
          ],
        ),
      );
}
