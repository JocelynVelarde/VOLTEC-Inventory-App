/// FeedbackForm is a data class which stores data fields of Feedback.
class FeedbackForm {
  String clave;
  String herramienta;
  String cantidad;
  String imagenUrl;
  String tienda;

  FeedbackForm(
      this.clave, this.herramienta, this.cantidad, this.imagenUrl, this.tienda);

  factory FeedbackForm.fromJson(dynamic json) {
    return FeedbackForm("${json['clave']}", "${json['herramienta']}",
        "${json['cantidad']}", "${json['imagenUrl']}", "${json['tienda']}");
  }

  // Method to make GET parameters.
  Map toJson() => {
        'clave': clave,
        'herramienta': herramienta,
        'cantidad': cantidad,
        'imagenUrl': imagenUrl,
        'tienda': tienda
      };
}
