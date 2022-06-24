import 'package:flutter/material.dart';

class MyGridScreen extends StatefulWidget {
  const MyGridScreen({Key? key}) : super(key: key);

  @override
  _MyGridScreenState createState() => _MyGridScreenState();
}

class _MyGridScreenState extends State<MyGridScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter GridView Demo"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
          child: GridView.extent(
        primary: false,
        padding: const EdgeInsets.all(16),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        maxCrossAxisExtent: 200.0,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [Text("uno")],
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/Stitch.png"), fit: BoxFit.cover),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text('Second', style: TextStyle(fontSize: 20)),
            color: Colors.blue,
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text('Third', style: TextStyle(fontSize: 20)),
            color: Colors.blue,
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text('Four', style: TextStyle(fontSize: 20)),
            color: Colors.blue,
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text('Fifth', style: TextStyle(fontSize: 20)),
            color: Colors.blue,
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text('Fifth', style: TextStyle(fontSize: 20)),
            color: Colors.blue,
          ),
        ],
      )),
    );
  }
}
