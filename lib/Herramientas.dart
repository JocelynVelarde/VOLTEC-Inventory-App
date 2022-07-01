import 'package:flutter/material.dart';

class Herramientas extends StatefulWidget {
  const Herramientas({Key? key}) : super(key: key);

  @override
  _Herramientas createState() => _Herramientas();
}

class _Herramientas extends State<Herramientas> {
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
