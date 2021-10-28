import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class TimeSeriesChart extends StatefulWidget {
  const TimeSeriesChart({Key? key}) : super(key: key);
  @override
  State<TimeSeriesChart> createState() => _TimeSeriesChartState();
}
class _TimeSeriesChartState extends State<TimeSeriesChart> {

  final DateTime date;
  final double hoursWorked;

  _TimeSeriesChartState({
    DateTime? date,
    this.hoursWorked = 0,
  }) : date = date ?? DateTime.now();

@override
  Widget build(BuildContext context) {

    final List<_TimeSeriesChartState> timeSeriesData = [
      _TimeSeriesChartState(date: DateTime(2021, 1, 1), hoursWorked: 18.5),
      _TimeSeriesChartState(date: DateTime(2021, 2, 1), hoursWorked: 21),
      _TimeSeriesChartState(date: DateTime(2021, 3, 1), hoursWorked: 30),
      _TimeSeriesChartState(date: DateTime(2021, 4, 1), hoursWorked: 38),
      _TimeSeriesChartState(date: DateTime(2021, 5, 1), hoursWorked: 42),
      _TimeSeriesChartState(date: DateTime(2021, 6, 1), hoursWorked: 32),
      _TimeSeriesChartState(date: DateTime(2021, 7, 1), hoursWorked: 26),
      _TimeSeriesChartState(date: DateTime(2021, 8, 1), hoursWorked: 18),
      _TimeSeriesChartState(date: DateTime(2021, 9, 1), hoursWorked: 24),
      _TimeSeriesChartState(date: DateTime(2021, 10, 1), hoursWorked: 40),
      _TimeSeriesChartState(date: DateTime(2021, 11, 1), hoursWorked: 42),
      _TimeSeriesChartState(date: DateTime(2021, 12, 1), hoursWorked: 58),
    ];

    List<charts.Series<_TimeSeriesChartState, DateTime>> timeSeries = [
      charts.Series(
        id: "Subscribers",
        data: timeSeriesData,
        domainFn: (_TimeSeriesChartState timeline, _) => timeline.date,
        measureFn: (_TimeSeriesChartState timeline, _) => timeline.hoursWorked,
      )
    ];

    return Container(
      padding: const EdgeInsets.only(left: 100.0, right: 100.0),
      width: MediaQuery.of(context).size.width * 0.50,
      height: MediaQuery.of(context).size.height * 0.50,
      child: charts.TimeSeriesChart(timeSeries, animate: true),
    );
  }
}
