import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_dharura/constant/form.dart';
import 'package:m_dharura/constant/routes.dart';
import 'package:m_dharura/ui/_/responsive_widget.dart';
import 'package:m_dharura/ui/vebs/vebs_controller.dart';

class VebsWidget extends ResponsiveWidget<VebsController> {
  VebsWidget({Key? key}) : super(key: key);

  @override
  String get tag => 'vebs';

  @override
  bool get shouldAdjust => true;

  @override
  init() => Get.put(
        VebsController(),
        tag: tag,
      );

  @override
  Widget? tablet() => Scaffold(
        appBar: AppBar(
          title: const Text('VEBS'),
        ),
        body: ListView(
          children: [
            const SizedBox(
              height: 24,
            ),
            ListTile(
              title: Text(
                'VEBS Signal',
                style: Theme.of(screen.context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text('Report VEBS signal'),
              trailing: ElevatedButton(
                onPressed: () async => await Get.toNamed('${Routes.kForm}${FormType.kVEBS}/${FormType.kSignal}'),
                child: const Text('Report'),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            ListTile(
              title: Text(
                'VEBS Verification',
                style: Theme.of(screen.context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              subtitle: const Text('Fill VEBS verification form'),
              trailing: ElevatedButton(
                onPressed: () async => await Get.toNamed('${Routes.kForm}${FormType.kVEBS}/${FormType.kVerification}'),
                child: const Text('Start'),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            ListTile(
              title: Text(
                'VEBS Risk Assessment',
                style: Theme.of(screen.context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text('Fill VEBS risk assessment form'),
              trailing: ElevatedButton(
                onPressed: () async => await Get.toNamed('${Routes.kForm}${FormType.kVEBS}/${FormType.kInvestigation}'),
                child: const Text('Start'),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            ListTile(
              title: Text(
                'VEBS Response',
                style: Theme.of(screen.context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text('Fill VEBS response form'),
              trailing: ElevatedButton(
                onPressed: () async => await Get.toNamed('${Routes.kForm}${FormType.kVEBS}/${FormType.kResponse}'),
                child: const Text('Start'),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            ListTile(
              title: Text(
                'VEBS Escalation',
                style: Theme.of(screen.context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text('Fill VEBS escalation form'),
              trailing: ElevatedButton(
                onPressed: () async => await Get.toNamed('${Routes.kForm}${FormType.kVEBS}/${FormType.kEscalation}'),
                child: const Text('Start'),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            ListTile(
              title: Text(
                'VEBS Summary',
                style: Theme.of(screen.context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              subtitle: const Text('Fill VEBS summary form'),
              trailing: ElevatedButton(
                onPressed: () async => await Get.toNamed('${Routes.kForm}${FormType.kVEBS}/${FormType.kSummary}'),
                child: const Text('Start'),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            ListTile(
              title: Text(
                'VEBS Lab',
                style: Theme.of(screen.context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              subtitle: const Text('Fill VEBS lab form'),
              trailing: ElevatedButton(
                onPressed: () async => await Get.toNamed('${Routes.kForm}${FormType.kVEBS}/${FormType.kLab}'),
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
