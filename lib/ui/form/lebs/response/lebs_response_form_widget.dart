import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_dharura/ui/_/date_widget.dart';
import 'package:m_dharura/ui/_/input_widget.dart';
import 'package:m_dharura/ui/_/select_widget.dart';

import 'lebs_response_form_controller.dart';

class LebsResponseFormWidget extends StatelessWidget {
  final String? signalId;

  const LebsResponseFormWidget({Key? key, this.signalId}) : super(key: key);

  @override
  Widget build(BuildContext context) => GetX<LebsResponseFormController>(
        init: LebsResponseFormController(signalId: signalId),
        builder: (controller) => WillPopScope(
          onWillPop: () async {
            await controller.previous();
            return false;
          },
          child: Scaffold(
            appBar: AppBar(
              title: const Text('LEBS Response Form'),
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
                            DateWidget(
                              onChanged: (value) => controller.form.update(
                                  (val) => val?.dateSCMOHInformed = value),
                              position: controller.pages.last,
                              question: 'When was the SCMOH informed?',
                              value: controller.form.value.dateSCMOHInformed,
                              total: controller.total,
                              hintText: 'Select date',
                            ),
                            DateWidget(
                              onChanged: (value) => controller.form.update(
                                  (val) => val?.dateResponseStarted = value),
                              position: controller.pages.last,
                              question:
                                  'When did the public health response begin/start? ',
                              value: controller.form.value.dateResponseStarted,
                              total: controller.total,
                              hintText: 'Select date',
                            ),
                            InputWidget(
                              question:
                                  'Number of people presenting with signs and symptoms',
                              hintText: 'Type...',
                              position: controller.pages.last,
                              total: controller.total,
                              value:
                                  controller.form.value.humansCases.toString(),
                              onChanged: (value) =>
                                  controller.form.value.humansCases = value,
                              inputType: InputType.kInt,
                            ),
                            SelectWidget(
                              question:
                                  'What public health response(s) were undertaken?',
                              position: controller.pages.last,
                              total: controller.total,
                              values:
                                  controller.form.value.responseActivities ??
                                      [],
                              options: const [
                                'Evacuations',
                                'Quarantine',
                                'Isolation',
                                'Case management',
                                'Contact tracing',
                                'Infection prevention and control measures',
                                'Risk communication',
                                'Further investigation',
                                'Enhanced surveillance',
                                'Monitoring',
                              ],
                              onChanged: (String value) =>
                                  controller.form.update((val) {
                                val?.responseActivities ??= [];

                                if (val!.responseActivities!.contains(value)) {
                                  val.responseActivities!.remove(value);
                                } else {
                                  val.responseActivities!.add(value);
                                }
                              }),
                            ),
                            InputWidget(
                              question: 'Number of people quarantined',
                              hintText: 'Type...',
                              position: controller.pages.last,
                              total: controller.total,
                              value: controller.form.value.humansQuarantined
                                  .toString(),
                              onChanged: (value) => controller
                                  .form.value.humansQuarantined = value,
                              inputType: InputType.kInt,
                            ),
                            SelectWidget(
                              question: 'Type of quarantine',
                              position: controller.pages.last,
                              total: controller.total,
                              values:
                                  controller.form.value.quarantineTypes ?? [],
                              options: const [
                                'Self-quarantine',
                                'School quarantine',
                                'Institutional quarantine',
                              ],
                              onChanged: (String value) =>
                                  controller.form.update((val) {
                                val?.quarantineTypes ??= [];

                                if (val!.quarantineTypes!.contains(value)) {
                                  val.quarantineTypes!.remove(value);
                                } else {
                                  val.quarantineTypes!.add(value);
                                }
                              }),
                            ),
                            SelectWidget(
                              question:
                                  'Are those in quarantine being followed up?',
                              position: controller.pages.last,
                              total: controller.total,
                              values: controller.form.value
                                          .isHumansQuarantinedFollowedUp ==
                                      null
                                  ? []
                                  : [
                                      controller.form.value
                                          .isHumansQuarantinedFollowedUp!
                                    ],
                              options: const [
                                'Yes',
                                'No',
                              ],
                              onChanged: (String value) => controller.form
                                  .update((val) => val
                                      ?.isHumansQuarantinedFollowedUp = value),
                            ),
                            SelectWidget(
                              question: 'Are there people isolated?',
                              position: controller.pages.last,
                              total: controller.total,
                              values: controller.form.value.isHumansIsolated ==
                                      null
                                  ? []
                                  : [controller.form.value.isHumansIsolated!],
                              options: const [
                                'Yes',
                                'No',
                              ],
                              onChanged: (String value) => controller.form
                                  .update(
                                      (val) => val?.isHumansIsolated = value),
                            ),
                            SelectWidget(
                              question: 'What type of isolation?',
                              position: controller.pages.last,
                              total: controller.total,
                              values:
                                  controller.form.value.isolationTypes ?? [],
                              options: const [
                                'School isolation',
                                'Health facility isolation',
                                'Home based isolation',
                                'Institutional isolation',
                              ],
                              onChanged: (String value) =>
                                  controller.form.update((val) {
                                val?.isolationTypes ??= [];

                                if (val!.isolationTypes!.contains(value)) {
                                  val.isolationTypes!.remove(value);
                                } else {
                                  val.isolationTypes!.add(value);
                                }
                              }),
                            ),
                            InputWidget(
                              question: 'Number of people reported dead',
                              hintText: 'Type...',
                              position: controller.pages.last,
                              total: controller.total,
                              value:
                                  controller.form.value.humansDead.toString(),
                              onChanged: (value) =>
                                  controller.form.value.humansDead = value,
                              inputType: InputType.kInt,
                            ),
                            SelectWidget(
                              question: 'What is the status of the event?',
                              position: controller.pages.last,
                              total: controller.total,
                              values: controller.form.value.eventStatuses ?? [],
                              options: const [
                                'Resolved',
                                'Response on going',
                                'Escalated to higher levels',
                              ],
                              onChanged: (String value) =>
                                  controller.form.update((val) {
                                val?.eventStatuses ??= [];

                                if (val!.eventStatuses!.contains(value)) {
                                  val.eventStatuses!.remove(value);
                                } else {
                                  val.eventStatuses!.add(value);
                                }
                              }),
                            ),
                            InputWidget(
                              question:
                                  'Please provide any additional information on the response activities',
                              hintText: 'Type...',
                              position: controller.pages.last,
                              total: controller.total,
                              value:
                                  controller.form.value.additionalInformation,
                              onChanged: (value) => controller
                                  .form.value.additionalInformation = value,
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
