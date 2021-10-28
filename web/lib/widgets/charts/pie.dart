import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class PieChart extends StatefulWidget {
  const PieChart({Key? key}) : super(key: key);
  @override
  State<PieChart> createState() => _PieChartState();
}

class _PieChartState extends State<PieChart> {

  final int month;
  final int hoursWorked;

  _PieChartState({
    this.month = 1,
    this.hoursWorked = 0,
  });

@override
  Widget build(BuildContext context) {

    final List<_PieChartState> pieData = [
      _PieChartState(month: 1, hoursWorked: 5),
      _PieChartState(month: 2, hoursWorked: 21),
      _PieChartState(month: 3, hoursWorked: 30),
      _PieChartState(month: 4, hoursWorked: 16),
      _PieChartState(month: 5, hoursWorked: 42),
      _PieChartState(month: 6, hoursWorked: 48),
      _PieChartState(month: 7, hoursWorked: 22),
      _PieChartState(month: 8, hoursWorked: 17),
      _PieChartState(month: 9, hoursWorked: 35),
      _PieChartState(month: 10, hoursWorked: 45),
      _PieChartState(month: 11, hoursWorked: 38),
      _PieChartState(month: 12, hoursWorked: 70),
    ];

    List<charts.Series<_PieChartState, int>> pieChart = [
      charts.Series(
        id: "Subscribers",
        data: pieData,
        domainFn: (_PieChartState timeline, _) => timeline.month,
        measureFn: (_PieChartState timeline, _) => timeline.hoursWorked,
      )
    ];

    return Container(
      padding: const EdgeInsets.only(left: 100.0, right: 100.0),
      width: MediaQuery.of(context).size.width * 0.80,
      height: MediaQuery.of(context).size.height * 0.80,
      child: charts.PieChart(pieChart, animate: true),
    );
  }
}

