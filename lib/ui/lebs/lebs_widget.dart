import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_dharura/constant/form.dart';
import 'package:m_dharura/constant/routes.dart';
import 'package:m_dharura/ui/_/responsive_widget.dart';
import 'package:m_dharura/ui/lebs/lebs_controller.dart';

class LebsWidget extends ResponsiveWidget<LebsController> {
  LebsWidget({Key? key}) : super(key: key);

  @override
  String get tag => 'lebs';

  @override
  bool get shouldAdjust => true;

  @override
  init() => Get.put(
        LebsController(),
        tag: tag,
      );

  @override
  Widget? tablet() => Scaffold(
        appBar: AppBar(
          title: const Text('LEBS'),
        ),
        body: ListView(
          children: [
            const SizedBox(
              height: 24,
            ),
            ListTile(
              title: Text(
                'LEBS Signal',
                style: Theme.of(screen.context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text('Report LEBS signal'),
              trailing: ElevatedButton(
                onPressed: () async => await Get.toNamed(
                    '${Routes.kForm}${FormType.kLEBS}/${FormType.kSignal}'),
                child: const Text('Report'),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            ListTile(
              title: Text(
                'LEBS Verification',
                style: Theme.of(screen.context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              subtitle: const Text('Fill LEBS verification form'),
              trailing: ElevatedButton(
                onPressed: () async => await Get.toNamed(
                    '${Routes.kForm}${FormType.kLEBS}/${FormType.kVerification}'),
                child: const Text('Start'),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            ListTile(
              title: Text(
                'LEBS Risk Assessment',
                style: Theme.of(screen.context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text('Fill LEBS risk assessment form'),
              trailing: ElevatedButton(
                onPressed: () async => await Get.toNamed(
                    '${Routes.kForm}${FormType.kLEBS}/${FormType.kInvestigation}'),
                child: const Text('Start'),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            ListTile(
              title: Text(
                'LEBS Response',
                style: Theme.of(screen.context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text('Fill LEBS response form'),
              trailing: ElevatedButton(
                onPressed: () async => await Get.toNamed(
                    '${Routes.kForm}${FormType.kLEBS}/${FormType.kResponse}'),
                child: const Text('Start'),
              ),
            ),
            /*
            SizedBox(
              height: 8,
            ),
            ListTile(
              title: Text(
                'LEBS Escalation',
                style: Theme.of(screen.context).textTheme.bodyText1.copyWith(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('Fill LEBS escalation form'),
              trailing: ElevatedButton(
                onPressed: () async => await Get.toNamed(
                    '${Routes.FORM}${FormType.LEBS}/${FormType.ESCALATION}'),
                child: Text('Start'),
              ),
            ),*/
            const SizedBox(
              height: 24,
            ),
          ],
        ),
      );
}
