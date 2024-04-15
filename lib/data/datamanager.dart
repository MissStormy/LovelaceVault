import 'dart:convert';
import 'dart:io';

import 'package:lovelacevault/data/documento.dart';

class DataManager {
  static Future<List<Document>> loadDocuments() async {
    try {
      final file = File('data/documents.json');
      if (!await file.exists()) {
        return [];
      }
      final jsonData = await file.readAsString();
      final List<dynamic> jsonList = json.decode(jsonData);
      return jsonList.map((json) => Document.fromJson(json)).toList();
    } catch (e) {
      print('Error al cargar los documentos: $e');
      return [];
    }
  }

  static Future<void> saveDocuments(List<Document> documents) async {
    try {
      final List<Map<String, dynamic>> jsonList =
          documents.map((doc) => doc.toJson()).toList();
      final file = File('json/documents.json');
      await file.writeAsString(json.encode(jsonList));
    } catch (e) {
      print('Error al guardar los documentos: $e');
    }
  }
}
