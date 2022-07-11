import 'package:app_la_buena/MyGridScreen.dart';
import 'package:app_la_buena/run.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'VOLTEC App Inventario',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.

          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
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
                        fit: BoxFit.fill,
                        image: AssetImage('assets/Fondo.JPG')),
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
            backgroundColor: const Color.fromARGB(255, 12, 107, 185),
          ),
          body: const run(),
        ));
  }
}
