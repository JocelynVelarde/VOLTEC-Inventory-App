import 'package:app_la_buena/Neumatica_form.dart';
import 'package:flutter/material.dart';

import 'Neumatica_controller.dart';

// ignore: use_key_in_widget_constructors
class FeedbackListScreen_3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Feedback Responses',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const FeedbackListPage(title: "Responses"));
  }
}

class FeedbackListPage extends StatefulWidget {
  const FeedbackListPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  // ignore: library_private_types_in_public_api
  _FeedbackListPageState createState() => _FeedbackListPageState();
}

class _FeedbackListPageState extends State<FeedbackListPage> {
  // ignore: deprecated_member_use, prefer_collection_literals
  List<FeedbackForm_3> feedbackItems = <FeedbackForm_3>[];

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
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: feedbackItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Row(
              children: <Widget>[
                const Icon(Icons.build),
                Expanded(
                  child: Text(
                      "${feedbackItems[index].name} (${feedbackItems[index].email})"),
                )
              ],
            ),
            subtitle: Row(
              children: <Widget>[
                const Icon(Icons.message),
                Expanded(
                  // ignore: unnecessary_string_interpolations
                  child: Text("${feedbackItems[index].name}"),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
