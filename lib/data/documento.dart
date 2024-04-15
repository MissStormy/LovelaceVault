class Document {
  String nombre;
  String contenido;
  String formato;
  String fuente;
  double tamanyoFuente;

  Document({
    required this.nombre,
    required this.contenido,
    required this.formato,
    required this.fuente,
    required this.tamanyoFuente,
  });

  // Método para convertir un objeto Document a un mapa JSON
  Map<String, dynamic> toJson() {
    return {
      'nombre': nombre,
      'contenido': contenido,
      'formato': formato,
      'fuente': fuente,
      'tamañoFuente': tamanyoFuente,
    };
  }

  // Método para crear un objeto Document desde un mapa JSON
  factory Document.fromJson(Map<String, dynamic> json) {
    return Document(
      nombre: json['nombre'],
      contenido: json['contenido'],
      formato: json['formato'],
      fuente: json['fuente'],
      tamanyoFuente: json['tamañoFuente'],
    );
  }
}
