import 'package:app_la_buena/Herramientas/Herramientas_controller.dart';
import 'package:flutter/material.dart';
import 'package:app_la_buena/Herramientas/Herramientas_form.dart';
import 'package:app_la_buena/Herramientas/Herramientas_formulario.dart';

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
        this.feedbackItems = feedbackItems.cast<FeedbackForm>();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    IconButton(
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
    );

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
            ),
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
                      title: Text("${feedbackItems[index].herramienta}",
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      content: new Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Image.network(
                            '${feedbackItems[index].imagenUrl}',
                            height: 200,
                            width: 200,
                            alignment: Alignment(0.0, 0.0),
                          ),
                          Text("Clave: ${feedbackItems[index].clave}"),
                          Text("Cantidad: " +
                              "${feedbackItems[index].cantidad}".toString()),
                          Text("Comprar: ${feedbackItems[index].tienda}")
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
                            "${feedbackItems[index].herramienta}",
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
                            image: NetworkImage(
                                "${feedbackItems[index].imagenUrl}"),
                            fit: BoxFit.cover),
                      ),
                    ),
                  );
                }),
          ),
        ]));
  }
}
