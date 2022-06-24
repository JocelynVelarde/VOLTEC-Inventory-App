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
        title: Text("VOLTEC App Inventario"),
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
            padding:
                const EdgeInsets.only(top: 140, bottom: 0, left: 0, right: 0),
            child: Stack(children: [
              Container(
                width: 150,
                height: 20,
                color: Colors.white.withOpacity(0.5),
                child: Text(
                  "Herramientas",
                  textAlign: TextAlign.center,
                ),
              )
            ]),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/Herramientas.jpeg"),
                  fit: BoxFit.cover),
            ),
          ),
          Container(
            padding:
                const EdgeInsets.only(top: 140, bottom: 0, left: 0, right: 0),
            child: Stack(children: [
              Container(
                width: 50,
                height: 20,
                color: Colors.white.withOpacity(0.5),
                child: Text("Refacciones"),
              )
            ]),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/Stitch.png"), fit: BoxFit.cover),
            ),
          ),
          Container(
            padding:
                const EdgeInsets.only(top: 140, bottom: 0, left: 0, right: 0),
            child: Stack(children: [
              Container(
                width: 50,
                height: 20,
                color: Colors.white.withOpacity(0.5),
                child: Text("Mecanica"),
              )
            ]),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/Stitch.png"), fit: BoxFit.cover),
            ),
          ),
          Container(
            padding:
                const EdgeInsets.only(top: 140, bottom: 0, left: 0, right: 0),
            child: Stack(children: [
              Container(
                width: 50,
                height: 20,
                color: Colors.white.withOpacity(0.5),
                child: Text("Electrica y Neumatica"),
              )
            ]),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/Stitch.png"), fit: BoxFit.cover),
            ),
          ),
          Container(
            padding:
                const EdgeInsets.only(top: 140, bottom: 0, left: 0, right: 0),
            child: Stack(children: [
              Container(
                width: 50,
                height: 20,
                color: Colors.white.withOpacity(0.5),
                child: Text("Lego Mindstorms"),
              )
            ]),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/Stitch.png"), fit: BoxFit.cover),
            ),
          ),
          Container(
            padding:
                const EdgeInsets.only(top: 140, bottom: 0, left: 0, right: 0),
            child: Stack(children: [
              Container(
                width: 50,
                height: 20,
                color: Colors.white.withOpacity(0.5),
                child: Text("Otros"),
              )
            ]),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/Stitch.png"), fit: BoxFit.cover),
            ),
          ),
        ],
      )),
    );
  }
}
