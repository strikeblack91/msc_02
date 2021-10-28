import 'package:flutter/material.dart';
import 'package:web/widgets/register_form.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: RegisterForm()));
  }
}
