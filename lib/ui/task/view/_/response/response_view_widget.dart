import 'package:flutter/material.dart';
import 'package:m_dharura/model/form/_/response_form.dart';
import 'package:m_dharura/ui/_/date_widget.dart';
import 'package:m_dharura/ui/_/input_widget.dart';
import 'package:m_dharura/ui/_/responsive_widget.dart';
import 'package:m_dharura/ui/_/select_widget.dart';

class ResponseViewWidget extends ResponsiveWidget {
  final ResponseForm form;
  final String type;

  ResponseViewWidget({Key? key, required this.form, required this.type})
      : super(key: key);

  @override
  bool get shouldAdjust => true;

  @override
  Widget? tablet() => Scaffold(
        appBar: AppBar(
          title: Text('$type Response Form'),
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
                question: 'Date when was the SCMOH informed',
                value: form.dateSCMOHInformed,
              ),
              DateWidget(
                question: 'Date when public health action started',
                value: form.dateResponseStarted,
              ),
              SelectWidget(
                question: 'What public health responses were undertaken?',
                options: form.responseActivities ?? [],
              ),
              InputWidget(
                question:
                    'Please specify other public health response undertaken',
                value: form.otherResponseActivity,
              ),
              SelectWidget(
                question: 'What is the outcome of the public health action?',
                options: form.outcomeOfResponse == null
                    ? []
                    : [form.outcomeOfResponse!],
              ),
              SelectWidget(
                question: 'Recommendations for the public health action',
                options: form.recommendations ?? [],
              ),
              DateWidget(
                question: 'Date of escalation of public health response',
                value: form.dateEscalated,
              ),
              DateWidget(
                question: 'Date of public health response report',
                value: form.dateOfReport,
              ),
              InputWidget(
                question:
                    'Please, provide any additional information about the signal',
                value: form.additionalInformation,
              ),
            ],
          ),
        ),
      );
}
