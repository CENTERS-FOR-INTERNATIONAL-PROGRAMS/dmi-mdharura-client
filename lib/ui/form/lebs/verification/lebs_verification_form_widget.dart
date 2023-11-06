import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_dharura/constant/signal.dart';
import 'package:m_dharura/ui/_/date_widget.dart';
import 'package:m_dharura/ui/_/input_widget.dart';
import 'package:m_dharura/ui/_/select_widget.dart';

import 'lebs_verification_form_controller.dart';

class LebsVerificationFormWidget extends StatelessWidget {
  final String? signalId;

  const LebsVerificationFormWidget({Key? key, this.signalId}) : super(key: key);

  @override
  Widget build(BuildContext context) => GetX<LebsVerificationFormController>(
        init: LebsVerificationFormController(signalId: signalId),
        builder: (controller) => WillPopScope(
          onWillPop: () async {
            await controller.previous();
            return false;
          },
          child: Scaffold(
            appBar: AppBar(
              title: const Text('LEBS Verification Form'),
              actions: controller.pages.last == 0
                  ? []
                  : [
                      TextButton(
                        child: const Text(
                          'Save',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () async => await controller.save(),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                    ],
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                          ),
                          child: [
                            InputWidget(
                              question: 'Signal ID',
                              hintText: 'Type...',
                              position: controller.pages.last,
                              total: controller.total,
                              value: controller.signal.value,
                              onChanged: (value) =>
                                  controller.signal.value = value,
                              lines: 1,
                              textCapitalization: TextCapitalization.characters,
                            ),
                            InputWidget(
                              question:
                                  'Provide brief description of signal (What happened/Is happening?)',
                              hintText: 'Type...',
                              position: controller.pages.last,
                              total: controller.total,
                              value: controller.form.value.description,
                              onChanged: (value) =>
                                  controller.form.value.description = value,
                            ),
                            SelectWidget(
                              question:
                                  'Does the information match one of the pre-defined signals?',
                              position: controller.pages.last,
                              total: controller.total,
                              values: controller.form.value.isMatchingSignal ==
                                      null
                                  ? []
                                  : [controller.form.value.isMatchingSignal!],
                              options: const [
                                'Yes',
                                'No',
                              ],
                              onChanged: (String value) => controller.form
                                  .update(
                                      (val) => val?.isMatchingSignal = value),
                            ),
                            SelectWidget(
                              question:
                                  'What was the final code of the LEBS signal?',
                              position: controller.pages.last,
                              total: controller.total,
                              values:
                                  controller.form.value.updatedSignal == null
                                      ? []
                                      : [
                                          lebsSignals
                                              .firstWhere((element) =>
                                                  element.code ==
                                                  controller
                                                      .form.value.updatedSignal)
                                              .description
                                        ],
                              options: lebsSignals
                                  .map((e) => e.description)
                                  .toList(),
                              labels: lebsSignals.map((e) => e.code).toList(),
                              onChanged: (String value) =>
                                  controller.form.update(
                                (val) => val?.updatedSignal = lebsSignals
                                    .firstWhere((element) =>
                                        element.description == value)
                                    .code,
                              ),
                            ),
                            DateWidget(
                              question: 'When did the health threat start?',
                              hintText: 'Select date',
                              position: controller.pages.last,
                              total: controller.total,
                              value:
                                  controller.form.value.dateHealthThreatStarted,
                              onChanged: (value) => controller.form.update(
                                  (val) =>
                                      val?.dateHealthThreatStarted = value),
                            ),
                            SelectWidget(
                              question:
                                  'From whom did the school LEBS focal point get this information?',
                              position: controller.pages.last,
                              total: controller.total,
                              values: controller.form.value.informant == null
                                  ? []
                                  : [controller.form.value.informant!],
                              options: const [
                                'Staff/learner',
                                'Guardian/parent',
                                'Health worker',
                                'Other',
                              ],
                              onChanged: (String value) => controller.form
                                  .update((val) => val?.informant = value),
                            ),
                            InputWidget(
                              question:
                                  'Specify from who did the school focal point get this information',
                              hintText: 'Type...',
                              position: controller.pages.last,
                              total: controller.total,
                              value: controller.form.value.otherInformant,
                              onChanged: (value) =>
                                  controller.form.value.otherInformant = value,
                            ),
                            InputWidget(
                              question:
                                  'Please, provide any additional information about the signal',
                              hintText: 'Type...',
                              position: controller.pages.last,
                              total: controller.total,
                              value:
                                  controller.form.value.additionalInformation,
                              onChanged: (value) => controller
                                  .form.value.additionalInformation = value,
                            ),
                            SelectWidget(
                              question:
                                  'Is the reported signal still happening?',
                              position: controller.pages.last,
                              total: controller.total,
                              values: controller.form.value.isStillHappening ==
                                      null
                                  ? []
                                  : [controller.form.value.isStillHappening!],
                              options: const [
                                'Yes',
                                'No',
                              ],
                              onChanged: (String value) => controller.form
                                  .update(
                                      (val) => val?.isStillHappening = value),
                            ),
                            DateWidget(
                              onChanged: (value) => controller.form
                                  .update((val) => val?.dateVerified = value),
                              position: controller.pages.last,
                              question: 'Date when signal was verified?',
                              value: controller.form.value.dateVerified,
                              total: controller.total,
                              hintText: 'Select date',
                            ),
                            const Padding(
                              padding: EdgeInsets.all(16),
                              child: Center(
                                child: Text(
                                  'This form is ready to be submitted',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ][controller.pages.last]),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 32,
                    horizontal: 16,
                  ),
                  child: Row(
                    children: [
                      controller.pages.last == 0
                          ? Container()
                          : Expanded(
                              child: OutlinedButton(
                                child: const Text(
                                  'Previous',
                                ),
                                onPressed: () async =>
                                    await controller.previous(),
                              ),
                            ),
                      controller.pages.last == 0
                          ? Container()
                          : const SizedBox(
                              width: 16,
                            ),
                      Expanded(
                        child: ElevatedButton(
                          child: controller.isAdding.isTrue
                              ? const CircularProgressIndicator(
                                  backgroundColor: Colors.white,
                                  strokeWidth: 2,
                                )
                              : Text(
                                  controller.pages.last < controller.total - 1
                                      ? 'Next'
                                      : 'Submit'),
                          onPressed: () {
                            controller.next();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
