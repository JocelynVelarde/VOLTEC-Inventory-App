import 'package:app_la_buena/Electrica.dart';
import 'package:app_la_buena/Lego.dart';
import 'package:app_la_buena/Mecanica.dart';
import 'package:app_la_buena/Refacciones.dart';
import 'package:flutter/material.dart';

import 'Herramientas.dart';
import 'Viajes.dart';

class MyGridScreen extends StatefulWidget {
  const MyGridScreen({Key? key}) : super(key: key);

  @override
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
                accountName: Text(
                  'Jocelyn Velarde',
                  style: TextStyle(color: Colors.black),
                ),
                accountEmail: Text(
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
                decoration: BoxDecoration(
                  color: Colors.blue,
                  image: DecorationImage(
                      fit: BoxFit.fill, image: AssetImage('assets/Fondo.JPG')),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
                onTap: () => null,
              ),
              ListTile(
                leading: Icon(Icons.login),
                title: Text('Login'),
                onTap: () => null,
              ),
              ListTile(
                leading: Icon(Icons.share),
                title: Text('Screen'),
                onTap: () => null,
              ),
              Divider(),
              ListTile(
                title: Text('Logout'),
                leading: Icon(Icons.logout),
                onTap: () => null,
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: const Text("VOLTEC App Inventario"),
          actions: [
            IconButton(
                icon: Icon(Icons.account_box_rounded),
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
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => FeedbackListScreen()));
                  },
                  child: Container(
                    padding: const EdgeInsets.only(
                        top: 140, bottom: 0, left: 0, right: 0),
                    child: Stack(children: [
                      Container(
                        width: 194,
                        height: 25,
                        color: Colors.white.withOpacity(0.6),
                        child: Text(
                          "Herramientas",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      )
                    ]),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(14.0)),
                      image: DecorationImage(
                          colorFilter: ColorFilter.mode(
                              Colors.blueGrey.withOpacity(0.04),
                              BlendMode.srcOver),
                          image: AssetImage(
                            "assets/Herramientas.jpeg",
                          ),
                          fit: BoxFit.cover),
                    ),
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
                    child: Stack(children: [
                      Container(
                        width: 194,
                        height: 25,
                        color: Colors.white.withOpacity(0.6),
                        child: Text(
                          "Consumibles",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      )
                    ]),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(14.0)),
                      image: DecorationImage(
                          colorFilter: ColorFilter.mode(
                              Colors.blueGrey.withOpacity(0.04),
                              BlendMode.srcOver),
                          image: AssetImage("assets/Refacciones.jpeg"),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Mecanica()));
                  },
                  child: Container(
                    padding: const EdgeInsets.only(
                        top: 140, bottom: 0, left: 0, right: 0),
                    child: Stack(children: [
                      Container(
                        width: 194,
                        height: 25,
                        color: Colors.white.withOpacity(0.6),
                        child: Text(
                          "Mecanica",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      )
                    ]),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(14.0)),
                      image: DecorationImage(
                          colorFilter: ColorFilter.mode(
                              Colors.blueGrey.withOpacity(0.04),
                              BlendMode.srcOver),
                          image: AssetImage("assets/Mecanica.jpg"),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Electrica()));
                  },
                  child: Container(
                    padding: const EdgeInsets.only(
                        top: 140, bottom: 0, left: 0, right: 0),
                    child: Stack(children: [
                      Container(
                        width: 194,
                        height: 25,
                        color: Colors.white.withOpacity(0.6),
                        child: Text(
                          "Electrica y Neumatica",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      )
                    ]),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(14.0)),
                      image: DecorationImage(
                          colorFilter: ColorFilter.mode(
                              Colors.blueGrey.withOpacity(0.04),
                              BlendMode.srcOver),
                          image: AssetImage("assets/Electrica.jpg"),
                          fit: BoxFit.cover),
                    ),
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
                    child: Stack(children: [
                      Container(
                        width: 194,
                        height: 25,
                        color: Colors.white.withOpacity(0.6),
                        child: Text(
                          "Lego Mindstorms",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      )
                    ]),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(14.0)),
                      image: DecorationImage(
                          colorFilter: ColorFilter.mode(
                              Colors.blueGrey.withOpacity(0.04),
                              BlendMode.srcOver),
                          image: AssetImage("assets/Lego.jpeg"),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Viajes()));
                  },
                  child: Container(
                    padding: const EdgeInsets.only(
                        top: 140, bottom: 0, left: 0, right: 0),
                    child: Stack(children: [
                      Container(
                        width: 194,
                        height: 25,
                        color: Colors.white.withOpacity(0.6),
                        child: Text(
                          "Viajes",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      )
                    ]),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(14.0)),
                      image: DecorationImage(
                          colorFilter: ColorFilter.mode(
                              Colors.blueGrey.withOpacity(0.04),
                              BlendMode.srcOver),
                          image: AssetImage("assets/Viajes.JPG"),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
              ],
            )),
          ],
        ));
  }
}
