import 'dart:convert' as convert;

import 'package:app_la_buena/EV3_form.dart';
import 'package:http/http.dart' as http;

/// FormController is a class which does work of saving FeedbackForm in Google Sheets using
/// HTTP GET request on Google App Script Web URL and parses response and sends result callback.
class FormController {
  // Google App Script Web URL.
  static const String URL =
      "https://script.google.com/macros/s/AKfycby1ZYnNBkJIW11OEv-MooDS5k4j5cjto2MW-yMRBPr4E9O9_9m29krWtbAHX_A34d28KQ/exec";

  // Success Status Message
  static const STATUS_SUCCESS = "SUCCESS";

  /// Async function which saves feedback, parses [feedbackForm] parameters
  /// and sends HTTP GET request on [URL]. On successful response, [callback] is called.
  void submitForm(
      FeedbackForm_6 feedbackForm_6, void Function(String?) callback) async {
    try {
      await http
          .post(Uri.parse(URL), body: feedbackForm_6.toJson())
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

  Future<List<FeedbackForm_6>> getFeedbackList() async {
    return await http.get(Uri.parse(URL)).then((response) {
      var jsonFeedback = convert.jsonDecode(response.body) as List;
      return jsonFeedback.map((json) => FeedbackForm_6.fromJson(json)).toList();
    });
  }
}
