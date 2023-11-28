import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_dharura/ui/_/input_widget.dart';
import 'package:m_dharura/ui/_/select_widget.dart';
import 'package:m_dharura/ui/form/_/summary/summary_form_controller.dart';

class SummaryFormWidget extends StatelessWidget {
  final String? signalId;
  final String type;

  const SummaryFormWidget({
    Key? key,
    required this.type,
    this.signalId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => GetX<SummaryFormController>(
        init: SummaryFormController(type: type, signalId: signalId),
        builder: (controller) => WillPopScope(
          onWillPop: () async {
            await controller.previous();
            return false;
          },
          child: Scaffold(
            appBar: AppBar(
              title: Text('${type.toUpperCase()} Summary Form'),
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
                            SelectWidget(
                              question: 'What is the status of the signal after risk assessment?',
                              position: controller.pages.last,
                              total: controller.total,
                              values: controller.form.value.eventStatus == null ? [] : [controller.form.value.eventStatus!],
                              options: const [
                                'Completed and closed',
                                'Ongoing',
                                'Escalated',
                                'Not started',
                              ],
                              onChanged: (String value) => controller.form.update((val) => val?.eventStatus = value),
                            ),
                            InputWidget(
                              question: 'Where was the event escalated to?',
                              hintText: 'Type...',
                              position: controller.pages.last,
                              total: controller.total,
                              value: controller.form.value.escalatedTo,
                              onChanged: (value) => controller.form.update((val) => val?.escalatedTo = value),
                              inputType: InputType.kText,
                            ),
                            InputWidget(
                              question: 'What is the cause?',
                              hintText: 'Type...',
                              position: controller.pages.last,
                              total: controller.total,
                              value: controller.form.value.cause,
                              onChanged: (value) => controller.form.update((val) => val?.cause = value),
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
