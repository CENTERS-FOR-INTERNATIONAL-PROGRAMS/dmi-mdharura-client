import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_dharura/ui/_/date_widget.dart';
import 'package:m_dharura/ui/_/input_widget.dart';
import 'package:m_dharura/ui/_/select_widget.dart';
import 'package:m_dharura/ui/form/_/investigation/investigation_form_controller.dart';

class InvestigationFormWidget extends StatelessWidget {
  final String? signalId;
  final String type;

  const InvestigationFormWidget({Key? key, required this.type, this.signalId})
      : super(key: key);

  @override
  Widget build(BuildContext context) => GetX<InvestigationFormController>(
        init: InvestigationFormController(type: type, signalId: signalId),
        builder: (controller) => WillPopScope(
          onWillPop: () async {
            await controller.previous();
            return false;
          },
          child: Scaffold(
            appBar: AppBar(
              title: Text('${type.toUpperCase()} Risk Assessment Form'),
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
                                  (val) => val?.dateSCDSCInformed = value),
                              position: controller.pages.last,
                              question: 'When was the SCDSC/SCVO informed?',
                              value: controller.form.value.dateSCDSCInformed,
                              total: controller.total,
                              hintText: 'Select date',
                            ),
                            DateWidget(
                              onChanged: (value) => controller.form.update(
                                  (val) =>
                                      val?.dateInvestigationStarted = value),
                              position: controller.pages.last,
                              question:
                                  'When did the initial risk assessment begin/start?',
                              value: controller
                                  .form.value.dateInvestigationStarted,
                              total: controller.total,
                              hintText: 'Select date',
                            ),
                            DateWidget(
                              onChanged: (value) => controller.form.update(
                                  (val) => val?.dateEventStarted = value),
                              position: controller.pages.last,
                              question: 'When did the event start?',
                              value: controller.form.value.dateEventStarted,
                              total: controller.total,
                              hintText: 'Select date',
                            ),
                            InputWidget(
                              question:
                                  'Provide a brief description of the event e.g. signs, symptoms, occurrences, etc.',
                              hintText: 'Type...',
                              position: controller.pages.last,
                              total: controller.total,
                              value: controller.form.value.symptoms,
                              onChanged: (value) => controller.form
                                  .update((val) => val?.symptoms = value),
                            ),
                            InputWidget(
                              question:
                                  'Number of people presenting with signs and symptoms ',
                              hintText: 'Type...',
                              position: controller.pages.last,
                              total: controller.total,
                              value:
                                  controller.form.value.humansCases.toString(),
                              onChanged: (value) => controller.form
                                  .update((val) => val?.humansCases = value),
                              inputType: InputType.kInt,
                            ),
                            InputWidget(
                              question: 'Number of human cases hospitalized',
                              hintText: 'Type...',
                              position: controller.pages.last,
                              total: controller.total,
                              value: controller
                                  .form.value.humansCasesHospitalized
                                  .toString(),
                              onChanged: (value) => controller.form.update(
                                  (val) =>
                                      val?.humansCasesHospitalized = value),
                              inputType: InputType.kInt,
                            ),
                            InputWidget(
                              question: 'Number of human deaths',
                              hintText: 'Type...',
                              position: controller.pages.last,
                              total: controller.total,
                              value:
                                  controller.form.value.humansDead.toString(),
                              onChanged: (value) => controller.form
                                  .update((val) => val?.humansDead = value),
                              inputType: InputType.kInt,
                            ),
                            InputWidget(
                              question:
                                  'Number of animals with signs and symptoms',
                              hintText: 'Type...',
                              position: controller.pages.last,
                              total: controller.total,
                              value:
                                  controller.form.value.animalsCases.toString(),
                              onChanged: (value) => controller.form
                                  .update((val) => val?.animalsCases = value),
                              inputType: InputType.kInt,
                            ),
                            InputWidget(
                              question: 'Number of dead animals',
                              hintText: 'Type...',
                              position: controller.pages.last,
                              total: controller.total,
                              value:
                                  controller.form.value.animalsDead.toString(),
                              onChanged: (value) => controller.form
                                  .update((val) => val?.animalsDead = value),
                              inputType: InputType.kInt,
                            ),
                            SelectWidget(
                              question: 'Is the cause of the event known?',
                              position: controller.pages.last,
                              total: controller.total,
                              values: controller.form.value.isCauseKnown == null
                                  ? []
                                  : [controller.form.value.isCauseKnown!],
                              options: const [
                                'Yes',
                                'No',
                              ],
                              onChanged: (String value) => controller.form
                                  .update((val) => val?.isCauseKnown = value),
                            ),
                            InputWidget(
                              question: 'What is the cause?',
                              hintText: 'Type...',
                              position: controller.pages.last,
                              total: controller.total,
                              value: controller.form.value.cause,
                              onChanged: (value) => controller.form
                                  .update((val) => val?.cause = value),
                            ),
                            SelectWidget(
                              question:
                                  'Have the laboratory samples been taken?',
                              position: controller.pages.last,
                              total: controller.total,
                              values:
                                  controller.form.value.isLabSamplesCollected ==
                                          null
                                      ? []
                                      : [
                                          controller
                                              .form.value.isLabSamplesCollected!
                                        ],
                              options: const [
                                'Yes',
                                'No',
                                'N/A',
                              ],
                              onChanged: (String value) => controller.form
                                  .update((val) =>
                                      val?.isLabSamplesCollected = value),
                            ),
                            DateWidget(
                              onChanged: (value) => controller.form.update(
                                  (val) => val?.dateSampleCollected = value),
                              position: controller.pages.last,
                              question: 'Date of sample collection',
                              value: controller.form.value.dateSampleCollected,
                              total: controller.total,
                              hintText: 'Select date',
                            ),
                            InputWidget(
                              question: 'What are the laboratory results?',
                              hintText: 'Type...',
                              position: controller.pages.last,
                              total: controller.total,
                              value: controller.form.value.labResults,
                              onChanged: (value) => controller.form
                                  .update((val) => val?.labResults = value),
                            ),
                            DateWidget(
                              question: 'Date when the results were received',
                              hintText: 'Select date',
                              position: controller.pages.last,
                              total: controller.total,
                              value:
                                  controller.form.value.dateLabResultsReceived,
                              onChanged: (value) => controller.form.update(
                                  (val) => val?.dateLabResultsReceived = value),
                            ),
                            SelectWidget(
                              question:
                                  'Are new cases still being reported from the initial area?',
                              position: controller.pages.last,
                              total: controller.total,
                              values: controller.form.value
                                          .isNewCasedReportedFromInitialArea ==
                                      null
                                  ? []
                                  : [
                                      controller.form.value
                                          .isNewCasedReportedFromInitialArea!
                                    ],
                              options: const [
                                'Yes',
                                'No',
                              ],
                              onChanged: (String value) => controller.form
                                  .update((val) =>
                                      val?.isNewCasedReportedFromInitialArea =
                                          value),
                            ),
                            SelectWidget(
                              question:
                                  'Are new cases still being reported from new areas?',
                              position: controller.pages.last,
                              total: controller.total,
                              values: controller.form.value
                                          .isNewCasedReportedFromNewAreas ==
                                      null
                                  ? []
                                  : [
                                      controller.form.value
                                          .isNewCasedReportedFromNewAreas!
                                    ],
                              options: const [
                                'Yes',
                                'No',
                              ],
                              onChanged: (String value) => controller.form
                                  .update((val) => val
                                      ?.isNewCasedReportedFromNewAreas = value),
                            ),
                            SelectWidget(
                              question:
                                  'Does the event setting promote transmission?',
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
                                'Don\'t know',
                              ],
                              onChanged: (String value) => controller.form
                                  .update((val) => val
                                      ?.isEventSettingPromotingSpread = value),
                            ),
                            InputWidget(
                              question: 'Please provide additional information',
                              hintText: 'Type...',
                              position: controller.pages.last,
                              total: controller.total,
                              value:
                                  controller.form.value.additionalInformation,
                              onChanged: (value) => controller.form.update(
                                  (val) => val?.additionalInformation = value),
                            ),
                            SelectWidget(
                              question:
                                  'How do you classify the risk of the event?',
                              position: controller.pages.last,
                              total: controller.total,
                              values: controller
                                          .form.value.riskClassification ==
                                      null
                                  ? []
                                  : [controller.form.value.riskClassification!],
                              options: const [
                                'Low',
                                'Moderate',
                                'High',
                                'Very high',
                              ],
                              onChanged: (String value) => controller.form
                                  .update(
                                      (val) => val?.riskClassification = value),
                            ),
                            SelectWidget(
                              question:
                                  'What are the recommended response activities?',
                              position: controller.pages.last,
                              total: controller.total,
                              values:
                                  controller.form.value.responseActivities ??
                                      [],
                              options: const [
                                'Further investigation',
                                'Monitor event',
                                'Strengthen surveillance',
                                'Continue with routine services',
                                'Event specific prevention and control measures',
                              ],
                              onChanged: (String value) =>
                                  controller.form.update((val) {
                                val?.responseActivities ??= [];

                                if (val!.responseActivities!.contains(value)) {
                                  val.responseActivities?.remove(value);
                                } else {
                                  val.responseActivities?.add(value);
                                }
                              }),
                            ),
                            DateWidget(
                              onChanged: (value) => controller.form.update(
                                  (val) => val?.dateSCMOHInformed = value),
                              position: controller.pages.last,
                              question: 'Date report submitted to the SCMOH',
                              value: controller.form.value.dateSCMOHInformed,
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
