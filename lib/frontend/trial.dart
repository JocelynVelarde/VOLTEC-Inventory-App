import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';

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
    return Form(
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
        ]));
  }

  void _submitForm() async {
    final form = _formKey.currentState;
    if (form!.validate()) {
      final name = nameController.text;
      final email = emailController.text;
      final description = descriptionController.text;

      // Get the local path
      final directory = await getApplicationDocumentsDirectory();
      final path = directory.path;
      
      // Create the file
      final file = File('$path/bug_reports.txt');
      
      // Write the data to the file
      file.writeAsString('Name: $name\nEmail: $email\nDescription: $description\n\n', mode: FileMode.append);
      
      form.reset();
      Navigator.pop(context);
    }
  }
}
