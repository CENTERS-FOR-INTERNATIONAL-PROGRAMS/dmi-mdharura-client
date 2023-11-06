import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_dharura/ui/_/date_widget.dart';
import 'package:m_dharura/ui/_/input_widget.dart';
import 'package:m_dharura/ui/_/select_widget.dart';

import 'response_form_controller.dart';

class ResponseFormWidget extends StatelessWidget {
  final String? signalId;
  final String type;

  const ResponseFormWidget({Key? key, required this.type, this.signalId})
      : super(key: key);

  @override
  Widget build(BuildContext context) => GetX<ResponseFormController>(
        init: ResponseFormController(type: type, signalId: signalId),
        builder: (controller) => WillPopScope(
          onWillPop: () async {
            await controller.previous();
            return false;
          },
          child: Scaffold(
            appBar: AppBar(
              title: Text('${type.toUpperCase()} Response Form'),
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
                                  'Type of the event (disease, condition, hazard)',
                              hintText: 'Type...',
                              position: controller.pages.last,
                              total: controller.total,
                              value: controller.form.value.eventType,
                              onChanged: (value) => controller.form
                                  .update((val) => val?.eventType = value),
                            ),
                            DateWidget(
                              onChanged: (value) => controller.form.update(
                                  (val) => val?.dateSCMOHInformed = value),
                              position: controller.pages.last,
                              question: 'Date when was the SCMOH informed',
                              value: controller.form.value.dateSCMOHInformed,
                              total: controller.total,
                              hintText: 'Select date',
                            ),
                            DateWidget(
                              onChanged: (value) => controller.form.update(
                                  (val) => val?.dateResponseStarted = value),
                              position: controller.pages.last,
                              question:
                                  'Date when public health action started',
                              value: controller.form.value.dateResponseStarted,
                              total: controller.total,
                              hintText: 'Select date',
                            ),
                            SelectWidget(
                              question:
                                  'What public health responses were undertaken?',
                              position: controller.pages.last,
                              total: controller.total,
                              values:
                                  controller.form.value.responseActivities ??
                                      [],
                              options: const [
                                'None',
                                'Close monitoring',
                                'Strengthened surveillance',
                                'Further investigation',
                                'Prevention and control measures',
                                'Risk communication and community engagement',
                                'Case management',
                                'Other'
                              ],
                              onChanged: (String value) =>
                                  controller.form.update((val) {
                                val?.responseActivities ??= [];

                                if (val!.responseActivities!.contains(value)) {
                                  val.responseActivities!.remove(value);
                                } else {
                                  val.responseActivities!.add(value);
                                }

                                if (value == 'None') {
                                  val.responseActivities!.clear();
                                  val.responseActivities!.add('None');
                                } else if (val.responseActivities!
                                    .contains('None')) {
                                  val.responseActivities!.remove('None');
                                }
                              }),
                            ),
                            InputWidget(
                              question:
                                  'Please specify other public health response undertaken',
                              hintText: 'Type...',
                              position: controller.pages.last,
                              total: controller.total,
                              value:
                                  controller.form.value.otherResponseActivity,
                              onChanged: (value) => controller.form.update(
                                  (val) => val?.otherResponseActivity = value),
                            ),
                            SelectWidget(
                              question:
                                  'What is the outcome of the public health action?',
                              position: controller.pages.last,
                              total: controller.total,
                              values: controller.form.value.outcomeOfResponse ==
                                      null
                                  ? []
                                  : [controller.form.value.outcomeOfResponse!],
                              options: const [
                                'Event resolved',
                                'Response on going',
                              ],
                              onChanged: (String value) => controller.form
                                  .update(
                                      (val) => val?.outcomeOfResponse = value),
                            ),
                            SelectWidget(
                              question:
                                  'Recommendations for the public health action',
                              position: controller.pages.last,
                              total: controller.total,
                              values:
                                  controller.form.value.recommendations ?? [],
                              options: const [
                                'Maintain response',
                                'Escalate to higher level',
                              ],
                              onChanged: (String value) =>
                                  controller.form.update((val) {
                                val?.recommendations ??= [];

                                if (val!.recommendations!.contains(value)) {
                                  val.recommendations!.remove(value);
                                } else {
                                  val.recommendations!.add(value);
                                }
                              }),
                            ),
                            DateWidget(
                              onChanged: (value) => controller.form
                                  .update((val) => val?.dateEscalated = value),
                              position: controller.pages.last,
                              question:
                                  'Date of escalation of public health response',
                              value: controller.form.value.dateEscalated,
                              total: controller.total,
                              hintText: 'Select date',
                            ),
                            DateWidget(
                              onChanged: (value) => controller.form
                                  .update((val) => val?.dateOfReport = value),
                              position: controller.pages.last,
                              question: 'Date of public health response report',
                              value: controller.form.value.dateOfReport,
                              total: controller.total,
                              hintText: 'Select date',
                            ),
                            InputWidget(
                              question:
                                  'Please, provide any additional information about the signal',
                              hintText: 'Type...',
                              position: controller.pages.last,
                              total: controller.total,
                              value:
                                  controller.form.value.additionalInformation,
                              onChanged: (value) => controller.form.update(
                                  (val) => val?.additionalInformation = value),
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
                      if (controller.pages.last == 0)
                        Container()
                      else
                        const SizedBox(
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
