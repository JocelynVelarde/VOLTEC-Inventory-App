// ignore: file_names

import 'package:app_la_buena/MyGridScreen.dart';
import 'package:app_la_buena/Viajes_forms.dart';
import 'package:app_la_buena/Viajes_formulario.dart';
import 'package:flutter/material.dart';

import 'Viajes_controller.dart';

// ignore: use_key_in_widget_constructors
class FeedbackListScreen_8 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Inventario Viajes',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const FeedbackListPage_8(title: "Inventario Viajes"));
  }
}

class FeedbackListPage_8 extends StatefulWidget {
  const FeedbackListPage_8({Key? key, required this.title}) : super(key: key);

  final String? title;

  @override
  // ignore: library_private_types_in_public_api
  _FeedbackListPageState_8 createState() => _FeedbackListPageState_8();
}

class _FeedbackListPageState_8 extends State<FeedbackListPage_8> {
  // ignore: deprecated_member_use, prefer_collection_literals
  List<FeedbackForm_8> feedbackItems = <FeedbackForm_8>[];

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
          backgroundColor: const Color.fromARGB(255, 0, 173, 238),
          title: const Text("Inventario Viajes"),
          leading: GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const MyGridScreen()));
            },
            child: const Icon(
              Icons.arrow_back, // add custom icons also
            ),
          ),
          actions: <Widget>[
            Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const run_8()));
                  },
                  child: const Icon(
                    Icons.add,
                    size: 26.0,
                  ),
                )),
          ],
        ),
        body: Stack(children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.4), BlendMode.srcOver),
              image: const AssetImage(
                "assets/Fondo.JPG",
              ),
              fit: BoxFit.cover,
            )),
            height: 700,
          ),
          Center(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 250,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                padding: const EdgeInsets.all(16),
                itemCount: feedbackItems.length,
                itemBuilder: (context, index) {
                  Widget _buildPopupDialog(BuildContext context) {
                    return AlertDialog(
                      // ignore: unnecessary_string_interpolations
                      title: Text("${feedbackItems[index].email}",
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Image.network(
                            // ignore: unnecessary_string_interpolations
                            '${feedbackItems[index].feedback}',
                            height: 200,
                            width: 200,
                            alignment: const Alignment(0.0, 0.0),
                            fit: BoxFit.cover,
                          ),
                          Text("Clave: ${feedbackItems[index].name}"),
                          Text("Cantidad: ${feedbackItems[index].mobileNo}")
                        ],
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Cerrar'),
                        ),
                      ],
                    );
                  }

                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => _buildPopupDialog(context)));
                    },
                    child: Container(
                      padding: const EdgeInsets.only(
                          top: 140, bottom: 0, left: 0, right: 0),
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(14.0)),
                        image: DecorationImage(
                            colorFilter: ColorFilter.mode(
                                Colors.blueGrey.withOpacity(0.3),
                                BlendMode.srcOver),
                            image: NetworkImage(
                                // ignore: unnecessary_string_interpolations
                                "${feedbackItems[index].feedback}"),
                            fit: BoxFit.cover),
                      ),
                      child: Stack(children: [
                        Container(
                          alignment: const Alignment(0.0, 0.0),
                          width: 192,
                          height: 27,
                          color: Colors.black.withOpacity(0.6),
                          child: Text(
                            // ignore: unnecessary_string_interpolations
                            "${feedbackItems[index].email}",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                            maxLines: 2,
                          ),
                        ),
                      ]),
                    ),
                  );
                }),
          ),
        ]));
  }
}
