import 'package:flutter/material.dart';
import 'package:m_dharura/model/form/lebs/lebs_escalation_form.dart';
import 'package:m_dharura/ui/_/date_widget.dart';
import 'package:m_dharura/ui/_/input_widget.dart';
import 'package:m_dharura/ui/_/responsive_widget.dart';
import 'package:m_dharura/ui/_/select_widget.dart';

class LebsEscalationViewWidget extends ResponsiveWidget {
  final LebsEscalationForm form;

  LebsEscalationViewWidget({Key? key, required this.form}) : super(key: key);

  @override
  bool get shouldAdjust => true;

  @override
  Widget? tablet() => Scaffold(
        appBar: AppBar(
          title: const Text('LEBS Escalation Form'),
        ),
        body: ListView(
          shrinkWrap: true,
          children: [
            const SizedBox(
              height: 16,
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  InputWidget(
                    question: 'Type of the event (disease, condition, hazard)',
                    value: form.eventType,
                  ),
                  DateWidget(
                    question: 'Date of response',
                    value: form.dateResponseStarted,
                  ),
                  SelectWidget(
                    question: 'Reason for escalation',
                    options: form.reason == null ? [] : [form.reason!],
                  ),
                  InputWidget(
                    question: 'Please specify other reason for escalation',
                    value: form.reasonOther,
                  ),
                  DateWidget(
                    question: 'Date of escalation',
                    value: form.dateEscalated,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
