import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_dharura/helper/signal.dart';
import 'package:m_dharura/ui/_/dialog_widget.dart';
import 'package:m_dharura/ui/_/responsive_widget.dart';
import 'package:m_dharura/ui/_/select_widget.dart';
import 'package:m_dharura/ui/form/_/signal/signal_form_controller.dart';

class SignalFormWidget extends ResponsiveWidget<SignalFormController> {
  final String type;

  SignalFormWidget({
    Key? key,
    required this.type,
  }) : super(key: key);

  @override
  String get tag => 'form:$type:signal';

  @override
  init() => Get.put(
        SignalFormController(),
        tag: tag,
      );

  @override
  Widget? tablet() => Scaffold(
        appBar: AppBar(
          title: Text('${type.toUpperCase()} Signal'),
        ),
        body: Obx(
          () => Column(
            children: [
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 16.0),
                      child: SelectWidget(
                        question: 'What do you want to report?',
                        position: 0,
                        total: 1,
                        values: controller.form.value == null
                            ? []
                            : [
                                listSignals(type)
                                    .firstWhere((element) =>
                                        element.code == controller.form.value)
                                    .description
                              ],
                        options: listSignals(type)
                            .map((e) => e.description)
                            .toList(),
                        labels: listSignals(type).map((e) => e.code).toList(),
                        onChanged: (String value) async {
                          controller.form.value = listSignals(type)
                              .firstWhere(
                                  (element) => element.description == value)
                              .code;

                          await Get.dialog(
                            DialogWidget(
                              title:
                                  'Report ${type.toUpperCase()} Signal [${controller.form.value!.toUpperCase()}]?',
                              content:
                                  'You are about to report \'[${controller.form.value!.toUpperCase()}] ${listSignals(type).firstWhere((element) => element.code == controller.form.value).description}\'. Please confirm.',
                              onConfirm: () async {
                                await controller.report();
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              controller.isReporting.isTrue
                  ? const Padding(
                      padding: EdgeInsets.all(16),
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      );
}
