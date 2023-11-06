import 'package:flutter/material.dart';
import 'package:m_dharura/model/form/lebs/lebs_investigation_form.dart';
import 'package:m_dharura/ui/_/date_widget.dart';
import 'package:m_dharura/ui/_/input_widget.dart';
import 'package:m_dharura/ui/_/responsive_widget.dart';
import 'package:m_dharura/ui/_/select_widget.dart';

class LebsInvestigationViewWidget extends ResponsiveWidget {
  final LebsInvestigationForm form;

  LebsInvestigationViewWidget({Key? key, required this.form}) : super(key: key);

  @override
  bool get shouldAdjust => true;

  @override
  Widget? tablet() => Scaffold(
        appBar: AppBar(
          title: const Text('LEBS Risk Assessment Form'),
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
                    question: 'When did the investigation begin/start?',
                    value: form.dateInvestigationStarted,
                  ),
                  SelectWidget(
                      question:
                          'What are the signs and symptoms that are being reported?',
                      options:
                          form.symptoms == null ? [] : [...form.symptoms!]),
                  InputWidget(
                    question: 'Other symptoms. Specify.',
                    value: form.symptomsOther,
                  ),
                  SelectWidget(
                      question:
                          'Does the event meet the COVID-19 working case definition?',
                      options: form.isCovid19WorkingCaseDefinitionMet == null
                          ? []
                          : [form.isCovid19WorkingCaseDefinitionMet!]),
                  SelectWidget(
                      question: 'Have samples been taken for confirmation?',
                      options: form.isSamplesCollected == null
                          ? []
                          : [form.isSamplesCollected!]),
                  SelectWidget(
                    question: 'What are the results?',
                    options: form.labResults == null ? [] : [form.labResults!],
                  ),
                  SelectWidget(
                    question: 'Does the event setting promote spread?',
                    options: form.isEventSettingPromotingSpread == null
                        ? []
                        : [form.isEventSettingPromotingSpread!],
                  ),
                  SelectWidget(
                    question:
                        'What is the status of the following COVID-19 pandemic prevention measures in the institution?\na. Hand hygiene',
                    options: form.measureHandHygiene == null
                        ? []
                        : [form.measureHandHygiene!],
                  ),
                  SelectWidget(
                    question:
                        'What is the status of the following COVID-19 pandemic prevention measures in the institution?\nb. Temperature screening',
                    options: form.measureTempScreening == null
                        ? []
                        : [form.measureTempScreening!],
                  ),
                  SelectWidget(
                    question:
                        'What is the status of the following COVID-19 pandemic prevention measures in the institution?\nc. Physical distancing',
                    options: form.measurePhysicalDistancing == null
                        ? []
                        : [form.measurePhysicalDistancing!],
                  ),
                  SelectWidget(
                    question:
                        'What is the status of the following COVID-19 pandemic prevention measures in the institution?\nd. Social distancing',
                    options: form.measureSocialDistancing == null
                        ? []
                        : [form.measureSocialDistancing!],
                  ),
                  SelectWidget(
                      question:
                          'What is the status of the following COVID-19 pandemic prevention measures in the institution?\ne. Use of masks',
                      options: form.measureUseOfMasks == null
                          ? []
                          : [form.measureUseOfMasks!]),
                  SelectWidget(
                    question:
                        'What is the status of the following COVID-19 pandemic prevention measures in the institution?\nf. Ventilation',
                    options: form.measureVentilation == null
                        ? []
                        : [form.measureVentilation!],
                  ),
                  InputWidget(
                    question:
                        'Please provide any additional information on the event',
                    value: form.additionalInformation,
                  ),
                  SelectWidget(
                    question:
                        'How would you categorize the risk of the event?\n(Consider diagnosis, setting and measures)',
                    options: form.riskClassification == null
                        ? []
                        : [form.riskClassification!],
                  ),
                  SelectWidget(
                    question: 'What are the recommended response activities?',
                    options: form.responseActivities == null
                        ? []
                        : [...form.responseActivities!],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
