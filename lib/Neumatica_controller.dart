import 'dart:convert' as convert;

import 'package:app_la_buena/Neumatica_form.dart';
import 'package:http/http.dart' as http;

/// FormController is a class which does work of saving FeedbackForm in Google Sheets using
/// HTTP GET request on Google App Script Web URL and parses response and sends result callback.
class FormController {
  // Google App Script Web URL.
  static const String URL =
      "https://script.google.com/macros/s/AKfycby_0u5-ysY8kS8aVJtttpMP6XbU-LJ-d26kxTNgZYozxAHgPila7-ljeKKw8YYZsfi9jg/exec";

  // Success Status Message
  static const STATUS_SUCCESS = "SUCCESS";

  /// Async function which saves feedback, parses [feedbackForm] parameters
  /// and sends HTTP GET request on [URL]. On successful response, [callback] is called.
  void submitForm(
      FeedbackForm_3 feedbackForm_3, void Function(String?) callback) async {
    try {
      await http
          .post(Uri.parse(URL), body: feedbackForm_3.toJson())
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

  Future<List<FeedbackForm_3>> getFeedbackList() async {
    return await http.get(Uri.parse(URL)).then((response) {
      var jsonFeedback = convert.jsonDecode(response.body) as List;
      return jsonFeedback.map((json) => FeedbackForm_3.fromJson(json)).toList();
    });
  }
}
