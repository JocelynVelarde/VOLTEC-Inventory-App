import 'package:app_la_buena/MyGridScreen.dart';
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

          primarySwatch: Colors.pink,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text("VOLTEC App Inventario"),
            actions: [
              IconButton(
                  icon: Icon(Icons.account_box_rounded),
                  onPressed: () {
                    print("icon");
                  }),
            ],
            backgroundColor: const Color.fromARGB(255, 12, 107, 185),
          ),
          body: MyGridScreen(),
        ));
  }
}
