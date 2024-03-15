import 'package:lovelacevault/models/database.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Resource{
  int? id;
  late String isbn;
  late String title;
  late String author;
  late String year;
  late String type;
  late String resume;
  late String cites;
  late String reads;
  late String bytes;

  Resource(){
    isbn = '';
    title = '';
    author = '';
    year = '';
    type = '';
    resume = '';
    cites = '0';
    reads = '0';
    bytes = '0';
  }

  Resource.withoutId(
    this.isbn,
    this.title,
    this.author,
    this.year,
    this.type,
    this.resume,
    this.cites,
    this.reads,
    this.bytes
  );

  Resource.withId(
    this.id,
    this.isbn,
    this.title,
    this.author,
    this.year,
    this.type,
    this.resume,
    this.cites,
    this.reads,
    this.bytes
  );

  Resource.fromMap(Map<String, dynamic> map){
    id = (map['id'] != null) ? map['id'] : null;
    isbn = (map['isbn'] != null) ? map['isbn'] : '';
    title = (map['title'] != null) ? map['title'] : '';
    author = (map['author'] != null) ? map['author'] : '';
    year = (map['year'] != null) ? map['year'] : '';
    type = (map['type'] != null) ? map['type'] : '';
    resume = (map['resume'] != null) ? map['resume'] : '';
    cites = (map['cites'] != null) ? map['cites'] : '0';
    reads = (map['reads'] != null) ? map['reads'] : '0';
    bytes = (map['bytes'] != null) ? map['bytes'] : '0';
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    if (id != null) {
      map['id'] = id;
    }
    map['isbn'] = isbn;
    map['title'] = title;
    map['author'] = author;
    map['year'] = year;
    map['type'] = type;
    map['resume'] = resume;
    map['cites'] = cites;
    map['reads'] = reads;
    map['bytes'] = bytes;

    return map;
  }

  Future<List<Resource>> getResources() async{
    List<Resource> resources = [];
    //resources = await getFromApi();
    DBHelper dbHelper = DBHelper();
    List<Map<String, dynamic>> resourcesDB = await dbHelper.dbQuery('resource');
    for(int i = 0; i < resourcesDB.length; i++){
      resources.add(Resource.fromMap(resourcesDB[i]));
    }
    return resources;
  }

  Future<List<Resource>> searchResources(String query) async {
    List<Resource> matchingResources = [];
    DBHelper dbHelper = DBHelper();
    List<Map<String, dynamic>> resourcesDB = await dbHelper.dbQuery('resource');
    
    for (int i = 0; i < resourcesDB.length; i++) {
      Resource resource = Resource.fromMap(resourcesDB[i]);
      // Check if the query matches any field of the resource
      if (resource.title.toLowerCase().contains(query.toLowerCase()) ||
          resource.author.toLowerCase().contains(query.toLowerCase()) ||
          resource.isbn.toLowerCase().contains(query.toLowerCase())) {
        matchingResources.add(resource);
      }
    }
    return matchingResources;
  }

  saveResource(Resource resource) async {
    DBHelper dbHelper = DBHelper();
    dbHelper.dbInsert('resource', resource.toMap());
  }

}