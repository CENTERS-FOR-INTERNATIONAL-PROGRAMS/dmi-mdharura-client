import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:m_dharura/helper/extension.dart';
import 'package:m_dharura/model/dashboard.dart';
import 'package:m_dharura/model/graph_item.dart';

class DashboardItemWidget extends StatelessWidget {
  final Dashboard dashboard;
  final int index;

  const DashboardItemWidget(
      {Key? key, required this.dashboard, required this.index})
      : super(key: key);

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
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
              ),
              padding: const EdgeInsets.all(16),
              child: Center(
                child: Text(
                  '$index. ${dashboard.title}',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
              height: dashboard.height ?? 320,
              margin: const EdgeInsets.all(16),
              child: charts.BarChart(
                dashboard.graphs!
                    .map(
                      (e) => charts.Series<GraphItem, String>(
                        id: e.id!,
                        domainFn: (GraphItem item, _) => item.name!,
                        measureFn: (GraphItem item, _) => item.value,
                        data: e.graphItems!,
                        colorFn: (_, __) =>
                            charts.ColorUtil.fromDartColor(e.color!.toColor()),
                      ),
                    )
                    .toList(),
                barGroupingType: charts.BarGroupingType.grouped,
                behaviors: [
                  charts.SlidingViewport(),
                  charts.PanAndZoomBehavior(),
                  charts.SeriesLegend(
                    desiredMaxColumns: dashboard.columns ?? 2,
                    outsideJustification: charts.OutsideJustification.start,
                    insideJustification: charts.InsideJustification.topStart,
                    showMeasures: true,
                  ),
                ],
                domainAxis: charts.OrdinalAxisSpec(
                  viewport: charts.OrdinalViewport('2021', 3),
                ),
              ),
            ),
          ],
        ),
      );
}
