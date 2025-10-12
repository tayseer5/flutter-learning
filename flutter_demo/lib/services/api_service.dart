import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/book_model.dart';

class ApiService {
  static const baseUrl = 'https://www.googleapis.com/books/v1/volumes?q=flutter';

  Future<List<BookModel>> fetchBookList() async {
    final url = Uri.parse(baseUrl);
    final responce = await http.get(url);
    if (responce.statusCode == 200) {
      final jsonData = json.decode(responce.body);
      final List items = jsonData['items'] ?? [];
      return items.map((e) => BookModel.fromJson(e)).toList();
  } else {
    throw Exception('Failed to load books');
  }
}
}