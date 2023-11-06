import 'package:flutter/material.dart';
import 'package:m_dharura/model/form/pmebs/pmebs_request_form.dart';
import 'package:m_dharura/ui/_/date_widget.dart';
import 'package:m_dharura/ui/_/input_widget.dart';
import 'package:m_dharura/ui/_/responsive_widget.dart';

class PmebsRequestViewWidget extends ResponsiveWidget {
  final PmebsRequestForm form;

  PmebsRequestViewWidget({Key? key, required this.form}) : super(key: key);

  @override
  bool get shouldAdjust => true;

  @override
  Widget? tablet() => Scaffold(
        appBar: AppBar(
          title: const Text('PEBS and MEBS Request Form'),
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
                    value: form.dateRequested,
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
                  DateWidget(
                    question: 'Signal Report Date',
                    value: form.dateReported,
                  ),
                ],
              ),
            )
          ],
        ),
      );
}
