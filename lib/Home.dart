// ignore: file_names
import "package:flutter/material.dart";

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const String title = "Titulo de la App";
    return MaterialApp(
      title: 'Titulo de la tab', //tipo la tab de google chrome
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
          backgroundColor: Colors.pink,
        ),
      ),
    );
  }
}
