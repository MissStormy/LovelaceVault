import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class LocalApi {
  Future<List<Map<String, dynamic>>> fetchBooks() async {
    final response = await http.get(Uri.parse('http://localhost:3000/books'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return List<Map<String, dynamic>>.from(data);
    } else {
      throw Exception('Failed to load books');
    }
  }

  Future<Map<String, dynamic>> fetchBookById(int id) async {
    final response =
        await http.get(Uri.parse('http://localhost:3000/books/$id'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load book');
    }
  }
}
