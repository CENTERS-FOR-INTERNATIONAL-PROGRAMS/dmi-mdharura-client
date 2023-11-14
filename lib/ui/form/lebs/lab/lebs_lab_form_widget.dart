import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_dharura/ui/_/date_widget.dart';
import 'package:m_dharura/ui/_/input_widget.dart';
import 'package:m_dharura/ui/form/lebs/lab/lebs_lab_form_controller.dart';

class LebsLabFormWidget extends StatelessWidget {
  final String? signalId;

  const LebsLabFormWidget({Key? key, this.signalId}) : super(key: key);

  @override
  Widget build(BuildContext context) => GetX<LebsLabFormController>(
        init: LebsLabFormController(signalId: signalId),
        builder: (controller) => WillPopScope(
          onWillPop: () async {
            await controller.previous();
            return false;
          },
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Lebs Lab Form'),
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
                              onChanged: (value) => controller.signal.value = value,
                              lines: 1,
                              textCapitalization: TextCapitalization.characters,
                            ),
                            // SelectWidget(
                            //   question: 'Have the laboratory samples been taken?',
                            //   position: controller.pages.last,
                            //   total: controller.total,
                            //   values: controller.form.value.isLabSamplesCollected == null ? [] : [controller.form.value.isLabSamplesCollected!],
                            //   options: const [
                            //     'Yes',
                            //     'No',
                            //     'N/A',
                            //   ],
                            //   onChanged: (String value) => controller.form.update((val) => val?.isLabSamplesCollected = value),
                            // ),
                            DateWidget(
                              onChanged: (value) => controller.form.update((val) => val?.dateSampleCollected = value),
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
                              onChanged: (value) => controller.form.update((val) => val?.labResults = value),
                            ),
                            DateWidget(
                              question: 'Date when the results were received',
                              hintText: 'Select date',
                              position: controller.pages.last,
                              total: controller.total,
                              value: controller.form.value.dateLabResultsReceived,
                              onChanged: (value) => controller.form.update((val) => val?.dateLabResultsReceived = value),
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
                                onPressed: () async => await controller.previous(),
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
                              : Text(controller.pages.last < controller.total - 1 ? 'Next' : 'Submit'),
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
