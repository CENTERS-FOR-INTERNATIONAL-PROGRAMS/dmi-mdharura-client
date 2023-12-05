import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_dharura/constant/form.dart';
import 'package:m_dharura/constant/routes.dart';
import 'package:m_dharura/ui/_/responsive_widget.dart';
import 'package:m_dharura/ui/cebs/cebs_controller.dart';

class CebsWidget extends ResponsiveWidget<CebsController> {
  CebsWidget({Key? key}) : super(key: key);

  @override
  String get tag => 'cebs';

  @override
  bool get shouldAdjust => true;

  @override
  init() => Get.put(
        CebsController(),
        tag: tag,
      );

  @override
  Widget? tablet() => Scaffold(
        appBar: AppBar(
          title: const Text('CEBS'),
        ),
        body: ListView(
          children: [
            const SizedBox(
              height: 24,
            ),
            ListTile(
              title: Text(
                'CEBS Signal',
                style: Theme.of(screen.context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text('Report CEBS signal'),
              trailing: ElevatedButton(
                onPressed: () async => await Get.toNamed('${Routes.kForm}${FormType.kCEBS}/${FormType.kSignal}'),
                child: const Text('Report'),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            ListTile(
              title: Text(
                'CEBS Verification',
                style: Theme.of(screen.context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              subtitle: const Text('Fill CEBS verification form'),
              trailing: ElevatedButton(
                onPressed: () async => await Get.toNamed('${Routes.kForm}${FormType.kCEBS}/${FormType.kVerification}'),
                child: const Text('Start'),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            ListTile(
              title: Text(
                'CEBS Risk Assessment',
                style: Theme.of(screen.context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text('Fill CEBS risk assessment form'),
              trailing: ElevatedButton(
                onPressed: () async => await Get.toNamed('${Routes.kForm}${FormType.kCEBS}/${FormType.kInvestigation}'),
                child: const Text('Start'),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            ListTile(
              title: Text(
                'CEBS Response',
                style: Theme.of(screen.context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text('Fill CEBS response form'),
              trailing: ElevatedButton(
                onPressed: () async => await Get.toNamed('${Routes.kForm}${FormType.kCEBS}/${FormType.kResponse}'),
                child: const Text('Start'),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            ListTile(
              title: Text(
                'CEBS Escalation',
                style: Theme.of(screen.context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text('Fill CEBS escalation form'),
              trailing: ElevatedButton(
                onPressed: () async => await Get.toNamed('${Routes.kForm}${FormType.kCEBS}/${FormType.kEscalation}'),
                child: const Text('Start'),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            ListTile(
              title: Text(
                'CEBS Summary',
                style: Theme.of(screen.context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              subtitle: const Text('Fill CEBS summary form'),
              trailing: ElevatedButton(
                onPressed: () async => await Get.toNamed('${Routes.kForm}${FormType.kCEBS}/${FormType.kSummary}'),
                child: const Text('Start'),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            ListTile(
              title: Text(
                'CEBS Lab Results',
                style: Theme.of(screen.context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              subtitle: const Text('Fill CEBS Lab Results Form'),
              trailing: ElevatedButton(
                onPressed: () async => await Get.toNamed('${Routes.kForm}${FormType.kCEBS}/${FormType.kLab}'),
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
