import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_dharura/model/form/lebs/lebs_lab_form.dart';
import 'package:m_dharura/ui/_/date_widget.dart';
import 'package:m_dharura/ui/_/input_widget.dart';
import 'package:m_dharura/ui/_/responsive_widget.dart';
import 'package:m_dharura/ui/task/view/lebs/lab/edit/lebs_lab_edit_widget.dart';

class LebsLabViewWidget extends ResponsiveWidget {
  final LebsLabForm form;
  final String? signalId;

  LebsLabViewWidget({
    Key? key,
    required this.form,
    this.signalId,
  }) : super(key: key);

  @override
  bool get shouldAdjust => true;

  @override
  Widget? tablet() => Scaffold(
        appBar: AppBar(
          title: const Text('LEBS Lab Results Form'),
          actions: [
            TextButton(
              child: const Text(
                'Edit',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () async => await Get.to(LebsLabEditWidget(
                form: form,
                type: 'LEBS',
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
