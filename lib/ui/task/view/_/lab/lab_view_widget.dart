import 'package:flutter/material.dart';
import 'package:m_dharura/model/form/_/lab_form.dart';
import 'package:m_dharura/ui/_/date_widget.dart';
import 'package:m_dharura/ui/_/input_widget.dart';
import 'package:m_dharura/ui/_/responsive_widget.dart';

class LabViewWidget extends ResponsiveWidget {
  final LabForm form;
  final String type;

  LabViewWidget({Key? key, required this.form, required this.type}) : super(key: key);

  @override
  bool get shouldAdjust => true;

  @override
  Widget? tablet() => Scaffold(
        appBar: AppBar(
          title: Text('$type Lab Results Form'),
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: ListView(
            children: [
              // SelectWidget(
              //   question: 'Have the laboratory samples been taken?',
              //   options: form.isLabSamplesCollected == null ? [] : [form.isLabSamplesCollected!],
              // ),
              DateWidget(
                question: 'Date of sample collection',
                value: form.dateSampleCollected,
              ),
              InputWidget(
                question: 'What are the laboratory results?',
                value: form.labResults,
              ),
              DateWidget(
                question: 'Date when the results were received',
                value: form.dateLabResultsReceived,
              ),
            ],
          ),
        ),
      );
}
