class FeedbackForm_7 {
  String name;
  String email;
  String mobileNo;
  String feedback;

  FeedbackForm_7(this.name, this.email, this.mobileNo, this.feedback);

  factory FeedbackForm_7.fromJson(dynamic json) {
    return FeedbackForm_7("${json['name']}", "${json['email']}",
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
