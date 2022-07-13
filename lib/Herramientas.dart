import 'package:app_la_buena/form_controller.dart';
import 'package:app_la_buena/run.dart';
import 'package:flutter/material.dart';
import 'package:app_la_buena/form.dart';

import 'form.dart';

class FeedbackListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Inventario Herramientas',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: FeedbackListPage(title: "Inventario Herramientas"));
  }
}

class FeedbackListPage extends StatefulWidget {
  const FeedbackListPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _FeedbackListPageState createState() => _FeedbackListPageState();
}

class _FeedbackListPageState extends State<FeedbackListPage> {
  // ignore: deprecated_member_use, prefer_collection_literals
  List<FeedbackForm> feedbackItems = <FeedbackForm>[];

  // Method to Submit Feedback and save it in Google Sheets

  @override
  void initState() {
    super.initState();

    FormController().getFeedbackList().then((feedbackItems) {
      setState(() {
        this.feedbackItems = feedbackItems;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Inventario de Herramientas"),
        ),
        body: Stack(children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.blueGrey.withOpacity(0.5), BlendMode.srcOver),
              image: AssetImage(
                "assets/Fondo.JPG",
              ),
              fit: BoxFit.cover,
            )),
            height: 700,
            alignment: Alignment.bottomRight,
            padding: const EdgeInsets.all(20),
            child: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.blue,
              child: IconButton(
                icon: const Icon(Icons.add),
                color: Colors.white,
                highlightColor: Colors.black,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => run(),
                      ));
                },
              ),
            ),
          ),
          Center(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 250,
                  mainAxisSpacing: 1 / 2,
                  crossAxisSpacing: 1 / 2,
                ),
                itemCount: feedbackItems.length,
                itemBuilder: (context, index) {
                  return GridView.extent(
                    primary: false,
                    padding: const EdgeInsets.all(16),
                    mainAxisSpacing: 1 / 2,
                    crossAxisSpacing: 1 / 2,
                    maxCrossAxisExtent: 250.0,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(
                            top: 140, bottom: 0, left: 0, right: 0),
                        child: Stack(children: [
                          Container(
                            width: 190,
                            height: 20,
                            color: Colors.white.withOpacity(0.6),
                            child: Text(
                              "${feedbackItems[index].name} (${feedbackItems[index].email})",
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
                      )
                    ],
                  );
                  /**/
                }),
          ),
        ]));
  }
}
