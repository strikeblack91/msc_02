import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web/widgets/list_working_times.dart';
import 'package:web/widgets/charts/pie.dart';
import 'package:web/widgets/charts/bar.dart';
import 'package:web/widgets/charts/time_series.dart';

class Profil extends StatefulWidget {
  const Profil({Key? key}) : super(key: key);

  @override
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  String username = "";
  String id = "134567890";

  void fetchUser() async {
    final preferences = await SharedPreferences.getInstance();
    final id = preferences.getString("user_id");
    this.id = id.toString();
    final response =
        await http.get(Uri.parse('http://localhost:4000/api/users/$id'));

    if (response.statusCode != 200 || jsonDecode(response.body).isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('User not found')));
      return;
    }
    Map<String, dynamic> user = jsonDecode(response.body);
    setState(() {
      username = user["data"]["username"];
    });
  }

  @override
  void initState() {
    fetchUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
          icon: const Icon(Icons.person),
          onPressed: () => Navigator.pushNamed(context, '/profil/modify'),
        ),
        const SizedBox(width: 50),
      ], title: Text("Welcome $username"), automaticallyImplyLeading: false),
      body: ListView(children:[
        ListWorkingTimes(id: id),
        PieChart(),
        SizedBox(height: 100),
        TimeSeriesChart(),
        SizedBox(height: 100),
        BarChart()
      ]),
    );
  }
}
