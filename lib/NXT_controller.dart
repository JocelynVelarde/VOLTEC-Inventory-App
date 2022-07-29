import 'dart:convert' as convert;

import 'package:app_la_buena/NXT_form.dart';
import 'package:http/http.dart' as http;

/// FormController is a class which does work of saving FeedbackForm in Google Sheets using
/// HTTP GET request on Google App Script Web URL and parses response and sends result callback.
class FormController {
  // Google App Script Web URL.
  static const String URL =
      "https://script.google.com/macros/s/AKfycbxoN89-L3M7O1y7VoS6B5GZXOSP7UT0JsI92tvoUjBVlUk7cXi24OMUYMZIr-A9BW-D_g/exec";

  // Success Status Message
  static const STATUS_SUCCESS = "SUCCESS";

  /// Async function which saves feedback, parses [feedbackForm] parameters
  /// and sends HTTP GET request on [URL]. On successful response, [callback] is called.
  void submitForm(
      FeedbackForm_7 feedbackForm_7, void Function(String?) callback) async {
    try {
      await http
          .post(URL as Uri, body: feedbackForm_7.toJson())
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

  Future<List<FeedbackForm_7>> getFeedbackList() async {
    return await http.get(URL as Uri).then((response) {
      var jsonFeedback = convert.jsonDecode(response.body) as List;
      return jsonFeedback.map((json) => FeedbackForm_7.fromJson(json)).toList();
    });
  }
}
