


import 'package:flutter/material.dart';

import '../backend/Controlador.dart';
import '../backend/Herramienta.dart';

class HerramientaForm extends StatefulWidget {
  const HerramientaForm({Key? key, required this.title}) : super(key: key);
  final String title;


  @override
  // ignore: library_private_types_in_public_api
  _HerramientaFormState createState() => _HerramientaFormState();
}

class _HerramientaFormState extends State<HerramientaForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(widget.title),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: Stack(children: <Widget>[
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/gradiente.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 0,
              left: 20,
              right: 20,
            ),
            child: SingleChildScrollView(
             
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(25.0),
                            border: Border.all(
                              width: 2.0,
              
                            )),
                        margin: const EdgeInsets.only(bottom: 20),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: herramientaController,
                            decoration: const InputDecoration(
                              labelText: "Herramienta",
                          
                                labelStyle: 
                                    TextStyle(color: Colors.white, fontSize: 18),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide.none),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide.none)),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Porfavor ingresa una herramienta';
                              }
                              return null;
                            },
                            style: const TextStyle(
                                color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(25.0),
                            border: Border.all(
                              width: 2.0,
                            )),
                        margin: const EdgeInsets.only(bottom: 20),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: cantidadController,
                            decoration: const InputDecoration(
                             labelText: "Cantidad",
                                labelStyle:
                                    TextStyle(color: Colors.white, fontSize: 18),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide.none),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide.none)),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Porfavor ingresa una cantidad';
                              }
                              return null;
                            },
                            style: const TextStyle(
                                color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(25.0),
                            border: Border.all(
                              width: 2.0,
                            )),
                        margin: const EdgeInsets.only(bottom: 20),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: claveController,
                            decoration: const InputDecoration(
                               labelText: "Clave",
                                labelStyle:
                                    TextStyle(color: Colors.white, fontSize: 18),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide.none),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide.none)),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Porfavor ingresa una clave';
                              }
                              return null;
                            },
                            style: const TextStyle(
                                color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(25.0),
                            border: Border.all(
                              width: 2.0,
                            )),
                        margin: const EdgeInsets.only(bottom: 20),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: imagenController,
                            decoration: const InputDecoration(
                              labelText: "Imagen",
                                labelStyle:
                                    TextStyle(color: Colors.white, fontSize: 18),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide.none),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide.none)),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Porfavor ingresa una link hacia la imagen';
                              }
                              return null;
                            },
                            style: const TextStyle(
                                color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                      RawMaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 8),
                        onPressed: _submitForm,
                        fillColor: Colors.black,
                        elevation: 5,
                        highlightElevation: 3,
                        disabledElevation: 0,
                        highlightColor: Colors.pink[50],
                        materialTapTargetSize: MaterialTapTargetSize.padded,
                        animationDuration: const Duration(milliseconds: 100),
                        child: const Icon(
                          Icons.send,
                          size: 30,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        
      ]),
    );
  }

  final _formKey = GlobalKey<FormState>();
  TextEditingController herramientaController = TextEditingController();
  TextEditingController claveController = TextEditingController();
  TextEditingController cantidadController = TextEditingController();
  TextEditingController imagenController = TextEditingController();

  void _submitForm() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      Herramienta herramienta = Herramienta(
          nombre: herramientaController.text,
          clave: claveController.text,
          cantidad: cantidadController.text,
          imagen: imagenController.text);
       Controlador controlador = Controlador();

      _showSnackBar("Sending infromation");
      controlador.insertData(herramienta, widget.title);
    }
    form.reset();
    Navigator.pop(context);
  }

  _showSnackBar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Herramienta enviada al inventario")));
  }
}
  

  

  /*void _submitForm() async {
    final form = _formKey.currentState;
    if (form!.validate()) {
      final name = nameController.text;
      final email = emailController.text;
      final description = descriptionController.text;

      // Get the local path
      final directory = await getExternalStorageDirectory();
      final file = File('${directory?.path}/bug_reports.txt');
      final sink = file.openWrite(mode: FileMode.append);
      sink.write('Name: $name\nEmail: $email\nDescription: $description\n\n');
      await sink.flush();
      await sink.close();

      // Create the file

      print(directory);
      writeToFile(name, email, description);
      // Write the data to the file

      form.reset();
      Navigator.pop(context);
    }*/

