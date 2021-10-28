import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:http/http.dart' as http;

class BarChart extends StatefulWidget {
  const BarChart({Key? key}) : super(key: key);
  @override
  State<BarChart> createState() => _BarChartState();
}

class _BarChartState extends State<BarChart> {

  final String month;
  final double hoursWorked;

  _BarChartState({
    this.month = "Janvier",
    this.hoursWorked = 0,
  });

  getData() async {

    // var result = await http.get(Uri.parse(''));
  }

@override
  Widget build(BuildContext context) {


    final List<_BarChartState> barData = [
      _BarChartState(month: "Janvier", hoursWorked: 18.5),
      _BarChartState(month: "Février", hoursWorked: 21),
      _BarChartState(month: "Mars", hoursWorked: 30),
      _BarChartState(month: "Avril", hoursWorked: 38),
      _BarChartState(month: "Mai", hoursWorked: 42),
      _BarChartState(month: "Juin", hoursWorked: 47),
      _BarChartState(month: "Juillet", hoursWorked: 54),
      _BarChartState(month: "Août", hoursWorked: 32),
      _BarChartState(month: "Septembre", hoursWorked: 7),
      _BarChartState(month: "Octobre", hoursWorked: 38),
      _BarChartState(month: "Novembre", hoursWorked: 49),
      _BarChartState(month: "Décembre", hoursWorked: 60),
    ];

    List<charts.Series<_BarChartState, String>> bar = [
      charts.Series(
        id: "Subscribers",
        data: barData,
        domainFn: (_BarChartState timeline, _) => timeline.month,
        measureFn: (_BarChartState timeline, _) => timeline.hoursWorked,
      )
    ];

    return Container(
      padding: const EdgeInsets.only(left: 100.0, right: 100.0),
      width: MediaQuery.of(context).size.width * 0.80,
      height: MediaQuery.of(context).size.height * 0.80,
      child: charts.BarChart(bar, animate: true),
    );
  }
}
