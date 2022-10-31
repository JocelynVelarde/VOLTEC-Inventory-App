//clase con todos los atributos del google app script
class FeedbackForm_4 {
  String name;
  String email;
  String mobileNo;
  String feedback;

  FeedbackForm_4(this.name, this.email, this.mobileNo, this.feedback);
//se crea un metodo factory  porque se quiere implementar un constructor que no requiere que se cree una nueva instancia de su clase
//el metodo se llama feedback form 4 lol
//el metodo tiene como objetivo deserializar el json
//osea toma los datos en bruto y los reconstruye en un modelo de objetos
//la cadena seria feedbackform.fromjson
//es dinamico porque puede ser de cualquier tipo
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
