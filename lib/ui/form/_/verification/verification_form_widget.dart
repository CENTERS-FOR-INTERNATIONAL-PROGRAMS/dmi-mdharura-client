import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_dharura/helper/signal.dart';
import 'package:m_dharura/ui/_/date_widget.dart';
import 'package:m_dharura/ui/_/input_widget.dart';
import 'package:m_dharura/ui/_/select_widget.dart';

import 'verification_form_controller.dart';

class VerificationFormWidget extends StatelessWidget {
  final String? signalId;
  final String type;

  const VerificationFormWidget({Key? key, required this.type, this.signalId})
      : super(key: key);

  @override
  Widget build(BuildContext context) => GetX<VerificationFormController>(
        init: VerificationFormController(type: type, signalId: signalId),
        builder: (controller) => WillPopScope(
          onWillPop: () async {
            await controller.previous();
            return false;
          },
          child: Scaffold(
            appBar: AppBar(
              title: Text('${type.toUpperCase()} Verification Form'),
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
                            question: 'Signal ID (unique identifier)',
                            hintText: 'Type...',
                            position: controller.pages.last,
                            total: controller.total,
                            value: controller.signal.value,
                            onChanged: (value) =>
                                controller.signal.value = value,
                            lines: 1,
                            textCapitalization: TextCapitalization.characters,
                          ),
                          SelectWidget(
                            question: 'Source of signal report',
                            position: controller.pages.last,
                            total: controller.total,
                            values: controller.form.value.source == null
                                ? []
                                : [controller.form.value.source!],
                            options: const [
                              'Community',
                              'Health facility',
                              'Veterinary facility',
                              'Hotlines',
                              'Media scanning',
                            ],
                            onChanged: (String value) => controller.form
                                .update((val) => val?.source = value),
                          ),
                          InputWidget(
                            question:
                                'Provide brief description of signal (What happened/Is happening?)',
                            hintText: 'Type...',
                            position: controller.pages.last,
                            total: controller.total,
                            value: controller.form.value.description,
                            onChanged: (value) => controller.form
                                .update((val) => val?.description = value),
                          ),
                          SelectWidget(
                            question:
                                'Does the information match one of the signals on the list?',
                            position: controller.pages.last,
                            total: controller.total,
                            values:
                                controller.form.value.isMatchingSignal == null
                                    ? []
                                    : [controller.form.value.isMatchingSignal!],
                            options: const [
                              'Yes',
                              'No',
                            ],
                            onChanged: (String value) => controller.form
                                .update((val) => val?.isMatchingSignal = value),
                          ),
                          SelectWidget(
                            question:
                                'If yes, what was the final classification of the public health signal?',
                            position: controller.pages.last,
                            total: controller.total,
                            values: controller.form.value.updatedSignal == null
                                ? []
                                : [
                                    listSignals(type)
                                        .firstWhere((element) =>
                                            element.code ==
                                            controller.form.value.updatedSignal)
                                        .description
                                  ],
                            options: listSignals(type)
                                .map((e) => e.description)
                                .toList(),
                            labels:
                                listSignals(type).map((e) => e.code).toList(),
                            onChanged: (String value) => controller.form.update(
                                (val) => val?.updatedSignal = listSignals(type)
                                    .firstWhere((element) =>
                                        element.description == value)
                                    .code),
                          ),
                          SelectWidget(
                            question:
                                'Has this signal been reported before (Is it a duplicate report)?',
                            position: controller.pages.last,
                            total: controller.total,
                            values:
                                controller.form.value.isReportedBefore == null
                                    ? []
                                    : [controller.form.value.isReportedBefore!],
                            options: const [
                              'Yes',
                              'No',
                            ],
                            onChanged: (String value) => controller.form
                                .update((val) => val?.isReportedBefore = value),
                          ),
                          DateWidget(
                            onChanged: (value) => controller.form.update(
                                (val) => val?.dateHealthThreatStarted = value),
                            position: controller.pages.last,
                            question: 'When did the signal start?',
                            value:
                                controller.form.value.dateHealthThreatStarted,
                            total: controller.total,
                            hintText: 'Select date',
                          ),
                          SelectWidget(
                            question: 'From whom was the information received?',
                            position: controller.pages.last,
                            total: controller.total,
                            values: controller.form.value.informant == null
                                ? []
                                : [controller.form.value.informant!],
                            options: const [
                              'Self',
                              'Patient',
                              'Health care worker',
                              'Animal health care provider',
                              'Community health volunteer',
                              'Community animal disease reporter',
                              'Community member/leader',
                              'Community networks (religious organizations, learning institutions, markets, healers etc.)',
                              'Media (electronic, print, social)',
                              'Other',
                            ],
                            onChanged: (String value) => controller.form
                                .update((val) => val?.informant = value),
                          ),
                          InputWidget(
                            question:
                                'Please specify from whom the information was received',
                            hintText: 'Type...',
                            position: controller.pages.last,
                            total: controller.total,
                            value: controller.form.value.otherInformant,
                            onChanged: (value) => controller.form
                                .update((val) => val?.otherInformant = value),
                          ),
                          SelectWidget(
                            question: 'Does the reported threat still exist? ',
                            position: controller.pages.last,
                            total: controller.total,
                            values: controller
                                        .form.value.isThreatStillExisting ==
                                    null
                                ? []
                                : [
                                    controller.form.value.isThreatStillExisting!
                                  ],
                            options: const [
                              'Yes',
                              'No',
                            ],
                            onChanged: (String value) => controller.form.update(
                                (val) => val?.isThreatStillExisting = value),
                          ),
                          InputWidget(
                            question:
                                'Please provide any additional information about the event',
                            hintText: 'Type...',
                            position: controller.pages.last,
                            total: controller.total,
                            value: controller.form.value.additionalInformation,
                            onChanged: (value) => controller.form.update(
                                (val) => val?.additionalInformation = value),
                          ),
                          SelectWidget(
                            question:
                                'Does the event present a public health threat to?',
                            position: controller.pages.last,
                            total: controller.total,
                            values: controller.form.value.threatTo == null
                                ? []
                                : [controller.form.value.threatTo!],
                            options: const [
                              'Human only',
                              'Animal only',
                              'Humans and animals',
                            ],
                            onChanged: (String value) => controller.form
                                .update((val) => val?.threatTo = value),
                          ),
                          DateWidget(
                            onChanged: (value) => controller.form
                                .update((val) => val?.dateVerified = value),
                            position: controller.pages.last,
                            question:
                                'Date when public health threat was verified',
                            value: controller.form.value.dateVerified,
                            total: controller.total,
                            hintText: 'Select date',
                          ),
                          DateWidget(
                            onChanged: (value) => controller.form.update(
                                (val) => val?.dateSCDSCInformed = value),
                            position: controller.pages.last,
                            question:
                                'Date when SCDSC/SCVO was informed about the event',
                            value: controller.form.value.dateSCDSCInformed,
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
                        ][controller.pages.last],
                      ),
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
