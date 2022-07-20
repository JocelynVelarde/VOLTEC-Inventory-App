class FeedbackForm_5 {
  String name;
  String email;
  String mobileNo;
  String feedback;

  FeedbackForm_5(this.name, this.email, this.mobileNo, this.feedback);

  factory FeedbackForm_5.fromJson(dynamic json) {
    return FeedbackForm_5("${json['name']}", "${json['email']}",
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
