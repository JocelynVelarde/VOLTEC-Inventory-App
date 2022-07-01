class FeedbackModel {
  String foto;
  String nombre;
  String marca;
  String cantidad;
  String comprar;

  var profilePic;

  FeedbackModel(
      {required this.foto,
      required this.nombre,
      required this.marca,
      required this.cantidad,
      required this.comprar});

  factory FeedbackModel.fromJson(dynamic json) {
    return FeedbackModel(
      foto: "${json['Foto']}",
      nombre: "${json['Nombre']}",
      marca: "${json['Marca']}",
      cantidad: "${json['Cantidad']}",
      comprar: "${json['Comprar']}",
    );
  }

  set sourceUrl(sourceUrl) {}

  set source(source) {}

  set feedback(feedback) {}

  set name(name) {}

  Map toJson() => {
        "Foto": foto,
        "Nombre": nombre,
        "Marca": marca,
        "Cantidad": cantidad,
        "Comprar": comprar,
      };
}
