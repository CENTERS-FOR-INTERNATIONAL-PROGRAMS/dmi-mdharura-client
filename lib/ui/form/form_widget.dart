import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_dharura/constant/form.dart';
import 'package:m_dharura/ui/_/message_widget.dart';
import 'package:m_dharura/ui/_/responsive_widget.dart';
import 'package:m_dharura/ui/form/_/escalation/escalation_form_widget.dart';
import 'package:m_dharura/ui/form/_/investigation/investigation_form_widget.dart';
import 'package:m_dharura/ui/form/_/response/response_form_widget.dart';
import 'package:m_dharura/ui/form/_/signal/signal_form_widget.dart';
import 'package:m_dharura/ui/form/_/verification/verification_form_widget.dart';
import 'package:m_dharura/ui/form/form_controller.dart';
import 'package:m_dharura/ui/form/lebs/escalation/lebs_escalation_form_widget.dart';
import 'package:m_dharura/ui/form/lebs/investigation/lebs_investigation_form_widget.dart';
import 'package:m_dharura/ui/form/lebs/response/lebs_response_form_widget.dart';
import 'package:m_dharura/ui/form/lebs/verification/lebs_verification_form_widget.dart';
import 'package:m_dharura/ui/form/pmebs/report/pmebs_report_form_widget.dart';
import 'package:m_dharura/ui/form/pmebs/request/pmebs_request_form_widget.dart';

class FormWidget extends ResponsiveWidget<FormController> {
  final String type, subtype;
  final String? signalId;

  FormWidget({
    Key? key,
    required this.type,
    required this.subtype,
    this.signalId,
  }) : super(key: key);

  @override
  String get tag => 'form: type: $type subtype: $subtype signalId: $signalId';

  @override
  bool get shouldAdjust => true;

  @override
  init() => Get.put(
        FormController(),
        tag: tag,
      );

  @override
  Widget? tablet() {
    switch (type) {
      case FormType.kPMEBS:
        switch (subtype) {
          case FormType.kSignal:
            return PmebsReportFormWidget();
          case FormType.kRequest:
            return PmebsRequestFormWidget(signalId: signalId);
        }
        break;
      case FormType.kCEBS:
      case FormType.kVEBS:
      case FormType.kHEBS:
        switch (subtype) {
          case FormType.kSignal:
            return SignalFormWidget(type: type);
          case FormType.kVerification:
            return VerificationFormWidget(type: type, signalId: signalId);
          case FormType.kInvestigation:
            return InvestigationFormWidget(type: type, signalId: signalId);
          case FormType.kResponse:
            return ResponseFormWidget(type: type, signalId: signalId);
          case FormType.kEscalation:
            return EscalationFormWidget(type: type, signalId: signalId);
        }
        break;
      case FormType.kLEBS:
        switch (subtype) {
          case FormType.kSignal:
            return SignalFormWidget(type: type);
          case FormType.kVerification:
            return LebsVerificationFormWidget(signalId: signalId);
          case FormType.kInvestigation:
            return LebsInvestigationFormWidget(signalId: signalId);
          case FormType.kResponse:
            return LebsResponseFormWidget(signalId: signalId);
          case FormType.kEscalation:
            return LebsEscalationFormWidget(signalId: signalId);
        }
        break;
    }

    return MessageWidget(
      title: 'Form not available',
      subtitle: 'Form not available',
      description:
          'Update your app. If the problem persists contact your supervisor.',
      adjust: false,
    );
  }
}
