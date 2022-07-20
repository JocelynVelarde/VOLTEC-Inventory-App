class FeedbackForm_6 {
  String name;
  String email;
  String mobileNo;
  String feedback;

  FeedbackForm_6(this.name, this.email, this.mobileNo, this.feedback);

  factory FeedbackForm_6.fromJson(dynamic json) {
    return FeedbackForm_6("${json['name']}", "${json['email']}",
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
