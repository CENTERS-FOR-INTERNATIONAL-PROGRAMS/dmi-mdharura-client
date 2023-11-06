import 'package:flutter/material.dart';
import 'package:m_dharura/helper/signal.dart';
import 'package:m_dharura/model/form/_/verification_form.dart';
import 'package:m_dharura/ui/_/date_widget.dart';
import 'package:m_dharura/ui/_/input_widget.dart';
import 'package:m_dharura/ui/_/responsive_widget.dart';
import 'package:m_dharura/ui/_/select_widget.dart';

class VerificationViewWidget extends ResponsiveWidget {
  final VerificationForm form;
  final String type;

  VerificationViewWidget({Key? key, required this.form, required this.type})
      : super(key: key);

  @override
  bool get shouldAdjust => true;

  @override
  Widget? tablet() => Scaffold(
        appBar: AppBar(
          title: Text('$type Verification Form'),
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
              SelectWidget(
                question: 'Source of signal report',
                options: form.source == null ? [] : [form.source!],
              ),
              InputWidget(
                question:
                    'Provide brief description of signal (What happened/Is happening?)',
                value: form.description,
              ),
              SelectWidget(
                question:
                    'Does the information match one of the signals on the list?',
                options: form.isMatchingSignal == null
                    ? []
                    : [form.isMatchingSignal!],
              ),
              SelectWidget(
                question:
                    'If yes, what was the final classification of the public health signal?',
                options: form.updatedSignal == null
                    ? []
                    : [describeSignal(form.updatedSignal!)],
                labels: form.updatedSignal == null ? [] : [form.updatedSignal!],
              ),
              SelectWidget(
                question:
                    'Has this signal been reported before (Is it a duplicate report)?',
                options: form.isReportedBefore == null
                    ? []
                    : [form.isReportedBefore!],
              ),
              DateWidget(
                question: 'When did the signal start?',
                value: form.dateHealthThreatStarted,
              ),
              SelectWidget(
                question: 'From whom was the information received?',
                options: form.informant == null ? [] : [form.informant!],
              ),
              InputWidget(
                question:
                    'Please specify from whom the information was received',
                value: form.otherInformant,
              ),
              SelectWidget(
                question: 'Does the reported threat still exist?',
                options: form.isThreatStillExisting == null
                    ? []
                    : [form.isThreatStillExisting!],
              ),
              InputWidget(
                question:
                    'Please provide any additional information about the event',
                value: form.additionalInformation,
              ),
              SelectWidget(
                question: 'Does the event present a public health threat to?',
                options: form.threatTo == null ? [] : [form.threatTo!],
              ),
              DateWidget(
                question: 'Date when public health threat was verified',
                value: form.dateVerified,
              ),
              DateWidget(
                question: 'Date when SCDSC/SCVO was informed about the event',
                value: form.dateSCDSCInformed,
              ),
            ],
          ),
        ),
      );
}
