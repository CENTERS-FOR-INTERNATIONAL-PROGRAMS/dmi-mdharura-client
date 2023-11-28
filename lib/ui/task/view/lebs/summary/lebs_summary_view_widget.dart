import 'package:flutter/material.dart';
import 'package:m_dharura/model/form/lebs/lebs_summary_form.dart';
import 'package:m_dharura/ui/_/input_widget.dart';
import 'package:m_dharura/ui/_/responsive_widget.dart';

class LebsSummaryViewWidget extends ResponsiveWidget {
  final LebsSummaryForm form;

  LebsSummaryViewWidget({Key? key, required this.form}) : super(key: key);

  @override
  bool get shouldAdjust => true;

  @override
  Widget? tablet() => Scaffold(
        appBar: AppBar(
          title: const Text('LEBS Summary Form'),
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
          ],
        ),
      );
}
