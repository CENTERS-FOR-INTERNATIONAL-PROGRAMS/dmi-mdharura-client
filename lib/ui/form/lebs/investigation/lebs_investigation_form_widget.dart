import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_dharura/ui/_/date_widget.dart';
import 'package:m_dharura/ui/_/input_widget.dart';
import 'package:m_dharura/ui/_/select_widget.dart';
import 'package:m_dharura/ui/form/lebs/investigation/lebs_investigation_form_controller.dart';

class LebsInvestigationFormWidget extends StatelessWidget {
  final String? signalId;

  const LebsInvestigationFormWidget({Key? key, required this.signalId})
      : super(key: key);

  @override
  Widget build(BuildContext context) => GetX<LebsInvestigationFormController>(
        init: LebsInvestigationFormController(signalId: signalId),
        builder: (controller) => WillPopScope(
          onWillPop: () async {
            await controller.previous();
            return false;
          },
          child: Scaffold(
            appBar: AppBar(
              title: const Text('LEBS Risk Assessment Form'),
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
                                  (val) =>
                                      val?.dateInvestigationStarted = value),
                              position: controller.pages.last,
                              question:
                                  'When did the investigation begin/start?',
                              value: controller
                                  .form.value.dateInvestigationStarted,
                              total: controller.total,
                              hintText: 'Select date',
                            ),
                            SelectWidget(
                              question:
                                  'What are the signs and symptoms that are being reported?',
                              position: controller.pages.last,
                              total: controller.total,
                              values: controller.form.value.symptoms ?? [],
                              options: const [
                                'Cough',
                                'Fever/hotness of the body',
                                'Difficulty in breathing',
                                'Sore throat',
                                'Loss of sense of smell/taste',
                                'Body weakness',
                                'Other',
                              ],
                              onChanged: (String value) =>
                                  controller.form.update((val) {
                                val?.symptoms ??= [];

                                if (val!.symptoms!.contains(value)) {
                                  val.symptoms!.remove(value);
                                } else {
                                  val.symptoms!.add(value);
                                }
                              }),
                            ),
                            InputWidget(
                              question: 'Other symptoms. Specify.',
                              hintText: 'Type...',
                              position: controller.pages.last,
                              total: controller.total,
                              value: controller.form.value.symptomsOther,
                              onChanged: (String value) =>
                                  controller.form.value.symptomsOther = value,
                            ),
                            SelectWidget(
                              question:
                                  'Does the event meet the COVID-19 working case definition?',
                              position: controller.pages.last,
                              total: controller.total,
                              values: controller.form.value
                                          .isCovid19WorkingCaseDefinitionMet ==
                                      null
                                  ? []
                                  : [
                                      controller.form.value
                                          .isCovid19WorkingCaseDefinitionMet!
                                    ],
                              options: const [
                                'Yes',
                                'No',
                              ],
                              onChanged: (String value) => controller.form
                                  .update((val) =>
                                      val?.isCovid19WorkingCaseDefinitionMet =
                                          value),
                            ),
                            SelectWidget(
                              question:
                                  'Have samples been taken for confirmation?',
                              position: controller.pages.last,
                              total: controller.total,
                              values: controller
                                          .form.value.isSamplesCollected ==
                                      null
                                  ? []
                                  : [controller.form.value.isSamplesCollected!],
                              options: const [
                                'Yes',
                                'No',
                              ],
                              onChanged: (String value) => controller.form
                                  .update(
                                      (val) => val?.isSamplesCollected = value),
                            ),
                            SelectWidget(
                              question: 'What are the results?',
                              position: controller.pages.last,
                              total: controller.total,
                              values: controller.form.value.labResults == null
                                  ? []
                                  : [controller.form.value.labResults!],
                              options: const [
                                'Positive',
                                'Negative',
                                'Pending',
                              ],
                              onChanged: (String value) => controller.form
                                  .update((val) => val?.labResults = value),
                            ),
                            SelectWidget(
                              question:
                                  'Does the event setting promote spread?',
                              position: controller.pages.last,
                              total: controller.total,
                              values: controller.form.value
                                          .isEventSettingPromotingSpread ==
                                      null
                                  ? []
                                  : [
                                      controller.form.value
                                          .isEventSettingPromotingSpread!
                                    ],
                              options: const [
                                'Yes',
                                'No',
                              ],
                              onChanged: (String value) => controller.form
                                  .update((val) => val
                                      ?.isEventSettingPromotingSpread = value),
                            ),
                            SelectWidget(
                              question:
                                  'What is the status of the following COVID-19 pandemic prevention measures in the institution?\na. Hand hygiene',
                              position: controller.pages.last,
                              total: controller.total,
                              values: controller
                                          .form.value.measureHandHygiene ==
                                      null
                                  ? []
                                  : [controller.form.value.measureHandHygiene!],
                              options: const [
                                'Present',
                                'Absent',
                              ],
                              onChanged: (String value) => controller.form
                                  .update(
                                      (val) => val?.measureHandHygiene = value),
                            ),
                            SelectWidget(
                              question:
                                  'What is the status of the following COVID-19 pandemic prevention measures in the institution?\nb. Temperature screening',
                              position: controller.pages.last,
                              total: controller.total,
                              values:
                                  controller.form.value.measureTempScreening ==
                                          null
                                      ? []
                                      : [
                                          controller
                                              .form.value.measureTempScreening!
                                        ],
                              options: const [
                                'Present',
                                'Absent',
                              ],
                              onChanged: (String value) => controller.form
                                  .update((val) =>
                                      val?.measureTempScreening = value),
                            ),
                            SelectWidget(
                              question:
                                  'What is the status of the following COVID-19 pandemic prevention measures in the institution?\nc. Physical distancing',
                              position: controller.pages.last,
                              total: controller.total,
                              values: controller.form.value
                                          .measurePhysicalDistancing ==
                                      null
                                  ? []
                                  : [
                                      controller
                                          .form.value.measurePhysicalDistancing!
                                    ],
                              options: const [
                                'Present',
                                'Absent',
                              ],
                              onChanged: (String value) => controller.form
                                  .update((val) =>
                                      val?.measurePhysicalDistancing = value),
                            ),
                            SelectWidget(
                              question:
                                  'What is the status of the following COVID-19 pandemic prevention measures in the institution?\nd. Social distancing',
                              position: controller.pages.last,
                              total: controller.total,
                              values: controller
                                          .form.value.measureSocialDistancing ==
                                      null
                                  ? []
                                  : [
                                      controller
                                          .form.value.measureSocialDistancing!
                                    ],
                              options: const [
                                'Present',
                                'Absent',
                              ],
                              onChanged: (String value) => controller.form
                                  .update((val) =>
                                      val?.measureSocialDistancing = value),
                            ),
                            SelectWidget(
                              question:
                                  'What is the status of the following COVID-19 pandemic prevention measures in the institution?\ne. Use of masks',
                              position: controller.pages.last,
                              total: controller.total,
                              values: controller.form.value.measureUseOfMasks ==
                                      null
                                  ? []
                                  : [controller.form.value.measureUseOfMasks!],
                              options: const [
                                'Present',
                                'Absent',
                              ],
                              onChanged: (String value) => controller.form
                                  .update(
                                      (val) => val?.measureUseOfMasks = value),
                            ),
                            SelectWidget(
                              question:
                                  'What is the status of the following COVID-19 pandemic prevention measures in the institution?\nf. Ventilation',
                              position: controller.pages.last,
                              total: controller.total,
                              values: controller
                                          .form.value.measureVentilation ==
                                      null
                                  ? []
                                  : [controller.form.value.measureVentilation!],
                              options: const [
                                'Present',
                                'Absent',
                              ],
                              onChanged: (String value) => controller.form
                                  .update(
                                      (val) => val?.measureVentilation = value),
                            ),
                            InputWidget(
                              question:
                                  'Please provide any additional information on the event',
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
                                  'How would you categorize the risk of the event?\n(Consider diagnosis, setting and measures)',
                              position: controller.pages.last,
                              total: controller.total,
                              values: controller
                                          .form.value.riskClassification ==
                                      null
                                  ? []
                                  : [controller.form.value.riskClassification!],
                              options: const [
                                'Very High Risk',
                                'High Risk',
                                'Moderate Risk',
                                'Low Risk',
                              ],
                              onChanged: (String value) => controller.form
                                  .update(
                                      (val) => val?.riskClassification = value),
                            ),
                            SelectWidget(
                              question:
                                  'What are the recommended response activities?\n(Select all that apply)',
                              position: controller.pages.last,
                              total: controller.total,
                              values:
                                  controller.form.value.responseActivities ??
                                      [],
                              options: const [
                                'Escalate response to county level',
                                'Deploy Sub County RRT',
                                'Advanced investigation',
                                'Enhanced surveillance',
                                'Monitor',
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
