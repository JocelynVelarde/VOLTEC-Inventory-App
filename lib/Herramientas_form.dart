/// FeedbackForm is a data class which stores data fields of Feedback.
class FeedbackForm {
  String name;
  String email;
  String mobileNo;
  String feedback;
  String comprar;
  String prueba;

  FeedbackForm(this.name, this.email, this.mobileNo, this.feedback,
      this.comprar, this.prueba);

  factory FeedbackForm.fromJson(dynamic json) {
    return FeedbackForm(
        "${json['name']}",
        "${json['email']}",
        "${json['mobileNo']}",
        "${json['feedback']}",
        "${json['comprar']}",
        "${json['prueba']}");
  }

  // Method to make GET parameters.
  Map toJson() => {
        'name': name,
        'email': email,
        'mobileNo': mobileNo,
        'feedback': feedback,
        'comprar': comprar,
        'prueba': prueba
      };
}
