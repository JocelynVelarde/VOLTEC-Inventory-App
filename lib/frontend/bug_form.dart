
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';


class BugReportForm extends StatefulWidget {
  const BugReportForm({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BugReportFormState createState() => _BugReportFormState();
}

class _BugReportFormState extends State<BugReportForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  Future<void> writeToFile(
      String name, String email, String description) async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/bug_reports.txt');
    final sink = file.openWrite(mode: FileMode.append);

    sink.write('Name: $name\nEmail: $email\nDescription: $description\n\n');
    // ignore: avoid_print
    print(file);
    await sink.flush();
    await sink.close();
  }

  Future<void> requestStoragePermission() async {
    final status = await Permission.storage.request();

    if (status.isGranted) {
      // ignore: avoid_print
      print("Storage permission granted");
    } else {
      // ignore: avoid_print
      print("Storage permission denied");
    }
  }

  void _submitForm() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      final name = nameController.text;
      final email = emailController.text;
      final description = descriptionController.text;

      // Write the data to the file

      writeToFile(name, email, description);

      form.reset();
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    requestStoragePermission();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Bug Report'),
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
                          controller: nameController,
                          decoration: const InputDecoration(
                              labelText: 'Nombre',
                              labelStyle:
                                  TextStyle(color: Colors.white, fontSize: 20),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none)),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Porfavor ingresa tu nombre';
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
                          controller: emailController,
                          decoration: const InputDecoration(
                              labelText: 'Email',
                              labelStyle:
                                  TextStyle(color: Colors.white, fontSize: 20),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none)),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Porfavor ingresa tu correo';
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
                          controller: descriptionController,
                          decoration: const InputDecoration(
                              labelText: 'Cuentanos el bug',
                              labelStyle:
                                  TextStyle(color: Colors.white, fontSize: 18),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none)),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Porfavor ingresa una descripción';
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
        )
      ]),
    );
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
}
