import 'package:app_la_buena/form_controller.dart';
import 'package:flutter/material.dart';
import 'package:app_la_buena/form.dart';

import 'form.dart';

class FeedbackListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Feedback Responses',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: FeedbackListPage(title: "Responses"));
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
        body: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200, mainAxisSpacing: 10),
            itemCount: feedbackItems.length,
            itemBuilder: (context, index) {
              return GridView.extent(
                primary: false,
                padding: const EdgeInsets.all(16),
                crossAxisSpacing: 10,
                maxCrossAxisExtent: 200.0,
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
            }));
  }
}
