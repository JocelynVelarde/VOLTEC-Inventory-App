import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

import 'Botiquin_form.dart';

/// el proposito del controlller form es que guarde todo la informacion de la app hacia el google sheets usando ->
/// el llamado de http get de google app script url usa parsing para la repuesta y manda un callback
class FormController {
  //web url del google app script.
  static const String URL =
      "https://script.google.com/macros/s/AKfycbxigNcdxeByjy9A93uHhII6RSRUdg1SpxBvcrObYowS6g2ANBQLdaj1D7F2H-OwY0BY/exec";

  // mensaje de yai si jalo
  static const STATUS_SUCCESS = "SUCCESS";

  /// async function que retorna informacion de tipo futuro, guarda el feedback y hace parsing en los parametros del feebackform
  /// y manda un http ger request en la url
  /// cuando esto jala entonces el callback es llamado
  void submitForm(
      FeedbackForm_4 feedbackForm_4, void Function(String?) callback) async {
    try {
      await http
          .post(Uri.parse(URL), body: feedbackForm_4.toJson())
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

  Future<List<FeedbackForm_4>> getFeedbackList() async {
    return await http.get(Uri.parse(URL)).then((response) {
      var jsonFeedback = convert.jsonDecode(response.body) as List;
      return jsonFeedback.map((json) => FeedbackForm_4.fromJson(json)).toList();
    });
  }
}
