import 'package:flutter/material.dart';
import 'package:m_dharura/model/form/lebs/lebs_verification_form.dart';
import 'package:m_dharura/ui/_/date_widget.dart';
import 'package:m_dharura/ui/_/input_widget.dart';
import 'package:m_dharura/ui/_/responsive_widget.dart';
import 'package:m_dharura/ui/_/select_widget.dart';

class LebsVerificationViewWidget extends ResponsiveWidget {
  final LebsVerificationForm form;

  LebsVerificationViewWidget({Key? key, required this.form}) : super(key: key);

  @override
  bool get shouldAdjust => true;

  @override
  Widget? tablet() => Scaffold(
        appBar: AppBar(
          title: const Text('LEBS Verification Form'),
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
                    question:
                        'Provide brief description of signal (What happened/Is happening?)',
                    value: form.description,
                  ),
                  SelectWidget(
                    question:
                        'Does the information match one of the pre-defined signals?',
                    options: form.isMatchingSignal == null
                        ? []
                        : [form.isMatchingSignal!],
                  ),
                  SelectWidget(
                    question: 'What was the final code of the LEBS signal?',
                    options:
                        form.updatedSignal == null ? [] : [form.updatedSignal!],
                  ),
                  DateWidget(
                    question: 'When did the health threat start?',
                    value: form.dateHealthThreatStarted,
                  ),
                  SelectWidget(
                      question:
                          'From whom did the school LEBS focal point get this information?',
                      options: form.informant == null ? [] : [form.informant!]),
                  InputWidget(
                    question:
                        'Specify from who did the school focal point get this information',
                    value: form.otherInformant,
                  ),
                  InputWidget(
                    question:
                        'Please, provide any additional information about the signal',
                    value: form.additionalInformation,
                  ),
                  SelectWidget(
                    question: 'Is the reported signal still happening?',
                    options: form.isStillHappening == null
                        ? []
                        : [form.isStillHappening!],
                  ),
                  DateWidget(
                    question: 'Date when signal was verified?',
                    value: form.dateVerified,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
