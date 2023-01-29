import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    requestStoragePermission();
    return Scaffold(
      body: Form(
          key: _formKey,
          child: Column(children: <Widget>[
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
            ),
            TextFormField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a description';
                }
                return null;
              },
            ),
            ElevatedButton(
              onPressed: _submitForm,
              child: Text('Submit'),
            )
          ])),
    );
  }

  Future<void> writeToFile(
      String name, String email, String description) async {
    final directory = await getExternalStorageDirectory();
    final file = File('${directory?.path}/bug_reports.txt');
    final sink = file.openWrite(mode: FileMode.append);

    sink.write('Name: $name\nEmail: $email\nDescription: $description\n\n');
    await sink.flush();
    await sink.close();
  }

  Future<void> requestStoragePermission() async {
    final status = await Permission.storage.request();

    if (status.isGranted) {
      print("Storage permission granted");
    } else {
      print("Storage permission denied");
    }
  }

  void _submitForm() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      final name = nameController.text;
      final email = emailController.text;
      final description = descriptionController.text;

      // Create the file object
      final file = File('assets/bug_reports.txt');
      print(file);

      // Write the data to the file
      file.writeAsString(
          'Name: $name\nEmail: $email\nDescription: $description\n\n',
          mode: FileMode.append);

      form.reset();
      Navigator.pop(context);
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
}
