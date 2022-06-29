import 'package:flutter/material.dart';

class Mecanica extends StatefulWidget {
  const Mecanica({Key? key}) : super(key: key);

  @override
  _Mecanica createState() => _Mecanica();
}

class _Mecanica extends State<Mecanica> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("VOLTEC App Inventario"),
        actions: [
          IconButton(
              icon: Icon(Icons.account_box_rounded),
              onPressed: () {
                //Navigator.pop(context);
              }),
        ],
        backgroundColor: const Color.fromARGB(255, 12, 107, 185),
      ),
    );
  }
}
