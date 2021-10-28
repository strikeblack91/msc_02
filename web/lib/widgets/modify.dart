import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class ModifyForm extends StatefulWidget {
  const ModifyForm({Key? key}) : super(key: key);

  @override
  _ModifyFormState createState() => _ModifyFormState();
}

class _ModifyFormState extends State<ModifyForm> {
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController usernameEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String username = "";
  String email = "";

  void modifyUser(email, username, password) async {
    final preferences = await SharedPreferences.getInstance();
    final id = preferences.getString("user_id");
    final response = await http.put(
      Uri.parse('http://localhost:4000/api/users/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'username': username,
        'role': 'user',
        'password': password,
      }),
    );
    if (response.statusCode == 200) {
      Navigator.pushReplacementNamed(context, '/profil/modify');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please make sure the form is valid')));
    }
  }

  void fetchUser() async {
    final preferences = await SharedPreferences.getInstance();
    final id = preferences.getString("user_id");
    final response =
        await http.get(Uri.parse('http://localhost:4000/api/users/$id'));

    if (response.statusCode != 200) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('User not found')));
      return;
    }
    Map<String, dynamic> user = jsonDecode(response.body);
    setState(() {
      username = user["data"]["username"];
      email = user["data"]["email"];
    });
  }

  void deleteUser() async {
    final preferences = await SharedPreferences.getInstance();
    final id = preferences.getString("user_id");
    final response =
        await http.delete(Uri.parse('http://localhost:4000/api/users/$id'));

    if (response.statusCode != 200) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('User not found')));
      return;
    }
    Navigator.pushReplacementNamed(context, '/');
  }

  @override
  void initState() {
    fetchUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
                controller: emailEditingController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: email,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a valid email';
                  }
                }),
            TextFormField(
                controller: usernameEditingController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: username,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a valid username';
                  }
                }),
            TextFormField(
                controller: passwordEditingController,
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'password',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a valid password';
                  }
                }),
            ElevatedButton(
              child: const Text('Modify'),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  modifyUser(
                      emailEditingController.text,
                      usernameEditingController.text,
                      passwordEditingController.text);
                }
              },
            ),
            ElevatedButton(
                child: const Text('Delete account'),
                onPressed: () => deleteUser())
          ],
        ));
  }
}
