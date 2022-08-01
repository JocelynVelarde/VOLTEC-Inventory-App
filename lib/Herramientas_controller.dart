import 'dart:convert' as convert;
// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;
import 'package:app_la_buena/Herramientas_form.dart';

/// FormController is a class which does work of saving FeedbackForm in Google Sheets using
/// HTTP GET request on Google App Script Web URL and parses response and sends result callback.
class FormController {
  // Google App Script Web URL.
  // ignore: constant_identifier_names
  static const String URL =
      "https://script.google.com/macros/s/AKfycbyru-7A_D0_WtfXnScgJMxUR_O-fWA_PbSXCrMlCwBwDWJNsshl1FUk0_fe_Rm9hPSEZA/exec";

  // Success Status Message
  // ignore: constant_identifier_names
  static const STATUS_SUCCESS = "SUCCESS";

  /// Async function which saves feedback, parses [feedbackForm] parameters
  /// and sends HTTP GET request on [URL]. On successful response, [callback] is called.
  void submitForm(
      FeedbackForm feedbackForm, void Function(String?) callback) async {
    try {
      await http
          .post(Uri.parse(URL), body: feedbackForm.toJson())
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
      // ignore: avoid_print
      print(e);
    }
  }

  Future<List<FeedbackForm>> getFeedbackList() async {
    return await http.get(Uri.parse(URL)).then((response) {
      var jsonFeedback = convert.jsonDecode(response.body) as List;
      return jsonFeedback.map((json) => FeedbackForm.fromJson(json)).toList();
    });
  }
}
