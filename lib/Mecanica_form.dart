class FeedbackForm_1 {
  String name;
  String email;
  String mobileNo;
  String feedback;

  FeedbackForm_1(this.name, this.email, this.mobileNo, this.feedback);

  factory FeedbackForm_1.fromJson(dynamic json) {
    return FeedbackForm_1("${json['name']}", "${json['email']}",
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
