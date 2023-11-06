import 'package:flutter/material.dart';
import 'package:m_dharura/helper/signal.dart';
import 'package:m_dharura/model/form/pmebs/pmebs_report_form.dart';
import 'package:m_dharura/ui/_/date_widget.dart';
import 'package:m_dharura/ui/_/input_widget.dart';
import 'package:m_dharura/ui/_/responsive_widget.dart';
import 'package:m_dharura/ui/_/select_widget.dart';

class PmebsReportViewWidget extends ResponsiveWidget {
  final PmebsReportForm form;

  PmebsReportViewWidget({Key? key, required this.form}) : super(key: key);

  @override
  bool get shouldAdjust => true;

  @override
  Widget? tablet() => Scaffold(
        appBar: AppBar(
          title: const Text('PEBS and MEBS Report Form'),
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
                children: [
                  DateWidget(
                    question: 'When did the health threat start?',
                    value: form.dateDetected,
                  ),
                  SelectWidget(
                    question: 'What do you want to report?',
                    options: form.signal == null
                        ? []
                        : [describeSignal(form.signal!)],
                    labels: form.signal == null ? [] : [form.signal!],
                  ),
                  InputWidget(
                    question: 'Locality',
                    value: form.locality,
                  ),
                  InputWidget(
                    question:
                        'Provide a brief description of the signal (What happened/Is happening?)',
                    value: form.description,
                  ),
                  SelectWidget(
                    question: 'Source of signal',
                    options: form.source == null ? [] : [form.source!],
                  ),
                  DateWidget(
                    question: 'Signal report date',
                    value: form.dateReported,
                  ),
                ],
              ),
            )
          ],
        ),
      );
}
