import 'dart:convert' as convert;

import 'package:app_la_buena/Electrica_form.dart';
import 'package:http/http.dart' as http;

/// FormController is a class which does work of saving FeedbackForm in Google Sheets using
/// HTTP GET request on Google App Script Web URL and parses response and sends result callback.
class FormController {
  // Google App Script Web URL.
  static const String URL =
      "https://script.google.com/macros/s/AKfycbwq55Prnjx9S0u9VL4xLAsM4bg1zE2gdgosDeLOE2Kc50Tp6gA0u130Nldzku6YozPmtA/exec";

  // Success Status Message
  static const STATUS_SUCCESS = "SUCCESS";

  /// Async function which saves feedback, parses [feedbackForm] parameters
  /// and sends HTTP GET request on [URL]. On successful response, [callback] is called.
  void submitForm(
      FeedbackForm_2 feedbackForm_2, void Function(String?) callback) async {
    try {
      await http
          .post(Uri.parse(URL), body: feedbackForm_2.toJson())
          .then((response) async {
        if (response.statusCode == 302) {
          var url = response.headers['location']!;
          await http.get(Uri.parse(URL)).then((response) {
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

  Future<List<FeedbackForm_2>> getFeedbackList() async {
    return await http.get(Uri.parse(URL)).then((response) {
      var jsonFeedback = convert.jsonDecode(response.body) as List;
      return jsonFeedback.map((json) => FeedbackForm_2.fromJson(json)).toList();
    });
  }
}
