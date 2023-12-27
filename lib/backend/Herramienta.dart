// ignore: file_names
class Herramienta {
  String nombre;
  String clave;
  String cantidad;
  String imagen;

  Herramienta({
    required this.nombre,
    required this.clave,
    required this.cantidad,
    required this.imagen,
  });

  factory Herramienta.fromGsheets(dynamic json) {
    return Herramienta(
      clave: json['Clave'],
      nombre: json['Nombre'],
      cantidad: json['Cantidad'],
      imagen: json['Imagen'],
    );
  }

  Map<String, dynamic> toGsheets() {
    return {
      'Nombre': nombre,
      'Clave': clave,
      'Cantidad': cantidad,
      'Imagen': imagen,
    };
  }
}
