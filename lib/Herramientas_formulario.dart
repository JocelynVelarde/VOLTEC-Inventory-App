// ignore: file_names
import 'package:app_la_buena/Herramientas.dart';
import 'package:app_la_buena/Herramientas_controller.dart';
import 'package:flutter/material.dart';
import 'package:app_la_buena/Herramientas_form.dart';

// ignore: camel_case_types
class run extends StatefulWidget {
  const run({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _run createState() => _run();
}

// ignore: camel_case_types
class _run extends State<run> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController claveController = TextEditingController();
  TextEditingController nombreController = TextEditingController();
  TextEditingController cantidadController = TextEditingController();
  TextEditingController imagenController = TextEditingController();

  void _submitForm() {
    // Validate returns true if the form is valid, or false
    // otherwise.
    if (_formKey.currentState!.validate()) {
      // If the form is valid, proceed.
      FeedbackForm feedbackForm = FeedbackForm(
        claveController.text,
        nombreController.text,
        cantidadController.text,
        imagenController.text,
      );

      FormController formController = FormController();

      _showSnackbar("Enviando herramienta al inventario...");

      // Submit 'feedbackForm' and save it in Google Sheets.
      formController.submitForm(feedbackForm, (String? response) {
        // ignore: avoid_print
        print("Response: $response");
        if (response == FormController.STATUS_SUCCESS) {
          // Feedback is saved succesfully in Google Sheets.
          _showSnackbar("Herramienta enviada");
        } else {
          // Error Occurred while saving data in Google Sheets.
          _showSnackbar("Ocurrio un error");
        }
      });
    }
  }

  // Method to show snackbar with 'message'.
  _showSnackbar(String message) {
    final snackBar = SnackBar(content: Text(message));
    // ignore: deprecated_member_use
    //_scaffoldKey.currentState!.showSnackBar(snackBar);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Formulario Herramientas"),
          actions: [
            IconButton(
                icon: const Icon(Icons.account_box_rounded), onPressed: () {}),
          ],
          backgroundColor: const Color.fromARGB(255, 0, 173, 238),
        ),
        key: _scaffoldKey,
        body: Stack(children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.6), BlendMode.srcOver),
                image: const AssetImage(
                  "assets/Herramientas.jpeg",
                ),
                fit: BoxFit.cover,
              ),
            ),
            height: 700,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          TextFormField(
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            controller: nombreController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Ingresa un nombre de herramienta valido';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: 'Herramienta',
                              focusColor: Colors.white,
                              //add prefix icon
                              prefixIcon: const Icon(
                                Icons.build,
                                color: Colors.black,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 1.0),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              fillColor: Colors.white, filled: true,
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            controller: claveController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Ingresa una clave valida';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: 'Clave',
                              focusColor: Colors.white,
                              //add prefix icon
                              prefixIcon: const Icon(
                                Icons.key,
                                color: Colors.black,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 1.0),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              fillColor: Colors.white, filled: true,
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            controller: cantidadController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Ingresa un numero';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: 'Cantidad por agregar',
                              focusColor: Colors.white,
                              //add prefix icon
                              prefixIcon: const Icon(
                                Icons.post_add,
                                color: Colors.black,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 1.0),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              fillColor: Colors.white, filled: true,
                            ),
                          ),
                          const SizedBox(height: 10),
                          /*TextFormField(
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            controller: comprarController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Ingresa un URL o nombre de la tienda';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: 'Donde se compro',
                              focusColor: Colors.white,
                              //add prefix icon
                              prefixIcon: const Icon(
                                Icons.store,
                                color: Colors.black,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 1.0),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              fillColor: Colors.white, filled: true,
                            ),
                          ),
                          const SizedBox(height: 10),*/
                          TextFormField(
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            controller: imagenController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Sube una link para la foto';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.multiline,
                            decoration: InputDecoration(
                              labelText: 'Foto (link)',
                              focusColor: Colors.white,
                              //add prefix icon
                              prefixIcon: const Icon(
                                Icons.add_link,
                                color: Colors.black,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 1.0),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              fillColor: Colors.white, filled: true,
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    )),
                ElevatedButton(
                    onPressed: _submitForm,
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)),
                        backgroundColor: const Color.fromARGB(255, 30, 34, 79),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 75, vertical: 20),
                        textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        )),
                    child: const Text('Enviar al inventario')),
                const SizedBox(height: 10),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const FeedbackListPage(
                              title: '',
                            ),
                          ));
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)),
                        backgroundColor: const Color.fromARGB(255, 30, 34, 79),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 20),
                        textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        )),
                    child: const Text('Ver el inventario actualizado')),
              ],
            ),
          )
        ]));
  }
}
