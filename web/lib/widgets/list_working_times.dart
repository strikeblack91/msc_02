import 'package:flutter/material.dart';

class ListWorkingTimes extends StatefulWidget {
  const ListWorkingTimes({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  _ListWorkingTimesState createState() => _ListWorkingTimesState();
}

class _ListWorkingTimesState extends State<ListWorkingTimes> {
  // late List<String> id;

  void fetchWorkingTimes() async {}

  @override
  void initState() {
    // fetchWorkingTimes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const <Widget>[
        Text("Working time  "),
        Text("Working time  "),
        Text("Working time  "),
        Text("Working time  "),
        Text("Working time  "),
        Text("Working time  "),
        Text("Working time"),
      ],
    );
  }
}
