class FeedbackForm_4 {
  String name;
  String email;
  String mobileNo;
  String feedback;

  FeedbackForm_4(this.name, this.email, this.mobileNo, this.feedback);

  factory FeedbackForm_4.fromJson(dynamic json) {
    return FeedbackForm_4("${json['name']}", "${json['email']}",
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
