import 'package:flutter/material.dart';

class Refacciones extends StatefulWidget {
  const Refacciones({Key? key}) : super(key: key);

  @override
  _Refacciones createState() => _Refacciones();
}

class _Refacciones extends State<Refacciones> {
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
