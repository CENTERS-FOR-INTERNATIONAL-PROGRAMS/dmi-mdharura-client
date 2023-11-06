import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_dharura/ui/_/date_widget.dart';
import 'package:m_dharura/ui/_/input_widget.dart';
import 'package:m_dharura/ui/_/responsive_widget.dart';
import 'package:m_dharura/ui/_/select_widget.dart';
import 'package:m_dharura/ui/form/pmebs/report/pmebs_report_form_controller.dart';

class PmebsReportFormWidget
    extends ResponsiveWidget<PmebsReportFormController> {
  PmebsReportFormWidget({Key? key}) : super(key: key);

  @override
  String get tag => 'form:pmebs:report';

  @override
  init() => Get.put(
        PmebsReportFormController(),
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
          title: const Text('PEBS and MEBS Report Form'),
        ),
        body: NotificationListener<ScrollNotification>(
          onNotification: (scrollInfo) {
            if (scrollInfo.metrics.pixels ==
                scrollInfo.metrics.maxScrollExtent) {
              if (controller.pages.last == 3) controller.fetchUnits(false);
            }

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
                            SelectWidget(
                              question: 'Select event type',
                              position: controller.pages.last,
                              total: controller.total,
                              values: controller.type.value == null
                                  ? []
                                  : [controller.type.value!],
                              options: const [
                                'CEBS',
                                'LEBS',
                                'HEBS',
                                'VEBS',
                              ],
                              onChanged: (String value) =>
                                  controller.type.value = value,
                            ),
                            DateWidget(
                              onChanged: (value) => controller.form
                                  .update((val) => val?.dateDetected = value),
                              position: controller.pages.last,
                              question: 'When did the health threat start?',
                              value: controller.form.value.dateDetected,
                              total: controller.total,
                              hintText: 'Select date',
                            ),
                            SelectWidget(
                              question: 'What do you want to report?',
                              position: 2,
                              total: controller.total,
                              values: controller.signal.value == null
                                  ? []
                                  : [controller.signal.value!],
                              options: controller.signals
                                  .map((e) => e.description)
                                  .toList(),
                              labels: controller.signals
                                  .map((e) => e.code)
                                  .toList(),
                              onChanged: (String value) async {
                                controller.signal.value = controller.signals
                                    .firstWhere((element) =>
                                        element.description == value)
                                    .description;

                                controller.form.update((val) {
                                  val?.signal = controller.signals
                                      .firstWhere((element) =>
                                          element.description == value)
                                      .code;
                                });
                              },
                            ),
                            Column(
                              children: [
                                SelectWidget(
                                  question: 'Select county',
                                  position: controller.pages.last,
                                  total: controller.total,
                                  values: controller.counties.isEmpty ||
                                          controller.selectedCounty.value ==
                                              null
                                      ? []
                                      : [controller.selectedCounty.value!.name],
                                  options: controller.counties
                                      .map((e) => e.name)
                                      .toList(),
                                  onChanged: (String value) {
                                    int index = controller.counties
                                        .indexWhere((e) => e.name == value);
                                    controller.selectedCounty.value =
                                        controller.counties[index];
                                  },
                                ),
                                if (controller.isFetchingCounties.isTrue)
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
                            Column(
                              children: [
                                SelectWidget(
                                  question: 'Select subcounty',
                                  position: controller.pages.last,
                                  total: controller.total,
                                  values: controller.subCounties.isEmpty ||
                                          controller.selectedSubCounty.value ==
                                              null
                                      ? []
                                      : [
                                          controller
                                              .selectedSubCounty.value!.name
                                        ],
                                  options: controller.subCounties
                                      .map((e) => e.name)
                                      .toList(),
                                  onChanged: (String value) {
                                    int index = controller.subCounties
                                        .indexWhere((e) => e.name == value);

                                    controller.selectedSubCounty.value =
                                        controller.subCounties[index];
                                  },
                                ),
                                if (controller.isFetchingSubCounties.isTrue)
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
                            SelectWidget(
                              question: 'Source of signal',
                              position: controller.pages.last,
                              total: controller.total,
                              values: controller.form.value.source == null
                                  ? []
                                  : [controller.form.value.source!],
                              options: const [
                                'Print Media',
                                'Electronic Media',
                                'Social Media',
                                'Person',
                              ],
                              onChanged: (String value) => controller.form
                                  .update((val) => val?.source = value),
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
