import 'package:flutter/material.dart';
import 'package:m_dharura/model/form/lebs/lebs_response_form.dart';
import 'package:m_dharura/ui/_/date_widget.dart';
import 'package:m_dharura/ui/_/input_widget.dart';
import 'package:m_dharura/ui/_/responsive_widget.dart';
import 'package:m_dharura/ui/_/select_widget.dart';

class LebsResponseViewWidget extends ResponsiveWidget {
  final LebsResponseForm form;

  LebsResponseViewWidget({Key? key, required this.form}) : super(key: key);

  @override
  bool get shouldAdjust => true;

  @override
  Widget? tablet() => Scaffold(
        appBar: AppBar(
          title: const Text('LEBS Response Form'),
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
                  DateWidget(
                    question: 'When was the SCMOH informed?',
                    value: form.dateSCMOHInformed,
                  ),
                  DateWidget(
                    question:
                        'When did the public health response begin/start? ',
                    value: form.dateResponseStarted,
                  ),
                  InputWidget(
                    question:
                        'Number of people presenting with signs and symptoms',
                    value: form.humansCases.toString(),
                  ),
                  SelectWidget(
                      question:
                          'What public health response(s) were undertaken?',
                      options: form.responseActivities == null
                          ? []
                          : [...form.responseActivities!]),
                  InputWidget(
                    question: 'Number of people quarantined',
                    value: form.humansQuarantined.toString(),
                  ),
                  SelectWidget(
                    question: 'Type of quarantine',
                    options: form.quarantineTypes == null
                        ? []
                        : [...form.quarantineTypes!],
                  ),
                  SelectWidget(
                    question: 'Are those in quarantine being followed up?',
                    options: form.isHumansQuarantinedFollowedUp == null
                        ? []
                        : [form.isHumansQuarantinedFollowedUp!],
                  ),
                  SelectWidget(
                    question: 'Are there people isolated?',
                    options: form.isHumansIsolated == null
                        ? []
                        : [form.isHumansIsolated!],
                  ),
                  SelectWidget(
                    question: 'What type of isolation?',
                    options: form.isolationTypes == null
                        ? []
                        : [...form.isolationTypes!],
                  ),
                  InputWidget(
                    question: 'Number of people reported dead',
                    value: form.humansDead.toString(),
                  ),
                  SelectWidget(
                    question: 'What is the status of the event?',
                    options: form.eventStatuses == null
                        ? []
                        : [...form.eventStatuses!],
                  ),
                  InputWidget(
                    question:
                        'Please provide any additional information on the response activities',
                    value: form.additionalInformation,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
