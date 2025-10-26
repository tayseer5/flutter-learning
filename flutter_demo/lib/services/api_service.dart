import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/book_model.dart';

class ApiService {
  static const _baseUrl = 'www.googleapis.com';
  static const _getBooksUrl = '/books/v1/volumes';
  static const _getBooksQueryParams = {'q': 'flutter'};

  Future<List<BookModel>> fetchBookList() async {
     final url = Uri.https(
     _baseUrl,
     _getBooksUrl,
     _getBooksQueryParams,
    );

    final responce = await http.get(url).timeout(const Duration(seconds: 10));
    if (responce.statusCode == 200) {
      final jsonData = json.decode(responce.body);
      final List items = jsonData['items'] ?? [];
      return items.map((e) => BookModel.fromJson(e as Map<String, dynamic>)).toList();
  } else {
    throw Exception('Failed to load books');
  }
}
}