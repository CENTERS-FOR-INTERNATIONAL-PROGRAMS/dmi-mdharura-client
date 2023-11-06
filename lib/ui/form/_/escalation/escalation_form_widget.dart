import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_dharura/ui/_/date_widget.dart';
import 'package:m_dharura/ui/_/input_widget.dart';
import 'package:m_dharura/ui/_/select_widget.dart';
import 'package:m_dharura/ui/form/_/escalation/escalation_form_controller.dart';

class EscalationFormWidget extends StatelessWidget {
  final String? signalId;
  final String type;

  const EscalationFormWidget({Key? key, required this.type, this.signalId})
      : super(key: key);

  @override
  Widget build(BuildContext context) => GetX<EscalationFormController>(
        init: EscalationFormController(type: type, signalId: signalId),
        builder: (controller) => WillPopScope(
          onWillPop: () async {
            await controller.previous();
            return false;
          },
          child: Scaffold(
            appBar: AppBar(
              title: Text('${type.toUpperCase()} Escalation Form'),
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
                                  (val) => val?.dateResponseStarted = value),
                              position: controller.pages.last,
                              question: 'Date of response',
                              value: controller.form.value.dateResponseStarted,
                              total: controller.total,
                              hintText: 'Select date',
                            ),
                            SelectWidget(
                              question: 'Reason for escalation',
                              position: controller.pages.last,
                              total: controller.total,
                              values: controller.form.value.reason == null
                                  ? []
                                  : [controller.form.value.reason!],
                              options: const [
                                'Information',
                                'Technical support',
                                'Resource support',
                                'Other',
                              ],
                              onChanged: (String value) => controller.form
                                  .update((val) => val?.reason = value),
                            ),
                            InputWidget(
                              question:
                                  'Please specify other reason for escalation',
                              hintText: 'Type...',
                              position: controller.pages.last,
                              total: controller.total,
                              value: controller.form.value.reasonOther,
                              onChanged: (value) => controller.form
                                  .update((val) => val?.reasonOther = value),
                            ),
                            DateWidget(
                              onChanged: (value) => controller.form
                                  .update((val) => val?.dateEscalated = value),
                              position: controller.pages.last,
                              question: 'Date of escalation',
                              value: controller.form.value.dateEscalated,
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
