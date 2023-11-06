import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_dharura/ui/_/date_widget.dart';
import 'package:m_dharura/ui/_/input_widget.dart';
import 'package:m_dharura/ui/_/responsive_widget.dart';
import 'package:m_dharura/ui/_/select_widget.dart';
import 'package:m_dharura/ui/form/pmebs/request/pmebs_request_form_controller.dart';

class PmebsRequestFormWidget
    extends ResponsiveWidget<PmebsRequestFormController> {
  final String? signalId;

  PmebsRequestFormWidget({Key? key, this.signalId}) : super(key: key);

  @override
  String get tag => 'form:pmebs:request $signalId';

  @override
  init() => Get.put(
        PmebsRequestFormController(signalId: signalId),
        tag: tag,
      );

  @override
  Widget? tablet() {
    return WillPopScope(
      onWillPop: () async {
        await controller.previous();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('PEBS and MEBS Request Form'),
          actions: controller.pages.last == 0
              ? []
              : [
                  TextButton(
                    child: const Text(
                      'Save',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () async => await controller.save(),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                ],
        ),
        body: NotificationListener<ScrollNotification>(
          onNotification: (scrollInfo) {
            if (scrollInfo.metrics.pixels ==
                scrollInfo.metrics.maxScrollExtent) {}

            return false;
          },
          child: Obx(() => Column(
                children: [
                  Expanded(
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        const SizedBox(
                          height: 16,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                          ),
                          child: [
                            InputWidget(
                              question: 'Signal ID',
                              hintText: 'Type...',
                              position: controller.pages.last,
                              total: controller.total,
                              value: controller.signal.value,
                              onChanged: (value) =>
                                  controller.signal.value = value,
                              lines: 1,
                              textCapitalization: TextCapitalization.characters,
                            ),
                            DateWidget(
                              onChanged: (value) => controller.form
                                  .update((val) => val?.dateRequested = value),
                              position: controller.pages.last,
                              question: 'When did the health threat start?',
                              value: controller.form.value.dateRequested,
                              total: controller.total,
                              hintText: 'Select date',
                            ),
                            Column(
                              children: [
                                SelectWidget(
                                  question: 'Select level',
                                  position: controller.pages.last,
                                  total: controller.total,
                                  values: controller.units.isEmpty ||
                                          controller.selectedUnit.value == null
                                      ? []
                                      : [controller.selectedUnit.value!.name],
                                  options: controller.units
                                      .map((e) => e.name)
                                      .toList(),
                                  onChanged: (String value) {
                                    int index = controller.units
                                        .indexWhere((e) => e.name == value);
                                    controller.selectedUnit.value =
                                        controller.units[index];
                                  },
                                ),
                                if (controller.isFetchingUnits.isTrue)
                                  Container(
                                    padding:
                                        const EdgeInsets.only(bottom: 12.0),
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 24.0,
                                          width: 24.0,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2.5,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                              ],
                            ),
                            InputWidget(
                              question: 'Locality',
                              hintText: 'Type...',
                              position: controller.pages.last,
                              total: controller.total,
                              value: controller.form.value.locality,
                              onChanged: (value) => controller.form
                                  .update((val) => val?.locality = value),
                            ),
                            InputWidget(
                              question:
                                  'Provide a brief description of the signal (What happened/Is happening?)',
                              hintText: 'Type...',
                              position: controller.pages.last,
                              total: controller.total,
                              value: controller.form.value.description,
                              onChanged: (value) => controller.form
                                  .update((val) => val?.description = value),
                            ),
                            DateWidget(
                              onChanged: (value) => controller.form
                                  .update((val) => val?.dateReported = value),
                              position: controller.pages.last,
                              question: 'Signal report date',
                              value: controller.form.value.dateReported,
                              total: controller.total,
                              hintText: 'Select date',
                            ),
                            const Padding(
                              padding: EdgeInsets.all(16),
                              child: Center(
                                child: Text(
                                  'This form is ready to be submitted',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ][controller.pages.last],
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 32,
                      horizontal: 16,
                    ),
                    child: Row(
                      children: [
                        controller.pages.last == 0
                            ? Container()
                            : Expanded(
                                child: OutlinedButton(
                                  child: const Text(
                                    'Previous',
                                  ),
                                  onPressed: () async =>
                                      await controller.previous(),
                                ),
                              ),
                        controller.pages.last == 0
                            ? Container()
                            : const SizedBox(
                                width: 16,
                              ),
                        Expanded(
                          child: ElevatedButton(
                            child: controller.isAdding.isTrue
                                ? const CircularProgressIndicator(
                                    backgroundColor: Colors.white,
                                    strokeWidth: 2,
                                  )
                                : Text(
                                    controller.pages.last < controller.total - 1
                                        ? 'Next'
                                        : 'Submit'),
                            onPressed: () {
                              controller.next();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
