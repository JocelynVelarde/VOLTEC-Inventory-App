import 'package:app_la_buena/Electrica.dart';
import 'package:app_la_buena/Electrica_formulario.dart';
import 'package:app_la_buena/Neumatica.dart';

import 'package:flutter/material.dart';

class ElecNum extends StatefulWidget {
  const ElecNum({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ElecNumState createState() => _ElecNumState();
}

class _ElecNumState extends State<ElecNum> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Inventario Electrica y Neumatica"),
          actions: [
            IconButton(
                icon: const Icon(Icons.account_box_rounded),
                onPressed: () {
                  //Navigator.pop(context);
                }),
          ],
          backgroundColor: const Color.fromARGB(255, 0, 173, 238),
        ),
        body: Stack(
          children: [
            Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.6), BlendMode.srcOver),
              image: const AssetImage(
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
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => FeedbackListScreen_2()));
                  },
                  child: Container(
                    padding: const EdgeInsets.only(
                        top: 140, bottom: 0, left: 0, right: 0),
                    decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(14.0)),
                      image: DecorationImage(
                          colorFilter: ColorFilter.mode(
                              Colors.blueGrey.withOpacity(0.04),
                              BlendMode.srcOver),
                          image: const AssetImage("assets/FondoElec.jpg"),
                          fit: BoxFit.cover),
                    ),
                    child: Stack(children: [
                      Container(
                        width: 194,
                        height: 25,
                        color: Colors.white.withOpacity(0.6),
                        child: const Text(
                          "Electrica",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      )
                    ]),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => FeedbackListScreen_3()));
                  },
                  child: Container(
                    padding: const EdgeInsets.only(
                        top: 140, bottom: 0, left: 0, right: 0),
                    decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(14.0)),
                      image: DecorationImage(
                          colorFilter: ColorFilter.mode(
                              Colors.blueGrey.withOpacity(0.04),
                              BlendMode.srcOver),
                          image: const AssetImage("assets/Neumatica.png"),
                          fit: BoxFit.cover),
                    ),
                    child: Stack(children: [
                      Container(
                        width: 194,
                        height: 25,
                        color: Colors.white.withOpacity(0.6),
                        child: const Text(
                          "Neumatica",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      )
                    ]),
                  ),
                ),
              ],
            )),
          ],
        ));
  }
}
