import 'package:lovelacevault/data/database.dart';
import 'dart:convert';

class Resource {
  int? id;
  late String title;
  late String author;
  late String type;
  late String summary;
  late String imagePath;
  late int bytes;
  late String location;

  // CONSTRUCTOR VACIO
  Resource() {
    title = '';
    author = '';
    type = '';
    summary = '';
    imagePath = '';
    bytes = 0;
  }

  //CONSTRUCTOR SIN ID
  Resource.withoutId(this.title, this.author, this.type, this.summary,
      this.imagePath, this.bytes, this.location);

  //CONSTRUCTOR CON ID
  Resource.withId(this.id, this.title, this.author, this.type, this.summary,
      this.imagePath, this.bytes, this.location);

  //RECEPCION DE DATOS Y COLOCACION EN MAP
  Resource.fromMap(Map<String, dynamic> map) {
    id = (map['id'] != null) ? map['id'] : null;
    title = (map['title'] != null) ? map['title'] : '';
    author = (map['author'] != null) ? map['author'] : '';
    type = (map['type'] != null) ? map['type'] : '';
    summary = (map['summary'] != null) ? map['summary'] : '';
    imagePath = (map['imagePath'] != null) ? map['imagePath'] : '';
    bytes = (map['bytes'] != null) ? map['bytes'] : 0;
  }

  //MAP
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    if (id != null) {
      map['id'] = id;
    }
    map['title'] = title;
    map['author'] = author;
    map['type'] = type;
    map['summary'] = summary;
    map['imagePath'] = imagePath;
    map['bytes'] = bytes;
    return map;
  }

  //SACAR LISTA
  Future<List<Resource>> getResources() async{
    List<Resource> resources = [];
    DBHelper dbHelper = DBHelper();
    List<Map<String, dynamic>> resourcesDB = await dbHelper.dbQuery('resources');
    for(int i = 0; i < resourcesDB.length; i++){
      resources.add(Resource.fromMap(resourcesDB[i]));
    }
    return resources;
  }

  //GUARDAR RECURSO
  saveResource(Resource resource) async {
    DBHelper dbHelper = DBHelper();
    dbHelper.dbInsert('resources', resource.toMap());
  }
}
