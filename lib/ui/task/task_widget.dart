import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_dharura/helper/signal.dart';
import 'package:m_dharura/ui/_/divider_widget.dart';
import 'package:m_dharura/ui/_/item/task_form_item_widget.dart';
import 'package:m_dharura/ui/_/item/unit_item_widget.dart';
import 'package:m_dharura/ui/_/responsive_widget.dart';
import 'package:m_dharura/ui/task/task_controller.dart';
import 'package:m_dharura/ui/task/view/_/escalation/escalation_view_widget.dart';
import 'package:m_dharura/ui/task/view/_/investigation/investigation_view_widget.dart';
import 'package:m_dharura/ui/task/view/_/lab/lab_view_widget.dart';
import 'package:m_dharura/ui/task/view/_/response/response_view_widget.dart';
import 'package:m_dharura/ui/task/view/_/summary/summary_view_widget.dart';
import 'package:m_dharura/ui/task/view/_/verification/verification_view_widget.dart';
import 'package:m_dharura/ui/task/view/lebs/escalation/lebs_escalation_view_widget.dart';
import 'package:m_dharura/ui/task/view/lebs/investigation/lebs_investigation_view_widget.dart';
import 'package:m_dharura/ui/task/view/lebs/lab/lebs_lab_view_widget.dart';
import 'package:m_dharura/ui/task/view/lebs/response/lebs_response_view_widget.dart';
import 'package:m_dharura/ui/task/view/lebs/summary/lebs_summary_view_widget.dart';
import 'package:m_dharura/ui/task/view/lebs/verification/lebs_verification_view_widget.dart';
import 'package:m_dharura/ui/task/view/pmebs/report/pmebs_report_view_widget.dart';
import 'package:m_dharura/ui/task/view/pmebs/request/pmebs_request_view_widget.dart';

class TaskWidget extends ResponsiveWidget<TaskController> {
  final String taskId;

  TaskWidget({Key? key, required this.taskId}) : super(key: key);

  @override
  String get tag => 'task: taskId:$taskId';

  @override
  bool get shouldAdjust => true;

  @override
  TaskController get controller => Get.put(TaskController(taskId: taskId), tag: tag, permanent: true);

  @override
  init() {
    controller.fetch();
  }

  @override
  Widget? tablet() => Obx(() => controller.task.value == null
      ? Scaffold(
          appBar: AppBar(
            title: const Text('Task'),
          ),
          body: RefreshIndicator(
            onRefresh: () async {
              controller.fetch();
            },
            child: controller.isFetching.isTrue
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView(),
          ),
        )
      : Scaffold(
          appBar: AppBar(
            title: const Text('Task'),
            backgroundColor: controller.task.value!.state == 'live' ? Colors.lightGreen : Colors.black,
          ),
          body: Obx(
            () => controller.isFetching.isTrue && controller.task.value == null
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : RefreshIndicator(
                    onRefresh: () async {
                      controller.fetch();
                    },
                    child: ListView(
                      children: [
                        Container(
                          color: controller.task.value!.state == 'test' ? Colors.grey.shade50 : Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const SizedBox(
                                height: 16,
                              ),
                              ListTile(
                                title: GestureDetector(
                                  child: Text(
                                    '${controller.task.value!.signal.toUpperCase()} · ${controller.task.value!.signalId} · ${controller.task.value!.status.capitalize}',
                                    style: Theme.of(screen.context).textTheme.bodyLarge?.copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  onTap: () async {},
                                ),
                                subtitle: Text(
                                  describeSignal(controller.task.value!.signal),
                                ),
                                trailing: Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 4,
                                    horizontal: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                                    border: Border.all(color: Colors.grey.shade300),
                                  ),
                                  child: Text(
                                    controller.task.value!.state.capitalize!,
                                    style: Theme.of(screen.context).textTheme.bodySmall?.copyWith(
                                          color: controller.task.value!.state == 'test' ? Colors.black : Theme.of(screen.context).primaryColor,
                                        ),
                                  ),
                                ),
                              ),
                              if (controller.task.value!.pmebs != null)
                                Container(
                                  margin: const EdgeInsets.only(
                                    left: 16,
                                    right: 16,
                                    bottom: 8,
                                  ),
                                  child: Text(
                                    'Hotline & Media Scanning',
                                    style: Theme.of(screen.context).textTheme.bodySmall,
                                  ),
                                ),
                              UnitItemWidget(
                                unit: controller.task.value!.unit,
                                isPrimary: false,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                            ],
                          ),
                        ),
                        const DividerWidget(),
                        const SizedBox(
                          height: 8,
                        ),
                        TaskFormItemWidget(
                          title: 'Report',
                          date: controller.task.value!.createdAt,
                          user: controller.task.value!.user,
                          onClick: null,
                        ),
                        if (controller.task.value!.pmebs != null) ...[
                          if (controller.task.value!.pmebs?.reportForm != null)
                            TaskFormItemWidget(
                              title: 'PEBS/MEBS Report',
                              date: controller.task.value!.pmebs?.reportForm?.createdAt,
                              user: controller.task.value!.pmebs?.reportForm?.user,
                              onClick: () async {
                                await Get.to(PmebsReportViewWidget(
                                  form: controller.task.value!.pmebs!.reportForm!..signal = controller.task.value!.signal,
                                ));
                              },
                            ),
                          if (controller.task.value!.pmebs?.requestForm != null)
                            TaskFormItemWidget(
                              title: 'PEBS/MEBS Verification Request',
                              date: controller.task.value!.pmebs?.requestForm?.createdAt,
                              user: controller.task.value!.pmebs?.requestForm?.user,
                              onClick: () async {
                                await Get.to(PmebsRequestViewWidget(
                                  form: controller.task.value!.pmebs!.requestForm!,
                                ));
                              },
                            ),
                        ],
                        if (controller.task.value!.cebs != null) ...[
                          if (controller.task.value!.cebs!.verificationForm != null)
                            TaskFormItemWidget(
                              title: 'CEBS Verification',
                              date: controller.task.value!.cebs!.verificationForm!.createdAt,
                              user: controller.task.value!.cebs!.verificationForm!.user,
                              onClick: () async {
                                await Get.to(VerificationViewWidget(form: controller.task.value!.cebs!.verificationForm!, type: 'CEBS'));
                              },
                            ),
                          if (controller.task.value!.cebs!.investigationForm != null)
                            TaskFormItemWidget(
                              title: 'CEBS Risk Assessment',
                              date: controller.task.value!.cebs!.investigationForm!.createdAt,
                              user: controller.task.value!.cebs!.investigationForm!.user,
                              onClick: () async {
                                await Get.to(InvestigationViewWidget(form: controller.task.value!.cebs!.investigationForm!, type: 'CEBS'));
                              },
                            ),
                          if (controller.task.value!.cebs!.responseForm != null)
                            TaskFormItemWidget(
                              title: 'CEBS Response',
                              date: controller.task.value!.cebs!.responseForm!.createdAt,
                              user: controller.task.value!.cebs!.responseForm!.user,
                              onClick: () async {
                                await Get.to(ResponseViewWidget(form: controller.task.value!.cebs!.responseForm!, type: 'CEBS'));
                              },
                            ),
                          if (controller.task.value!.cebs!.escalationForm != null)
                            TaskFormItemWidget(
                              title: 'CEBS Escalation',
                              date: controller.task.value!.cebs!.escalationForm!.createdAt,
                              user: controller.task.value!.cebs!.escalationForm!.user,
                              onClick: () async {
                                await Get.to(EscalationViewWidget(form: controller.task.value!.cebs!.escalationForm!, type: 'CEBS'));
                              },
                            ),
                          if (controller.task.value!.cebs!.summaryForm != null)
                            TaskFormItemWidget(
                              title: 'CEBS Summary',
                              date: controller.task.value!.cebs!.summaryForm!.createdAt,
                              user: controller.task.value!.cebs!.summaryForm!.user,
                              onClick: () async {
                                await Get.to(SummaryViewWidget(form: controller.task.value!.cebs!.summaryForm!, type: 'CEBS'));
                              },
                            ),
                          if (controller.task.value!.cebs!.labForm != null)
                            TaskFormItemWidget(
                              title: 'CEBS Lab Results',
                              date: controller.task.value!.cebs!.labForm!.createdAt,
                              user: controller.task.value!.cebs!.labForm!.user,
                              onClick: () async {
                                await Get.to(LabViewWidget(
                                  form: controller.task.value!.cebs!.labForm!,
                                  type: 'CEBS',
                                  signalId: controller.task.value!.signalId,
                                ));
                              },
                            ),
                        ],
                        if (controller.task.value!.hebs != null) ...[
                          if (controller.task.value!.hebs!.verificationForm != null)
                            TaskFormItemWidget(
                              title: 'HEBS Verification',
                              date: controller.task.value!.hebs!.verificationForm!.createdAt,
                              user: controller.task.value!.hebs!.verificationForm!.user,
                              onClick: () async {
                                await Get.to(VerificationViewWidget(form: controller.task.value!.hebs!.verificationForm!, type: 'HEBS'));
                              },
                            ),
                          if (controller.task.value!.hebs!.investigationForm != null)
                            TaskFormItemWidget(
                              title: 'HEBS Risk Assessment',
                              date: controller.task.value!.hebs!.investigationForm!.createdAt,
                              user: controller.task.value!.hebs!.investigationForm!.user,
                              onClick: () async {
                                await Get.to(InvestigationViewWidget(form: controller.task.value!.hebs!.investigationForm!, type: 'HEBS'));
                              },
                            ),
                          if (controller.task.value!.hebs!.responseForm != null)
                            TaskFormItemWidget(
                              title: 'HEBS Response',
                              date: controller.task.value!.hebs!.responseForm!.createdAt,
                              user: controller.task.value!.hebs!.responseForm!.user,
                              onClick: () async {
                                await Get.to(ResponseViewWidget(form: controller.task.value!.hebs!.responseForm!, type: 'HEBS'));
                              },
                            ),
                          if (controller.task.value!.hebs!.escalationForm != null)
                            TaskFormItemWidget(
                              title: 'HEBS Escalation',
                              date: controller.task.value!.hebs!.escalationForm!.createdAt,
                              user: controller.task.value!.hebs!.escalationForm!.user,
                              onClick: () async {
                                await Get.to(EscalationViewWidget(form: controller.task.value!.hebs!.escalationForm!, type: 'HEBS'));
                              },
                            ),
                          if (controller.task.value!.hebs!.summaryForm != null)
                            TaskFormItemWidget(
                              title: 'HEBS Summary',
                              date: controller.task.value!.hebs!.summaryForm!.createdAt,
                              user: controller.task.value!.hebs!.summaryForm!.user,
                              onClick: () async {
                                await Get.to(SummaryViewWidget(form: controller.task.value!.hebs!.summaryForm!, type: 'HEBS'));
                              },
                            ),
                          if (controller.task.value!.hebs!.labForm != null)
                            TaskFormItemWidget(
                              title: 'HEBS Lab Results',
                              date: controller.task.value!.hebs!.labForm!.createdAt,
                              user: controller.task.value!.hebs!.labForm!.user,
                              onClick: () async {
                                await Get.to(LabViewWidget(
                                  form: controller.task.value!.hebs!.labForm!,
                                  type: 'HEBS',
                                  signalId: controller.task.value!.signalId,
                                ));
                              },
                            ),
                        ],
                        if (controller.task.value!.vebs != null) ...[
                          if (controller.task.value!.vebs!.verificationForm != null)
                            TaskFormItemWidget(
                              title: 'VEBS Verification',
                              date: controller.task.value!.vebs!.verificationForm!.createdAt,
                              user: controller.task.value!.vebs!.verificationForm!.user,
                              onClick: () async {
                                await Get.to(VerificationViewWidget(
                                  type: 'VEBS',
                                  form: controller.task.value!.vebs!.verificationForm!,
                                ));
                              },
                            ),
                          if (controller.task.value!.vebs!.investigationForm != null)
                            TaskFormItemWidget(
                              title: 'VEBS Risk Assessment',
                              date: controller.task.value!.vebs!.investigationForm!.createdAt,
                              user: controller.task.value!.vebs!.investigationForm!.user,
                              onClick: () async {
                                await Get.to(InvestigationViewWidget(
                                  type: 'VEBS',
                                  form: controller.task.value!.vebs!.investigationForm!,
                                ));
                              },
                            ),
                          if (controller.task.value!.vebs!.responseForm != null)
                            TaskFormItemWidget(
                              title: 'VEBS Response',
                              date: controller.task.value!.vebs!.responseForm!.createdAt,
                              user: controller.task.value!.vebs!.responseForm!.user,
                              onClick: () async {
                                await Get.to(ResponseViewWidget(
                                  type: 'VEBS',
                                  form: controller.task.value!.vebs!.responseForm!,
                                ));
                              },
                            ),
                          if (controller.task.value!.vebs!.escalationForm != null)
                            TaskFormItemWidget(
                              title: 'VEBS Escalation',
                              date: controller.task.value!.vebs!.escalationForm!.createdAt,
                              user: controller.task.value!.vebs!.escalationForm!.user,
                              onClick: () async {
                                await Get.to(EscalationViewWidget(
                                  type: 'VEBS',
                                  form: controller.task.value!.vebs!.escalationForm!,
                                ));
                              },
                            ),
                          if (controller.task.value!.vebs!.summaryForm != null)
                            TaskFormItemWidget(
                              title: 'VEBS Summary',
                              date: controller.task.value!.vebs!.summaryForm!.createdAt,
                              user: controller.task.value!.vebs!.summaryForm!.user,
                              onClick: () async {
                                await Get.to(SummaryViewWidget(form: controller.task.value!.vebs!.summaryForm!, type: 'VEBS'));
                              },
                            ),
                          if (controller.task.value!.vebs!.labForm != null)
                            TaskFormItemWidget(
                              title: 'VEBS Lab Results',
                              date: controller.task.value!.vebs!.labForm!.createdAt,
                              user: controller.task.value!.vebs!.labForm!.user,
                              onClick: () async {
                                await Get.to(LabViewWidget(
                                  form: controller.task.value!.vebs!.labForm!,
                                  type: 'VEBS',
                                  signalId: controller.task.value!.signalId,
                                ));
                              },
                            ),
                        ],
                        if (controller.task.value!.lebs != null) ...[
                          if (controller.task.value!.lebs!.verificationForm != null)
                            TaskFormItemWidget(
                              title: 'LEBS Verification',
                              date: controller.task.value!.lebs!.verificationForm!.createdAt,
                              user: controller.task.value!.lebs!.verificationForm!.user,
                              onClick: () async {
                                await Get.to(LebsVerificationViewWidget(
                                  form: controller.task.value!.lebs!.verificationForm!,
                                ));
                              },
                            ),
                          if (controller.task.value!.lebs!.investigationForm != null)
                            TaskFormItemWidget(
                              title: 'LEBS Risk Assessment',
                              date: controller.task.value!.lebs!.investigationForm!.createdAt,
                              user: controller.task.value!.lebs!.investigationForm!.user,
                              onClick: () async {
                                await Get.to(LebsInvestigationViewWidget(
                                  form: controller.task.value!.lebs!.investigationForm!,
                                ));
                              },
                            ),
                          if (controller.task.value!.lebs!.responseForm != null)
                            TaskFormItemWidget(
                              title: 'LEBS Response',
                              date: controller.task.value!.lebs!.responseForm!.createdAt,
                              user: controller.task.value!.lebs!.responseForm!.user,
                              onClick: () async {
                                await Get.to(LebsResponseViewWidget(
                                  form: controller.task.value!.lebs!.responseForm!,
                                ));
                              },
                            ),
                          if (controller.task.value!.lebs!.escalationForm != null)
                            TaskFormItemWidget(
                              title: 'LEBS Escalation',
                              date: controller.task.value!.lebs!.escalationForm!.createdAt,
                              user: controller.task.value!.lebs!.escalationForm!.user,
                              onClick: () async {
                                await Get.to(LebsEscalationViewWidget(
                                  form: controller.task.value!.lebs!.escalationForm!,
                                ));
                              },
                            ),
                          if (controller.task.value!.lebs!.summaryForm != null)
                            TaskFormItemWidget(
                              title: 'LEBS Summary',
                              date: controller.task.value!.lebs!.summaryForm!.createdAt,
                              user: controller.task.value!.lebs!.summaryForm!.user,
                              onClick: () async {
                                await Get.to(LebsSummaryViewWidget(form: controller.task.value!.lebs!.summaryForm!));
                              },
                            ),
                          if (controller.task.value!.lebs!.labForm != null)
                            TaskFormItemWidget(
                              title: 'LEBS Lab Results',
                              date: controller.task.value!.lebs!.labForm!.createdAt,
                              user: controller.task.value!.lebs!.labForm!.user,
                              onClick: () async {
                                await Get.to(LebsLabViewWidget(
                                  form: controller.task.value!.lebs!.labForm!,
                                  signalId: controller.task.value!.signalId,
                                ));
                              },
                            ),
                        ],
                      ],
                    ),
                  ),
          ),
        ));
}
