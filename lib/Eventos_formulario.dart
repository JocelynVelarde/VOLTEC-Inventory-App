import 'package:app_la_buena/Eventos.dart';
import 'package:app_la_buena/Eventos_controller.dart';
import 'package:app_la_buena/Eventos_form.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class run_5 extends StatefulWidget {
  const run_5({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _run_5 createState() => _run_5();
}

// ignore: camel_case_types
class _run_5 extends State<run_5> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileNoController = TextEditingController();
  TextEditingController feedbackController = TextEditingController();
  TextEditingController comprarController = TextEditingController();
  void _submitForm() {
    // Validate returns true if the form is valid, or false
    // otherwise.
    if (_formKey.currentState!.validate()) {
      // If the form is valid, proceed.
      FeedbackForm_5 feedbackForm_5 = FeedbackForm_5(
          nameController.text,
          emailController.text,
          mobileNoController.text,
          feedbackController.text);

      FormController formController = FormController();

      _showSnackbar("Enviando material al inventario...");

      // Submit 'feedbackForm' and save it in Google Sheets.
      formController.submitForm(feedbackForm_5, (String? response) {
        // ignore: avoid_print
        print("Response: $response");
        if (response == FormController.STATUS_SUCCESS) {
          // Feedback is saved succesfully in Google Sheets.
          _showSnackbar("Material enviado");
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
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    //_scaffoldKey.currentState!.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Formulario Eventos"),
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
                  "assets/Manualidades.jpg",
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
                            controller: emailController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Ingresa un nombre de material valido';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: 'Material para evento',
                              focusColor: Colors.white,
                              //add prefix icon
                              prefixIcon: const Icon(
                                Icons.palette,
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
                            controller: nameController,
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
                            controller: mobileNoController,
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
                          TextFormField(
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
                          const SizedBox(height: 10),
                          TextFormField(
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            controller: feedbackController,
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
                            builder: (context) => const FeedbackListPage_5(
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
