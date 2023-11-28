import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_dharura/constant/form.dart';
import 'package:m_dharura/constant/routes.dart';
import 'package:m_dharura/ui/_/responsive_widget.dart';
import 'package:m_dharura/ui/hebs/hebs_controller.dart';

class HebsWidget extends ResponsiveWidget<HebsController> {
  HebsWidget({Key? key}) : super(key: key);

  @override
  String get tag => 'hebs';

  @override
  bool get shouldAdjust => true;

  @override
  init() => Get.put(
        HebsController(),
        tag: tag,
      );

  @override
  Widget? tablet() => Scaffold(
        appBar: AppBar(
          title: const Text('HEBS'),
        ),
        body: ListView(
          children: [
            const SizedBox(
              height: 24,
            ),
            ListTile(
              title: Text(
                'HEBS Signal',
                style: Theme.of(screen.context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text('Report HEBS signal'),
              trailing: ElevatedButton(
                onPressed: () async => await Get.toNamed('${Routes.kForm}${FormType.kHEBS}/${FormType.kSignal}'),
                child: const Text('Report'),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            ListTile(
              title: Text(
                'HEBS Verification',
                style: Theme.of(screen.context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              subtitle: const Text('Fill HEBS verification form'),
              trailing: ElevatedButton(
                onPressed: () async => await Get.toNamed('${Routes.kForm}${FormType.kHEBS}/${FormType.kVerification}'),
                child: const Text('Start'),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            ListTile(
              title: Text(
                'HEBS Risk Assessment',
                style: Theme.of(screen.context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text('Fill HEBS risk assessment form'),
              trailing: ElevatedButton(
                onPressed: () async => await Get.toNamed('${Routes.kForm}${FormType.kHEBS}/${FormType.kInvestigation}'),
                child: const Text('Start'),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            ListTile(
              title: Text(
                'HEBS Response',
                style: Theme.of(screen.context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text('Fill HEBS response form'),
              trailing: ElevatedButton(
                onPressed: () async => await Get.toNamed('${Routes.kForm}${FormType.kHEBS}/${FormType.kResponse}'),
                child: const Text('Start'),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            ListTile(
              title: Text(
                'HEBS Escalation',
                style: Theme.of(screen.context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text('Fill HEBS escalation form'),
              trailing: ElevatedButton(
                onPressed: () async => await Get.toNamed('${Routes.kForm}${FormType.kHEBS}/${FormType.kEscalation}'),
                child: const Text('Start'),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            ListTile(
              title: Text(
                'HEBS Summary',
                style: Theme.of(screen.context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              subtitle: const Text('Fill HEBS summary form'),
              trailing: ElevatedButton(
                onPressed: () async => await Get.toNamed('${Routes.kForm}${FormType.kHEBS}/${FormType.kSummary}'),
                child: const Text('Start'),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
          ],
        ),
      );
}
