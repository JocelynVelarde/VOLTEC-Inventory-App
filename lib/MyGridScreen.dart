import 'package:app_la_buena/Home.dart';
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
        body: Stack(
      children: [
        Container(
            decoration: BoxDecoration(
                image: DecorationImage(
          colorFilter: ColorFilter.mode(
              Colors.blueGrey.withOpacity(0.5), BlendMode.srcOver),
          image: AssetImage(
            "assets/Fondo.JPG",
          ),
          fit: BoxFit.cover,
        ))),
        Center(
            child: GridView.extent(
          primary: false,
          padding: const EdgeInsets.all(16),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          maxCrossAxisExtent: 200.0,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                print("hi");
              },
              child: Container(
                padding: const EdgeInsets.only(
                    top: 140, bottom: 0, left: 0, right: 0),
                child: Stack(children: [
                  Container(
                    width: 190,
                    height: 20,
                    color: Colors.white.withOpacity(0.6),
                    child: Text(
                      "Herramientas",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                ]),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(14.0)),
                  image: DecorationImage(
                      image: AssetImage(
                        "assets/Herramientas.jpeg",
                      ),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                print("hola");
              },
              child: Container(
                padding: const EdgeInsets.only(
                    top: 140, bottom: 0, left: 0, right: 0),
                child: Stack(children: [
                  Container(
                    width: 190,
                    height: 20,
                    color: Colors.white.withOpacity(0.6),
                    child: Text(
                      "Consumibles",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                ]),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(14.0)),
                  image: DecorationImage(
                      image: AssetImage("assets/Refacciones.jpeg"),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            Container(
              padding:
                  const EdgeInsets.only(top: 140, bottom: 0, left: 0, right: 0),
              child: Stack(children: [
                Container(
                  width: 190,
                  height: 20,
                  color: Colors.white.withOpacity(0.6),
                  child: Text(
                    "Mecanica",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18),
                  ),
                )
              ]),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(14.0)),
                image: DecorationImage(
                    image: AssetImage("assets/Mecanica.jpg"),
                    fit: BoxFit.cover),
              ),
            ),
            Container(
              padding:
                  const EdgeInsets.only(top: 140, bottom: 0, left: 0, right: 0),
              child: Stack(children: [
                Container(
                  width: 190,
                  height: 20,
                  color: Colors.white.withOpacity(0.6),
                  child: Text(
                    "Electrica y Neumatica",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18),
                  ),
                )
              ]),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(14.0)),
                image: DecorationImage(
                    image: AssetImage("assets/Electrica.jpg"),
                    fit: BoxFit.cover),
              ),
            ),
            Container(
              padding:
                  const EdgeInsets.only(top: 140, bottom: 0, left: 0, right: 0),
              child: Stack(children: [
                Container(
                  width: 190,
                  height: 20,
                  color: Colors.white.withOpacity(0.6),
                  child: Text(
                    "Lego Mindstorms",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18),
                  ),
                )
              ]),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(14.0)),
                image: DecorationImage(
                    image: AssetImage("assets/Lego.jpeg"), fit: BoxFit.cover),
              ),
            ),
            Container(
              padding:
                  const EdgeInsets.only(top: 140, bottom: 0, left: 0, right: 0),
              child: Stack(children: [
                Container(
                  width: 190,
                  height: 20,
                  color: Colors.white.withOpacity(0.6),
                  child: Text(
                    "Viajes",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18),
                  ),
                )
              ]),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(14.0)),
                image: DecorationImage(
                    image: AssetImage("assets/Viajes.JPG"), fit: BoxFit.cover),
              ),
            ),
          ],
        )),
      ],
    ));
  }
}
