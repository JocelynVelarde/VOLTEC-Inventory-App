import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

import 'Botiquin_form.dart';

/// FormController is a class which does work of saving FeedbackForm in Google Sheets using
/// HTTP GET request on Google App Script Web URL and parses response and sends result callback.
class FormController {
  // Google App Script Web URL.
  static const String URL =
      "https://script.google.com/macros/s/AKfycbxigNcdxeByjy9A93uHhII6RSRUdg1SpxBvcrObYowS6g2ANBQLdaj1D7F2H-OwY0BY/exec";

  // Success Status Message
  static const STATUS_SUCCESS = "SUCCESS";

  /// Async function which saves feedback, parses [feedbackForm] parameters
  /// and sends HTTP GET request on [URL]. On successful response, [callback] is called.
  void submitForm(
      FeedbackForm_4 feedbackForm_4, void Function(String?) callback) async {
    try {
      await http
          .post(URL as Uri, body: feedbackForm_4.toJson())
          .then((response) async {
        if (response.statusCode == 302) {
          var url = response.headers['location']!;
          await http.get(url as Uri).then((response) {
            callback(convert.jsonDecode(response.body)['status']);
          });
        } else {
          callback(convert.jsonDecode(response.body)['status']);
        }
      });
    } catch (e) {
      print(e);
    }
  }

  Future<List<FeedbackForm_4>> getFeedbackList() async {
    return await http.get(URL as Uri).then((response) {
      var jsonFeedback = convert.jsonDecode(response.body) as List;
      return jsonFeedback.map((json) => FeedbackForm_4.fromJson(json)).toList();
    });
  }
}
