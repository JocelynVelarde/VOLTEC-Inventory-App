class FeedbackForm_2 {
  String name;
  String email;
  String mobileNo;
  String feedback;

  FeedbackForm_2(this.name, this.email, this.mobileNo, this.feedback);

  factory FeedbackForm_2.fromJson(dynamic json) {
    return FeedbackForm_2("${json['name']}", "${json['email']}",
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
