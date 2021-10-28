import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Login'),
              onPressed: () => Navigator.pushNamed(context, '/login')
            ),
            ElevatedButton(
              child: const Text('Register'),
              onPressed: () => Navigator.pushNamed(context, '/register')
            )
          ],
        ),
      ),
    );
  }
}
