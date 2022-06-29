import 'package:flutter/material.dart';

class Lego extends StatefulWidget {
  const Lego({Key? key}) : super(key: key);

  @override
  _Lego createState() => _Lego();
}

class _Lego extends State<Lego> {
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
