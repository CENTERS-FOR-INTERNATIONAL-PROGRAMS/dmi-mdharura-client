import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:m_dharura/constant/form.dart';
import 'package:m_dharura/constant/routes.dart';
import 'package:m_dharura/helper/signal.dart';
import 'package:m_dharura/helper/util.dart';
import 'package:m_dharura/model/task.dart';
import 'package:m_dharura/model/task_form_item.dart';
import 'package:m_dharura/ui/_/item/task_form_item_widget.dart';
import 'package:m_dharura/ui/_/item/unit_item_widget.dart';

class TaskItemWidget extends StatelessWidget {
  final Task task;
  final bool isActionable;
  final Function? refresh;

  const TaskItemWidget({
    Key? key,
    required this.task,
    this.isActionable = false,
    this.refresh,
  }) : super(key: key);

  List<TaskFormItem> _items() {
    if (task.pmebs != null && task.unit.type == 'Subcounty') {
      return [
        TaskFormItem(
          title: 'PEBS/MEBS Verification Request',
          date: null,
          user: null,
          onClick: !isActionable || (task.lebs != null && task.lebs?.verificationForm != null)
              ? null
              : () async {
                  await Get.toNamed('${Routes.kForm}${FormType.kPMEBS}/${FormType.kRequest}', arguments: {'signalId': task.signalId});

                  refresh!();
                },
        ),
      ];
    } else if (task.signal.startsWith('l') || task.signal.startsWith('p') || task.signal.startsWith('m')) {
      return [
        TaskFormItem(
          title: 'LEBS Summary',
          date: task.lebs != null && task.lebs?.summaryForm != null ? task.lebs?.summaryForm?.createdAt : null,
          user: task.lebs != null && task.lebs?.investigationForm != null ? task.lebs?.summaryForm?.user : null,
          onClick: !isActionable || task.lebs == null || (task.lebs != null && (task.lebs?.summaryForm != null || task.lebs?.investigationForm == null))
              ? null
              : () async {
                  await Get.toNamed('${Routes.kForm}${FormType.kLEBS}/${FormType.kSummary}', arguments: {'signalId': task.signalId});

                  refresh!();
                },
        ),
        TaskFormItem(
          title: 'LEBS Lab',
          date: task.lebs != null && task.lebs?.labForm != null ? task.lebs?.labForm?.createdAt : null,
          user: task.lebs != null && task.lebs?.investigationForm != null && task.lebs?.investigationForm?.isSamplesCollected != "N/A"
              ? task.lebs?.labForm?.user
              : null,
          onClick: !isActionable || task.lebs == null || (task.lebs != null && (task.lebs?.labForm != null || task.lebs?.investigationForm == null))
              ? null
              : () async {
                  await Get.toNamed('${Routes.kForm}${FormType.kLEBS}/${FormType.kLab}', arguments: {'signalId': task.signalId});

                  refresh!();
                },
        ),
        TaskFormItem(
          title: 'LEBS Response',
          date: task.lebs != null && task.lebs?.responseForm != null ? task.lebs?.responseForm?.createdAt : null,
          user: task.lebs != null && task.lebs?.responseForm != null ? task.lebs?.responseForm?.user : null,
          onClick: !isActionable || task.lebs == null || (task.lebs != null && (task.lebs?.responseForm != null || task.lebs?.investigationForm == null))
              ? null
              : () async {
                  await Get.toNamed('${Routes.kForm}${FormType.kLEBS}/${FormType.kResponse}', arguments: {'signalId': task.signalId});

                  refresh!();
                },
        ),
        TaskFormItem(
          title: 'LEBS Risk Assessment',
          date: task.lebs != null && task.lebs?.investigationForm != null ? task.lebs?.investigationForm?.createdAt : null,
          user: task.lebs != null && task.lebs?.investigationForm != null ? task.lebs?.investigationForm?.user : null,
          onClick: !isActionable || task.lebs == null || (task.lebs != null && (task.lebs?.investigationForm != null || task.lebs?.verificationForm == null))
              ? null
              : () async {
                  await Get.toNamed('${Routes.kForm}${FormType.kLEBS}/${FormType.kInvestigation}', arguments: {'signalId': task.signalId});

                  refresh!();
                },
        ),
        TaskFormItem(
          title: 'LEBS Verification',
          date: task.lebs != null && task.lebs?.verificationForm != null ? task.lebs?.verificationForm?.createdAt : null,
          user: task.lebs != null && task.lebs?.verificationForm != null ? task.lebs?.verificationForm?.user : null,
          onClick: !isActionable || (task.lebs != null && task.lebs?.verificationForm != null)
              ? null
              : () async {
                  await Get.toNamed('${Routes.kForm}${FormType.kLEBS}/${FormType.kVerification}', arguments: {'signalId': task.signalId});

                  refresh!();
                },
        ),
      ];
    } else if (task.signal.startsWith('h')) {
      return [
        TaskFormItem(
          title: 'HEBS Lab',
          date: task.hebs != null && task.hebs?.labForm != null ? task.hebs?.labForm?.createdAt : null,
          user: task.hebs != null && task.hebs?.investigationForm != null && task.hebs?.investigationForm?.isLabSamplesCollected != "N/A"
              ? task.hebs?.labForm?.user
              : null,
          onClick: !isActionable || task.hebs == null || (task.hebs != null && (task.hebs?.labForm != null || task.hebs?.investigationForm == null))
              ? null
              : () async {
                  await Get.toNamed('${Routes.kForm}${FormType.kHEBS}/${FormType.kLab}', arguments: {'signalId': task.signalId});

                  refresh!();
                },
        ),
        TaskFormItem(
          title: 'HEBS Summary',
          date: task.hebs != null && task.hebs?.summaryForm != null ? task.hebs?.summaryForm?.createdAt : null,
          user: task.hebs != null && task.hebs?.investigationForm != null ? task.hebs?.summaryForm?.user : null,
          onClick: !isActionable || task.hebs == null || (task.hebs != null && (task.hebs?.summaryForm != null || task.hebs?.investigationForm == null))
              ? null
              : () async {
                  await Get.toNamed('${Routes.kForm}${FormType.kHEBS}/${FormType.kSummary}', arguments: {'signalId': task.signalId});

                  refresh!();
                },
        ),
        TaskFormItem(
          title: 'HEBS Escalation',
          date: task.hebs != null && task.hebs?.escalationForm != null ? task.hebs?.escalationForm?.createdAt : null,
          user: task.hebs != null && task.hebs?.escalationForm != null ? task.hebs?.escalationForm?.user : null,
          onClick: !isActionable || task.hebs == null || (task.hebs != null && (task.hebs?.escalationForm != null || task.hebs?.responseForm == null))
              ? null
              : () async {
                  await Get.toNamed('${Routes.kForm}${FormType.kHEBS}/${FormType.kEscalation}', arguments: {'signalId': task.signalId});

                  refresh!();
                },
        ),
        TaskFormItem(
          title: 'HEBS Response',
          date: task.hebs != null && task.hebs?.responseForm != null ? task.hebs?.responseForm?.createdAt : null,
          user: task.hebs != null && task.hebs?.responseForm != null ? task.hebs?.responseForm?.user : null,
          onClick: !isActionable || task.hebs == null || (task.hebs != null && (task.hebs?.responseForm != null || task.hebs?.investigationForm == null))
              ? null
              : () async {
                  await Get.toNamed('${Routes.kForm}${FormType.kHEBS}/${FormType.kResponse}', arguments: {'signalId': task.signalId});

                  refresh!();
                },
        ),
        TaskFormItem(
          title: 'HEBS Risk Assessment',
          date: task.hebs != null && task.hebs?.investigationForm != null ? task.hebs?.investigationForm?.createdAt : null,
          user: task.hebs != null && task.hebs?.investigationForm != null ? task.hebs?.investigationForm?.user : null,
          onClick: !isActionable || task.hebs == null || (task.hebs != null && (task.hebs?.investigationForm != null || task.hebs?.verificationForm == null))
              ? null
              : () async {
                  await Get.toNamed('${Routes.kForm}${FormType.kHEBS}/${FormType.kInvestigation}', arguments: {'signalId': task.signalId});

                  refresh!();
                },
        ),
        TaskFormItem(
          title: 'HEBS Verification',
          date: task.hebs != null && task.hebs?.verificationForm != null ? task.hebs?.verificationForm?.createdAt : null,
          user: task.hebs != null && task.hebs?.verificationForm != null ? task.hebs?.verificationForm?.user : null,
          onClick: !isActionable || (task.hebs != null && task.hebs?.verificationForm != null)
              ? null
              : () async {
                  await Get.toNamed('${Routes.kForm}${FormType.kHEBS}/${FormType.kVerification}', arguments: {'signalId': task.signalId});

                  refresh!();
                },
        ),
      ];
    } else if (task.signal.startsWith('v')) {
      return [
        TaskFormItem(
          title: 'VEBS Summary',
          date: task.vebs != null && task.vebs?.summaryForm != null ? task.vebs?.summaryForm?.createdAt : null,
          user: task.vebs != null && task.vebs?.investigationForm != null ? task.vebs?.summaryForm?.user : null,
          onClick: !isActionable || task.vebs == null || (task.vebs != null && (task.vebs?.summaryForm != null || task.vebs?.investigationForm == null))
              ? null
              : () async {
                  await Get.toNamed('${Routes.kForm}${FormType.kVEBS}/${FormType.kSummary}', arguments: {'signalId': task.signalId});

                  refresh!();
                },
        ),
        TaskFormItem(
          title: 'VEBS Lab',
          date: task.vebs != null && task.vebs?.labForm != null ? task.vebs?.labForm?.createdAt : null,
          user: task.vebs != null && task.vebs?.investigationForm != null && task.vebs?.investigationForm?.isLabSamplesCollected != "N/A"
              ? task.vebs?.labForm?.user
              : null,
          onClick: !isActionable || task.vebs == null || (task.vebs != null && (task.vebs?.labForm != null || task.vebs?.investigationForm == null))
              ? null
              : () async {
                  await Get.toNamed('${Routes.kForm}${FormType.kVEBS}/${FormType.kLab}', arguments: {'signalId': task.signalId});

                  refresh!();
                },
        ),
        TaskFormItem(
          title: 'VEBS Escalation',
          date: task.vebs != null && task.vebs?.escalationForm != null ? task.vebs?.escalationForm?.createdAt : null,
          user: task.vebs != null && task.vebs?.escalationForm != null ? task.vebs?.escalationForm?.user : null,
          onClick: !isActionable || task.vebs == null || (task.vebs != null && (task.vebs?.escalationForm != null || task.vebs?.responseForm == null))
              ? null
              : () async {
                  await Get.toNamed('${Routes.kForm}${FormType.kVEBS}/${FormType.kEscalation}', arguments: {'signalId': task.signalId});

                  refresh!();
                },
        ),
        TaskFormItem(
          title: 'VEBS Response',
          date: task.vebs != null && task.vebs?.responseForm != null ? task.vebs?.responseForm?.createdAt : null,
          user: task.vebs != null && task.vebs?.responseForm != null ? task.vebs?.responseForm?.user : null,
          onClick: !isActionable || task.vebs == null || (task.vebs != null && (task.vebs?.responseForm != null || task.vebs?.investigationForm == null))
              ? null
              : () async {
                  await Get.toNamed('${Routes.kForm}${FormType.kVEBS}/${FormType.kResponse}', arguments: {'signalId': task.signalId});

                  refresh!();
                },
        ),
        TaskFormItem(
          title: 'VEBS Risk Assessment',
          date: task.vebs != null && task.vebs?.investigationForm != null ? task.vebs?.investigationForm?.createdAt : null,
          user: task.vebs != null && task.vebs?.investigationForm != null ? task.vebs?.investigationForm?.user : null,
          onClick: !isActionable || task.vebs == null || (task.vebs != null && (task.vebs?.investigationForm != null || task.vebs?.verificationForm == null))
              ? null
              : () async {
                  await Get.toNamed('${Routes.kForm}${FormType.kVEBS}/${FormType.kInvestigation}', arguments: {'signalId': task.signalId});

                  refresh!();
                },
        ),
        TaskFormItem(
          title: 'VEBS Verification',
          date: task.vebs != null && task.vebs?.verificationForm != null ? task.vebs?.verificationForm?.createdAt : null,
          user: task.vebs != null && task.vebs?.verificationForm != null ? task.vebs?.verificationForm?.user : null,
          onClick: !isActionable || (task.vebs != null && task.vebs?.verificationForm != null)
              ? null
              : () async {
                  await Get.toNamed('${Routes.kForm}${FormType.kVEBS}/${FormType.kVerification}', arguments: {'signalId': task.signalId});

                  refresh!();
                },
        ),
      ];
    } else {
      return [
        TaskFormItem(
          title: 'CEBS Summary',
          date: task.cebs != null && task.cebs?.summaryForm != null ? task.cebs?.summaryForm?.createdAt : null,
          user: task.cebs != null && task.cebs?.investigationForm != null ? task.cebs?.summaryForm?.user : null,
          onClick: !isActionable || task.cebs == null || (task.cebs != null && (task.cebs?.summaryForm != null || task.cebs?.investigationForm == null))
              ? null
              : () async {
                  await Get.toNamed('${Routes.kForm}${FormType.kCEBS}/${FormType.kSummary}', arguments: {'signalId': task.signalId});

                  refresh!();
                },
        ),
        TaskFormItem(
          title: 'CEBS Lab',
          date: task.cebs != null && task.cebs?.labForm != null ? task.cebs?.labForm?.createdAt : null,
          user: task.cebs != null && task.cebs?.investigationForm != null && task.cebs?.investigationForm?.isLabSamplesCollected != "N/A"
              ? task.cebs?.labForm?.user
              : null,
          onClick: !isActionable || task.cebs == null || (task.cebs != null && (task.cebs?.labForm != null || task.cebs?.investigationForm == null))
              ? null
              : () async {
                  await Get.toNamed('${Routes.kForm}${FormType.kCEBS}/${FormType.kLab}', arguments: {'signalId': task.signalId});

                  refresh!();
                },
        ),
        TaskFormItem(
          title: 'CEBS Escalation',
          date: task.cebs != null && task.cebs?.escalationForm != null ? task.cebs?.escalationForm?.createdAt : null,
          user: task.cebs != null && task.cebs?.escalationForm != null ? task.cebs?.escalationForm?.user : null,
          onClick: !isActionable || task.cebs == null || (task.cebs != null && (task.cebs?.escalationForm != null || task.cebs?.responseForm == null))
              ? null
              : () async {
                  await Get.toNamed('${Routes.kForm}${FormType.kCEBS}/${FormType.kEscalation}', arguments: {'signalId': task.signalId});

                  refresh!();
                },
        ),
        TaskFormItem(
          title: 'CEBS Response',
          date: task.cebs != null && task.cebs?.responseForm != null ? task.cebs?.responseForm?.createdAt : null,
          user: task.cebs != null && task.cebs?.responseForm != null ? task.cebs?.responseForm?.user : null,
          onClick: !isActionable || task.cebs == null || (task.cebs != null && (task.cebs?.responseForm != null || task.cebs?.investigationForm == null))
              ? null
              : () async {
                  await Get.toNamed('${Routes.kForm}${FormType.kCEBS}/${FormType.kResponse}', arguments: {'signalId': task.signalId});

                  refresh!();
                },
        ),
        TaskFormItem(
          title: 'CEBS Risk Assessment',
          date: task.cebs != null && task.cebs?.investigationForm != null ? task.cebs?.investigationForm?.createdAt : null,
          user: task.cebs != null && task.cebs?.investigationForm != null ? task.cebs?.investigationForm?.user : null,
          onClick: !isActionable || task.cebs == null || (task.cebs != null && (task.cebs?.investigationForm != null || task.cebs?.verificationForm == null))
              ? null
              : () async {
                  await Get.toNamed('${Routes.kForm}${FormType.kCEBS}/${FormType.kInvestigation}', arguments: {'signalId': task.signalId});

                  refresh!();
                },
        ),
        TaskFormItem(
          title: 'CEBS Verification',
          date: task.cebs != null && task.cebs?.verificationForm != null ? task.cebs?.verificationForm?.createdAt : null,
          user: task.cebs != null && task.cebs?.verificationForm != null ? task.cebs?.verificationForm?.user : null,
          onClick: !isActionable || (task.cebs != null && task.cebs?.verificationForm != null)
              ? null
              : () async {
                  await Get.toNamed('${Routes.kForm}${FormType.kCEBS}/${FormType.kVerification}', arguments: {'signalId': task.signalId});

                  refresh!();
                },
        ),
      ];
    }
  }

  List<Widget> _lastTile() {
    var items = _items().reversed;

    if (items.isEmpty) return [Container()];

    try {
      if (task.status == 'pending') {
        return items
            .where((element) => element.user == null && element.onClick != null)
            .map((item) => TaskFormItemWidget(title: item.title, date: item.date, user: item.user, onClick: item.onClick, actionText: 'Submit'))
            .toList();
      } else {
        return items
            .where((element) => element.user != null)
            .map((item) => TaskFormItemWidget(title: item.title, date: item.date, user: item.user, onClick: item.onClick, actionText: 'Submit'))
            .toList();
      }
    } catch (e) {
      return [Container()];
    }
  }

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          border: Border.all(
            color: Colors.grey.shade200,
          ),
          color: task.state == 'test' ? Colors.grey.shade50 : Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListTile(
              title: GestureDetector(
                child: Text(
                  '${task.signal.toUpperCase()} · ${task.signalId} · ${task.status.capitalize}',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                onTap: () async {
                  await Clipboard.setData(ClipboardData(text: task.signalId));

                  Util.toast('${task.signalId} copied');
                },
              ),
              subtitle: Text(
                describeSignal(task.signal),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
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
                  task.state.capitalize ?? '',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: task.state == 'test' ? Colors.black : Theme.of(context).primaryColor,
                      ),
                ),
              ),
            ),
            if (task.pmebs != null)
              Container(
                margin: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: 8,
                ),
                child: Text(
                  'Hotline & Media Scanning',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            UnitItemWidget(
              unit: task.unit,
              isPrimary: false,
            ),
            ..._lastTile(),
            const SizedBox(
              height: 8,
            ),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: Colors.grey.shade200),
              child: Row(
                children: [
                  Expanded(
                    child: Text('Reported: ${Util.formatDate(
                      task.createdAt,
                      withTime: true,
                    )}'),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  ElevatedButton(
                    onPressed: () async => await Get.toNamed('${Routes.kTask}${task.id}'),
                    child: const Text('View'),
                  )
                ],
              ),
            ),
          ],
        ),
      );
}
