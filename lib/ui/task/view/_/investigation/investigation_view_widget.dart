import 'package:flutter/material.dart';
import 'package:m_dharura/model/form/_/investigation_form.dart';
import 'package:m_dharura/ui/_/date_widget.dart';
import 'package:m_dharura/ui/_/input_widget.dart';
import 'package:m_dharura/ui/_/responsive_widget.dart';
import 'package:m_dharura/ui/_/select_widget.dart';

class InvestigationViewWidget extends ResponsiveWidget {
  final InvestigationForm form;
  final String type;

  InvestigationViewWidget({Key? key, required this.form, required this.type}) : super(key: key);

  @override
  bool get shouldAdjust => true;

  @override
  Widget? tablet() => Scaffold(
        appBar: AppBar(
          title: Text('$type Risk Assessment Form'),
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
                question: 'When was the SCDSC/SCVO informed?',
                value: form.dateSCDSCInformed,
              ),
              DateWidget(
                question: 'When did the initial risk assessment begin/start?',
                value: form.dateInvestigationStarted,
              ),
              DateWidget(
                question: 'When did the event start?',
                value: form.dateEventStarted,
              ),
              InputWidget(
                question: 'Provide a brief description of the event e.g. signs, symptoms, occurrences, etc.',
                value: form.symptoms,
              ),
              InputWidget(
                question: 'Number of people presenting with signs and symptoms ',
                value: form.humansCases.toString(),
              ),
              InputWidget(
                question: 'Number of human cases hospitalized',
                value: form.humansCasesHospitalized.toString(),
              ),
              InputWidget(
                question: 'Number of human deaths',
                value: form.humansDead.toString(),
              ),
              InputWidget(
                question: 'Number of animals with signs and symptoms',
                value: form.animalsCases.toString(),
              ),
              InputWidget(
                question: 'Number of dead animals',
                value: form.animalsDead.toString(),
              ),
              SelectWidget(
                question: 'Is the cause of the event known?',
                options: form.isCauseKnown == null ? [] : [form.isCauseKnown!],
              ),
              InputWidget(
                question: 'What is the cause?',
                value: form.cause,
              ),
              SelectWidget(
                question: 'Have the laboratory samples been taken?',
                options: form.isLabSamplesCollected == null ? [] : [form.isLabSamplesCollected!],
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
              SelectWidget(
                question: 'Are new cases still being reported from the initial area?',
                options: form.isNewCasedReportedFromInitialArea == null ? [] : [form.isNewCasedReportedFromInitialArea!],
              ),
              SelectWidget(
                question: 'Are new cases still being reported from new areas?',
                options: form.isNewCasedReportedFromNewAreas == null ? [] : [form.isNewCasedReportedFromNewAreas!],
              ),
              SelectWidget(
                question: 'Does the event setting promote transmission?',
                options: form.isEventSettingPromotingSpread == null ? [] : [form.isEventSettingPromotingSpread!],
              ),
              InputWidget(
                question: 'Please provide additional information',
                value: form.additionalInformation,
              ),
              SelectWidget(
                question: 'How do you classify the risk of the event?',
                options: form.riskClassification == null ? [] : [form.riskClassification!],
              ),
              SelectWidget(
                question: 'Is the assessed event human, animal or environmental related?',
                options: form.eventCategories ?? [],
              ),
              SelectWidget(
                question: 'Is the event considered an infectious or non-infectious?',
                options: form.isEventInfectious == null ? [] : [form.isEventInfectious!],
              ),
              SelectWidget(
                question: 'If the event is infectious, which of the below systems are affected in your view?',
                options: form.systemsAffectedByEvent ?? [],
              ),
              SelectWidget(
                question: 'What are the recommended response activities?',
                options: form.responseActivities ?? [],
              ),
              DateWidget(
                question: 'Date report submitted to the SCMOH',
                value: form.dateSCMOHInformed,
              ),
            ],
          ),
        ),
      );
}
