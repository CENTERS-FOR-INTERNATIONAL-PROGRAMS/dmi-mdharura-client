import 'package:flutter/material.dart';
import 'package:m_dharura/model/form/_/escalation_form.dart';
import 'package:m_dharura/ui/_/date_widget.dart';
import 'package:m_dharura/ui/_/input_widget.dart';
import 'package:m_dharura/ui/_/responsive_widget.dart';
import 'package:m_dharura/ui/_/select_widget.dart';

class EscalationViewWidget extends ResponsiveWidget {
  final EscalationForm form;
  final String type;

  EscalationViewWidget({Key? key, required this.form, required this.type})
      : super(key: key);

  @override
  bool get shouldAdjust => true;

  @override
  Widget? tablet() => Scaffold(
        appBar: AppBar(
          title: Text('$type Escalation Form'),
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: ListView(
            children: [
              const SizedBox(
                height: 16,
              ),
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
      );
}
