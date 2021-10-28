import 'package:flutter/material.dart';
import 'package:web/widgets/modify.dart';

class ProfilModify extends StatefulWidget {
  const ProfilModify({Key? key}) : super(key: key);

  @override
  _ProfilModifyState createState() => _ProfilModifyState();
}

class _ProfilModifyState extends State<ProfilModify> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profil"),
      ),
      body: const Center(child:ModifyForm(),),
    );
  }
}
