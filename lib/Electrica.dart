// ignore: file_names
import 'package:flutter/material.dart';

class Electrica extends StatefulWidget {
  const Electrica({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _Electrica createState() => _Electrica();
}

class _Electrica extends State<Electrica> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("VOLTEC App Inventario"),
        actions: [
          IconButton(
              icon: const Icon(Icons.account_box_rounded),
              onPressed: () {
                //Navigator.pop(context);
              }),
        ],
        backgroundColor: const Color.fromARGB(255, 12, 107, 185),
      ),
    );
  }
}
