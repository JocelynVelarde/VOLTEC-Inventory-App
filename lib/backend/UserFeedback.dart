import 'package:flutter/material.dart';
import 'dart:io';

class BugReportForm extends StatefulWidget {
  @override
  _BugReportFormState createState() => _BugReportFormState();
}

class _BugReportFormState extends State<BugReportForm> {
  final _formKey = GlobalKey<FormState>();

  // Variables to store the user's input
  late String _affectedModule;
  late String _bugDescription;
  late String _stepsToReproduce;
  late String _additionalComments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'Affected Module/Feature'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter the name of the affected module or feature';
                }
                return null;
              },
              onSaved: (value) => _affectedModule = value!,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Bug Description'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a description of the bug';
                }
                return null;
              },
              onSaved: (value) => _bugDescription = value!,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Steps to Reproduce'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter the steps you took to reproduce the bug';
                }
                return null;
              },
              onSaved: (value) => _stepsToReproduce = value!,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Additional Comments'),
              onSaved: (value) => _additionalComments = value!,
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();

                  // Create the file
                  File bugReportFile = File('bug_report.txt');
                  bugReportFile.createSync();

                  // Write the user's input to the file
                  bugReportFile.writeAsStringSync(
                      "Affected Module/Feature: $_affectedModule\nBug Description: $_bugDescription\nSteps to Reproduce: $_stepsToReproduce\nAdditional Comments: $_additionalComments\n",
                      mode: FileMode.append);

                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text("Thank you for submitting the bug report!"),
                  ));
                }
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
