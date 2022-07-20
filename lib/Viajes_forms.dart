class FeedbackForm_8 {
  String name;
  String email;
  String mobileNo;
  String feedback;

  FeedbackForm_8(this.name, this.email, this.mobileNo, this.feedback);

  factory FeedbackForm_8.fromJson(dynamic json) {
    return FeedbackForm_8("${json['name']}", "${json['email']}",
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
