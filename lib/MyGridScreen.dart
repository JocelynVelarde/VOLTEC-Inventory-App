import 'package:app_la_buena/frontend/InventarioUI.dart';
import 'package:app_la_buena/users/userModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';

import 'users/login.dart';

class MyGridScreen extends StatefulWidget {
  const MyGridScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyGridScreenState createState() => _MyGridScreenState();
}

class _MyGridScreenState extends State<MyGridScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<String> titles = [
      "HERRAMIENTAS",
      "REFACCIONES",
      "VIAJES",
      "BOTIQUIN",
      "MECANICA",
      "LEGO",
    ];

    final List<Widget> images = [
      Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          image: DecorationImage(
            image: AssetImage('assets/herramientaA.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          image: DecorationImage(
            image: AssetImage('assets/electricaA.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          image: DecorationImage(
            image: AssetImage('assets/viajeA.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          image: DecorationImage(
            image: AssetImage('assets/botiquinA.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          image: DecorationImage(
            image: AssetImage('assets/mecanicaA.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          image: DecorationImage(
            image: AssetImage('assets/LegoPiezas.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: IconButton(
          alignment: Alignment.bottomRight,
          onPressed: () {
            print("Hola");
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => InventarioUI(
                  title: 'Lego',
                ),
              ),
            );
          },
          icon: const Icon(Icons.send),
        ),
      ),
    ];

    return Scaffold(
      drawer: Drawer(
        backgroundColor: const Color(0xff1e224f),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                "${loggedInUser.firstName} ${loggedInUser.secondName}",
                style: TextStyle(color: Colors.white),
              ),
              accountEmail: Text(
                "${loggedInUser.email}",
                style: TextStyle(color: Colors.white),
              ),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image.asset(
                    'assets/Logo_voltec.png',
                    fit: BoxFit.cover,
                    width: 90,
                    height: 90,
                  ),
                ),
              ),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 23, 26, 59),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home, color: Colors.white),
              title: const Text(
                'Home',
                style: TextStyle(color: Colors.white),
              ),

              // ignore: avoid_returning_null_for_void
              onTap: () => null,
            ),
            ListTile(
              leading: const Icon(Icons.login, color: Colors.white),
              title: const Text(
                'Login',
                style: TextStyle(color: Colors.white),
              ),
              // ignore: avoid_returning_null_for_void
              onTap: () => null,
            ),
            ListTile(
              leading: const Icon(Icons.view_in_ar, color: Colors.white),
              title: const Text(
                '3D Model Viewer',
                style: TextStyle(color: Colors.white),
              ),
              // ignore: avoid_returning_null_for_void
              onTap: () => null,
            ),
            const Divider(),
            ActionChip(
                backgroundColor: Colors.white,
                label: const Text(
                  "Logout",
                ),
                onPressed: () {
                  logout(context);
                }),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text("VOLTEC App Inventario"),
        actions: [
          IconButton(
              icon: const Icon(Icons.volunteer_activism),
              iconSize: 30,
              onPressed: () {
                //Navigator.pop(context);
              }),
        ],
        backgroundColor: const Color(0xff1e224f),
      ),
      body: SafeArea(
          child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/gradiente.jpg"),
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.7), BlendMode.srcOver),
                        fit: BoxFit.cover)),
                child: VerticalCardPager(
                  textStyle: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  titles: titles,
                  images: images,
                  onPageChanged: (page) {},
                  align: ALIGN.CENTER,
                  onSelectedItem: (index) {},
                )),
          ),
        ],
      )),
    );
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginScreen()));
  }
}
