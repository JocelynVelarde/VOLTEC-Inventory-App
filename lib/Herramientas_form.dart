/// FeedbackForm is a data class which stores data fields of Feedback.
class FeedbackForm {
  String clave;
  String nombre;
  String cantidad;
  String imagen;

  FeedbackForm(
    this.clave,
    this.nombre,
    this.cantidad,
    this.imagen,
  );

  factory FeedbackForm.fromJson(dynamic json) {
    return FeedbackForm(
      "${json['clave']}",
      "${json['nombre']}",
      "${json['cantidad']}",
      "${json['imagen']}",
    );
  }

  // Method to make GET parameters.
  Map toJson() => {
        'name': clave,
        'email': nombre,
        'mobileNo': cantidad,
        'feedback': imagen,
      };
}
