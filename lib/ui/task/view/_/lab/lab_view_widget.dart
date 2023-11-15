import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_dharura/model/form/_/lab_form.dart';
import 'package:m_dharura/ui/_/date_widget.dart';
import 'package:m_dharura/ui/_/input_widget.dart';
import 'package:m_dharura/ui/_/responsive_widget.dart';
import 'package:m_dharura/ui/task/view/_/lab/edit/lab_edit_widget.dart';

class LabViewWidget extends ResponsiveWidget {
  final LabForm form;
  final String? signalId;
  final String type;

  LabViewWidget({
    Key? key,
    required this.form,
    required this.type,
    this.signalId,
  }) : super(key: key);

  @override
  bool get shouldAdjust => true;

  @override
  Widget? tablet() => Scaffold(
        appBar: AppBar(
          title: Text('$type Lab Results Form'),
          actions: [
            TextButton(
              child: const Text(
                'Edit',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () async => await Get.to(LabEditWidget(
                form: form,
                type: type,
                signalId: signalId,
              )),
            ),
            const SizedBox(
              width: 16,
            ),
          ],
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
