// ignore: file_names
import 'package:app_la_buena/Electrica.dart';
import 'package:app_la_buena/ElectricaNeumatica.dart';
import 'package:app_la_buena/Electrica_formulario.dart';
import 'package:app_la_buena/Lego.dart';
import 'package:app_la_buena/Mecanica.dart';
import 'package:app_la_buena/Refacciones.dart';
import 'package:flutter/material.dart';

import 'Herramientas.dart';
import 'Viajes.dart';

class MyGridScreen extends StatefulWidget {
  const MyGridScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyGridScreenState createState() => _MyGridScreenState();
}

class _MyGridScreenState extends State<MyGridScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                accountName: const Text(
                  'Jocelyn Velarde',
                  style: TextStyle(color: Colors.black),
                ),
                accountEmail: const Text(
                  'a01285780@tec.mx',
                  style: TextStyle(color: Colors.black),
                ),
                currentAccountPicture: CircleAvatar(
                  child: ClipOval(
                    child: Image.asset(
                      'assets/Stitch.png',
                      fit: BoxFit.cover,
                      width: 90,
                      height: 90,
                    ),
                  ),
                ),
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  image: DecorationImage(
                      fit: BoxFit.fill, image: AssetImage('assets/Fondo.JPG')),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Home'),
                // ignore: avoid_returning_null_for_void
                onTap: () => null,
              ),
              ListTile(
                leading: const Icon(Icons.login),
                title: const Text('Login'),
                // ignore: avoid_returning_null_for_void
                onTap: () => null,
              ),
              ListTile(
                leading: const Icon(Icons.share),
                title: const Text('Screen'),
                // ignore: avoid_returning_null_for_void
                onTap: () => null,
              ),
              const Divider(),
              ListTile(
                title: const Text('Logout'),
                leading: const Icon(Icons.logout),
                // ignore: avoid_returning_null_for_void
                onTap: () => null,
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: const Text("VOLTEC App Inventario"),
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
                  Colors.blueGrey.withOpacity(0.5), BlendMode.srcOver),
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
                        builder: (context) => FeedbackListScreen()));
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
                          image: const AssetImage(
                            "assets/Herramientas.jpeg",
                          ),
                          fit: BoxFit.cover),
                    ),
                    child: Stack(children: [
                      Container(
                        width: 194,
                        height: 25,
                        color: Colors.white.withOpacity(0.6),
                        child: const Text(
                          "Herramientas",
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
                        builder: (context) => const Refacciones()));
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
                          image: const AssetImage("assets/Refacciones.jpeg"),
                          fit: BoxFit.cover),
                    ),
                    child: Stack(children: [
                      Container(
                        width: 194,
                        height: 25,
                        color: Colors.white.withOpacity(0.6),
                        child: const Text(
                          "Consumibles",
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
                        builder: (context) => FeedbackListScreen_1()));
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
                          image: const AssetImage("assets/Mecanica.jpg"),
                          fit: BoxFit.cover),
                    ),
                    child: Stack(children: [
                      Container(
                        width: 194,
                        height: 25,
                        color: Colors.white.withOpacity(0.6),
                        child: const Text(
                          "Mecanica",
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
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ElecNum()));
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
                          image: const AssetImage("assets/Electrica.jpg"),
                          fit: BoxFit.cover),
                    ),
                    child: Stack(children: [
                      Container(
                        width: 194,
                        height: 25,
                        color: Colors.white.withOpacity(0.6),
                        child: const Text(
                          "Electrica y Neumatica",
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
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const Lego()));
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
                          image: const AssetImage("assets/LegoPiezas.jpg"),
                          fit: BoxFit.cover),
                    ),
                    child: Stack(children: [
                      Container(
                        width: 194,
                        height: 25,
                        color: Colors.white.withOpacity(0.6),
                        child: const Text(
                          "Lego Mindstorms",
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
                        builder: (context) => FeedbackListScreen_8()));
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
                          image: const AssetImage("assets/Viajes.JPG"),
                          fit: BoxFit.cover),
                    ),
                    child: Stack(children: [
                      Container(
                        width: 194,
                        height: 25,
                        color: Colors.white.withOpacity(0.6),
                        child: const Text(
                          "Viajes",
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
