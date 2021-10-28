import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  void fetchUser(email) async {
    final response = await http
        .get(Uri.parse('http://localhost:4000/api/usersByMail?email=$email'));

    if (response.statusCode != 200) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('User not found')));
      return;
    }
    Map<String, dynamic> body = jsonDecode(response.body);
      final preferences = await SharedPreferences.getInstance();
      await preferences.setString('user_id', body["data"]["id"].toString());
      Navigator.pushReplacementNamed(context, '/profil');
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'e-mail',
        ),
        onSubmitted: (email) => fetchUser(email));
  }
}
