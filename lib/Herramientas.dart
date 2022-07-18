import 'package:app_la_buena/Herramientas_controller.dart';
import 'package:app_la_buena/Herramientas_controller.dart';
import 'package:flutter/material.dart';
import 'package:app_la_buena/Herramientas_form.dart';
import 'package:app_la_buena/Herramientas_formulario.dart';

import 'Herramientas_form.dart';

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
          actions: [
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => run(),
                      ));
                }),
          ],
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
                      title: Text("${feedbackItems[index].email}",
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      content: new Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Image.network(
                            '${feedbackItems[index].feedback}',
                            height: 200,
                            width: 200,
                            alignment: Alignment(0.0, 0.0),
                            fit: BoxFit.cover,
                          ),
                          Text("Clave: ${feedbackItems[index].name}"),
                          Text("Cantidad: ${feedbackItems[index].mobileNo}"),
                          Text("Comprar: ${feedbackItems[index].comprar}")
                        ],
                      ),
                      actions: <Widget>[
                        // ignore: unnecessary_new
                        new TextButton(
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
                      child: Stack(children: [
                        Container(
                          alignment: Alignment(0.0, 0.0),
                          width: 192,
                          height: 27,
                          color: Colors.black.withOpacity(0.6),
                          child: Text(
                            "${feedbackItems[index].email}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                            maxLines: 2,
                          ),
                        ),
                      ]),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(14.0)),
                        image: DecorationImage(
                            colorFilter: ColorFilter.mode(
                                Colors.blueGrey.withOpacity(0.2),
                                BlendMode.srcOver),
                            image: NetworkImage(
                                "${feedbackItems[index].feedback}"),
                            fit: BoxFit.cover),
                      ),
                    ),
                  );
                }),
          ),
        ]));
  }
}
