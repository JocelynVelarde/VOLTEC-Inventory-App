// ignore: file_names
import 'package:app_la_buena/backend/Controlador.dart';
import 'package:flutter/material.dart';

import '../backend/Herramienta.dart';

// ignore: must_be_immutable
class InventarioUI extends StatefulWidget {
  InventarioUI({required this.title});

  final String title;

  late Controlador controlador = Controlador();

  @override
  State<InventarioUI> createState() => _InventarioUIState();
}

class _InventarioUIState extends State<InventarioUI> {
  @override
  Widget build(BuildContext context) {
    print(widget.title);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff1e224f),
        title: Text(widget.title),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: Center(
          child: Stack(children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5), BlendMode.srcOver),
            image: const AssetImage(
              "assets/gradiente.jpg",
            ),
            fit: BoxFit.cover,
          )),
          width: double.infinity,
          height: double.infinity,
        ),
        FutureBuilder<List<Herramienta>?>(
          future: widget.controlador.getAll(widget.title),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox(
                height: double.infinity / 2,
                child: Center(
                  child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white)),
                ),
              );
            }
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                //se crea una variable por cada indice de el google sheets con todos los paramentros de herramienta
                final herramienta = snapshot.data![index];
                // ignore: no_leading_underscores_for_local_identifiers
                Widget _buildPopupDialog(BuildContext context) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    // ignore: unnecessary_string_interpolations
                    title: Text(herramienta.nombre,
                        style: const TextStyle(color: Colors.white)),
                    backgroundColor: Colors.black.withOpacity(0.9),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image(
                            image: NetworkImage(
                              herramienta.imagen,
                            ),
                          ),
                        ),
                        const Padding(padding: EdgeInsets.only(top: 15.0)),
                        Text("Clave: ${herramienta.clave}",
                            style: const TextStyle(color: Colors.white)),
                        Text("Cantidad: ${herramienta.cantidad.toString()}",
                            style: const TextStyle(color: Colors.white)),
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
                    showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            _buildPopupDialog(context));
                  },
                  child: Card(
                    color: Colors.black.withOpacity(0.3),
                    child: ListTile(
                      title: Text(herramienta.nombre,
                          style: const TextStyle(color: Colors.white)),
                      subtitle: Text(herramienta.clave,
                          style: const TextStyle(color: Colors.white)),
                      trailing: Text(herramienta.cantidad.toString(),
                          style: const TextStyle(color: Colors.white)),
                      leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                        herramienta.imagen,
                      )),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ])),
    );
  }
}
