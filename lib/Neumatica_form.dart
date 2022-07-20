class FeedbackForm_3 {
  String name;
  String email;
  String mobileNo;
  String feedback;

  FeedbackForm_3(this.name, this.email, this.mobileNo, this.feedback);

  factory FeedbackForm_3.fromJson(dynamic json) {
    return FeedbackForm_3("${json['name']}", "${json['email']}",
        "${json['mobileNo']}", "${json['feedback']}");
  }

  // Method to make GET parameters.
  Map toJson() => {
        'name': name,
        'email': email,
        'mobileNo': mobileNo,
        'feedback': feedback
      };
}
