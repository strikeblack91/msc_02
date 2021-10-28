import 'package:flutter/material.dart';
import 'package:web/pages/home.dart';
import 'package:web/pages/register.dart';
import 'package:web/pages/login.dart';
import 'package:web/pages/profil.dart';
import 'package:web/pages/profil_modify.dart';


void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather',
      theme: ThemeData(colorScheme: const ColorScheme.dark()),
      routes: {
        '/': (context) => const Home(),
        '/login': (context) => const Login(),
        '/register': (context) => const Register(),
        '/profil': (context) => const Profil(),
        '/profil/modify': (context) => const ProfilModify(),
      },
    );
  }
}