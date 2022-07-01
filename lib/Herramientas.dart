import 'package:app_la_buena/feedback_model.dart';
import 'package:flutter/material.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Herramientas extends StatefulWidget {
  @override
  _Herramientas createState() => _Herramientas();
}

class _Herramientas extends State<Herramientas> {
  List<FeedbackModel> feedbacks = <FeedbackModel>[];

  getFeedbackFromSheet() async {
    var raw = await http.get(
        "https://script.google.com/macros/s/AKfycbxI6Y2pmvnfibY3Pp7JOi0nAQqAuamY6qGdtI_ZYThpafC2pVRC6-0dsEQBYFJqK8_AAw/exec");

    var jsonFeedback = convert.jsonDecode(raw.body);
    print('this is json Feedback $jsonFeedback');

    // feedbacks = jsonFeedback.map((json) => FeedbackModel.fromJson(json));

    jsonFeedback.forEach((element) {
      print('$element THIS IS NEXT>>>>>>>');
      FeedbackModel feedbackModel = new FeedbackModel(
          cantidad: '', comprar: '', nombre: '', foto: '', marca: '');
      feedbackModel.name = element['Nombre'];
      feedbackModel.feedback = element['Cantidad'];
      feedbackModel.profilePic = element['Foto'];
      feedbackModel.source = element['Marca'];
      feedbackModel.sourceUrl = element["Comprar"];

      feedbacks.add(feedbackModel);
    });

    //print('${feedbacks[0]}');
  }

  @override
  void initState() {
    getFeedbackFromSheet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("VOLTEC App Inventario"),
        elevation: 0,
      ),
      body: Container(
        child: ListView.builder(
            itemCount: feedbacks.length,
            itemBuilder: (context, index) {
              return FeedbackTile(
                foto: feedbacks[index].foto,
                nombre: feedbacks[index].nombre,
                marca: feedbacks[index].marca,
                cantidad: feedbacks[index].cantidad,
                comprar: feedbacks[index].comprar,
              );
            }),
      ),
    );
  }
}

class FeedbackTile extends StatelessWidget {
  final String foto, nombre, marca, cantidad, comprar;
  FeedbackTile(
      {required this.foto,
      required this.nombre,
      required this.marca,
      required this.cantidad,
      required this.comprar});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                  height: 40,
                  width: 40,
                  child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      child: Image.network(foto))),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(nombre),
                  Text(
                    'from $marca',
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              )
            ],
          ),
          SizedBox(height: 16),
          Text(marca)
        ],
      ),
    );
  }
}
