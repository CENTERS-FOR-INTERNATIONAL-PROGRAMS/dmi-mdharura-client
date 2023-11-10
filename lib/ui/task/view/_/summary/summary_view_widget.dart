import 'package:flutter/material.dart';
import 'package:m_dharura/model/form/_/Summary_form.dart';
import 'package:m_dharura/ui/_/input_widget.dart';
import 'package:m_dharura/ui/_/responsive_widget.dart';

class SummaryViewWidget extends ResponsiveWidget {
  final SummaryForm form;
  final String type;

  SummaryViewWidget({Key? key, required this.form, required this.type}) : super(key: key);

  @override
  bool get shouldAdjust => true;

  @override
  Widget? tablet() => Scaffold(
        appBar: AppBar(
          title: Text('$type Summary Form'),
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
                question: 'What is the status of the signal after risk assessment?',
                value: form.eventStatus,
              ),
              InputWidget(
                question: 'Where was the event escalated to?',
                value: form.escalatedTo ?? '',
              ),
              InputWidget(
                question: 'What is the cause?',
                value: form.cause ?? '',
              ),
            ],
          ),
        ),
      );
}
