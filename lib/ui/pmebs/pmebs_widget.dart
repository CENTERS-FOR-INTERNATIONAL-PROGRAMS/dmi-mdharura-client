import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_dharura/constant/form.dart';
import 'package:m_dharura/constant/routes.dart';
import 'package:m_dharura/ui/_/responsive_widget.dart';
import 'package:m_dharura/ui/pmebs/pmebs_controller.dart';

class PmebsWidget extends ResponsiveWidget<PmebsController> {
  PmebsWidget({Key? key}) : super(key: key);

  @override
  String get tag => 'Pmebs';

  @override
  bool get shouldAdjust => true;

  @override
  init() => Get.put(
        PmebsController(),
        tag: tag,
      );

  @override
  Widget? tablet() => Scaffold(
        appBar: AppBar(
          title: const Text('PEBS and MEBS'),
        ),
        body: ListView(
          children: [
            const SizedBox(
              height: 24,
            ),
            ListTile(
              title: Text(
                'PEBS and MEBS Reporting',
                style: Theme.of(screen.context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text('Report PEBS and MEBS signal'),
              trailing: ElevatedButton(
                onPressed: () async => await Get.toNamed(
                    '${Routes.kForm}${FormType.kPMEBS}/${FormType.kSignal}'),
                child: const Text('Report'),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            ListTile(
              title: Text(
                'PEBS and MEBS Verification Request',
                style: Theme.of(screen.context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              subtitle:
                  const Text('Fill PEBS and MEBS verification request form'),
              trailing: ElevatedButton(
                onPressed: () async => await Get.toNamed(
                    '${Routes.kForm}${FormType.kPMEBS}/${FormType.kRequest}'),
                child: const Text('Start'),
              ),
            ),
          ],
        ),
      );
}
